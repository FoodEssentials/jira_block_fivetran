# This PDT is used to produce a single list of all historical changes in issues
# It is used for displaying a complete list of the history of an issue in
# the Issue Details Dashboard.
# It is made by Unioning together all of the history tables
# Each table has an additional hard coded value aliased as "changed"
# to indicate the value that was changed

# The examples below are to be used as a template and will not
# match the history tables in your installation

view: issue_history_all {
  derived_table: {
    sql:
      SELECT ph.issue_id, ph.time, p.name AS value, 'Project' AS changed
      FROM jira.issue_project_history ph
      LEFT JOIN jira.project p ON ph.project_id = p.id

      UNION ALL

      SELECT fix_version.issue_id, fix_version.time, version.name AS value, 'Fix Version' AS changed
      FROM jira.issue_fix_version_history fix_version
         LEFT JOIN jira.version version
           ON fix_version.version_id = version.id

      UNION ALL

      SELECT issuetype.issue_id, issuetype.time, issue_type.name AS value, 'Type' AS changed
      FROM jira.issue_issuetype_history issuetype
         LEFT JOIN jira.issue_type issue_type
           ON issuetype.issue_type_id = issue_type.id

      UNION ALL

      SELECT priority.issue_id, priority.time, pri.name AS value, 'Priority' AS changed
      FROM jira.issue_priority_history priority
         LEFT JOIN jira.priority pri
           ON priority.priority_id = pri.id

      UNION ALL

      SELECT resolution.issue_id, resolution.time, r.name AS value, 'Resolution' AS changed
      FROM jira.issue_resolution_history resolution
         LEFT JOIN jira.resolution r
           ON resolution.resolution_id = r.id

      UNION ALL

      SELECT sprint.issue_id, sprint.time, s.name AS value, 'Sprint' AS changed
      FROM jira.issue_sprint_history sprint
         LEFT JOIN jira.sprint s
           ON sprint.sprint_id = s.id

      UNION ALL

      SELECT status.issue_id, status.time, s.name AS value, 'Status' AS changed
      FROM jira.issue_status_history status
         LEFT JOIN jira.status s
           ON status.status_id = s.id

      UNION ALL

      SELECT component_history.issue_id, component_history.time, component.name AS value, 'Component' AS changed
      FROM jira.issue_component_history component_history
         LEFT JOIN jira.component component
           ON component_history.component_id = component.id

      UNION ALL

      SELECT epic_link.issue_id, epic_link.time, epic.name AS value, 'Epic Link' AS changed
      FROM jira.issue_epic_link_history  epic_link
         LEFT JOIN jira.epic epic
           ON epic_link.epic_id = epic.id

      {% assign single_select_fields = 'bug_cost,bug_pain,bug_priority,bug_severity,bug_spread,change_reason,change_risk,change_type,client,contractual,cs_priority,customer,epic_status,flagged,hic_or_commitment_type,impact,manual_work,manufacturer,ongoing_hic_or_commitment,platform_tool,potential_hic,product,product_type,products,purpose,reportable,response_type,sales_request,solution,strategic_initiative,value' | split:',' %}
      {% for field_name in single_select_fields %}
      UNION ALL

      SELECT {{field_name}}.issue_id, {{field_name}}.time, {{field_name}}_field_option.name AS value, "{{ field_name | replace:'_',' ' | capitalize }}" AS changed
      FROM jira.issue_{{field_name}}_history AS {{field_name}}
      LEFT JOIN jira.field_option AS {{field_name}}_field_option ON {{field_name}}.field_option_id = {{field_name}}_field_option.id
      {% endfor %}

      {% assign text_fields = 'asana_link,brand,business_value,characteristic,current_value,description,development,end_users,environment,epic_color,epic_name,epic_theme,expected_value,freshdesk_tickets,issue_color,labels,model_type,product_description,product_id,prospect,salesforce_opportunity_link,serial_number,status_comment,summary,target,text,upc,user_email_address,zendesk_ticket_ids,change_completion_date,change_start_date,created,due_date,duedate,last_viewed,projected_date,resolutiondate,resolved,satisfaction_date,start_date,status_category_changed,this_week,updated,original_estimate,remaining_estimate,story_point_estimate,story_points,time_spent,timeestimate,timeoriginalestimate,timespent,work_ratio' | split:',' %}
      {% for field_name in text_fields %}
      UNION ALL

      SELECT {{field_name}}.issue_id, {{field_name}}.time, CAST({{field_name}}.value AS STRING), "{{ field_name | replace:'_',' ' | capitalize }}" AS changed
      FROM jira.issue_{{field_name}}_history AS {{field_name}}
      {% endfor %}

      {% assign user_fields = 'approvers,assignee,creator,cs_representative,reporter,request_participants,sales_lead,solutions_consultant' | split:',' %}
      {% for field_name in user_fields %}
      UNION ALL

      SELECT {{field_name}}.issue_id, {{field_name}}.time, {{field_name}}_user.name, "{{ field_name | replace:'_',' ' | capitalize }}" AS changed
      FROM jira.issue_{{field_name}}_history AS {{field_name}}
      LEFT JOIN jira.user AS {{field_name}}_user ON {{field_name}}.user_id = {{field_name}}_user.id
      {% endfor %} ;;

    datagroup_trigger: fivetran_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id;;
  }

  dimension_group: time {
    type: time
    sql: ${TABLE}.time ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: changed {
    type: string
    sql: ${TABLE}.changed ;;
  }

  set: detail {
    fields: [issue_id, time_time, value, changed]
  }
}

### This query returns lists of custom field names to be put in the liquid variables for 'issue_history_all'
view: history_fields_metadata {
  derived_table: {
    sql:
      SELECT
        column_name,
        data_type,
        COUNT(DISTINCT table_name) AS num_tables,
        STRING_AGG(REGEXP_REPLACE(table_name, r'(^issue_|_history$)', ''), ',' ORDER BY table_name) AS table_list
      FROM
        (
          SELECT
            table_name,
            column_name,
            data_type
          FROM
            jira.INFORMATION_SCHEMA.COLUMNS
          WHERE
            table_name LIKE 'issue%history'
            AND column_name NOT IN ('_fivetran_id', '_fivetran_synced', 'issue_id', 'time')
        )
      GROUP BY 1,2
      ORDER BY num_tables DESC ;;
  }
}
