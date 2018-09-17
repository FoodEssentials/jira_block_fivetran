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
      SELECT issue_id, time, value, 'Asana' AS changed
      FROM jira.issue_asana_link_history

      UNION ALL

      SELECT assignee.issue_id, assignee.time, user.name AS value, 'Assignee' AS changed
      FROM jira.issue_assignee_history assignee
        LEFT JOIN jira.user user
          ON assignee.user_id = user.id

      UNION ALL

      SELECT bug_pain.issue_id, bug_pain.time, field_option.name AS value, 'Bug Pain' AS changed
      FROM jira.issue_bug_pain_history bug_pain
        LEFT JOIN jira.field_option field_option
          ON bug_pain.field_option_id = field_option.id

      UNION ALL

      SELECT bug_priority.issue_id, bug_priority.time, field_option.name AS value, 'Bug Priority' AS changed
      FROM jira.issue_bug_priority_history bug_priority
        LEFT JOIN jira.field_option field_option
          ON bug_priority.field_option_id = field_option.id

      UNION ALL

      SELECT bug_severity.issue_id, bug_severity.time, field_option.name AS value, 'Bug Severity' AS changed
      FROM jira.issue_bug_severity_history bug_severity
        LEFT JOIN jira.field_option field_option
          ON bug_severity.field_option_id = field_option.id

      UNION ALL

      SELECT bug_spread.issue_id, bug_spread.time, field_option.name AS value, 'Bug Spread' AS changed
      FROM jira.issue_bug_spread_history bug_spread
        LEFT JOIN jira.field_option field_option
          ON bug_spread.field_option_id = field_option.id

      UNION ALL

      SELECT issue_id, time, value, 'Business Value' AS changed
      FROM jira.issue_business_value_history

      UNION ALL

      SELECT client_history.issue_id, client_history.time, field_option.name AS value, 'Client' AS changed
      FROM jira.issue_client_history client_history
        LEFT JOIN jira.field_option field_option
          ON client_history.field_option_id = field_option.id

      UNION ALL

      SELECT component_history.issue_id, component_history.time, component.name AS value, 'Component' AS changed
      FROM jira.issue_component_history component_history
        LEFT JOIN jira.component component
          ON component_history.component_id = component.id

      UNION ALL

      SELECT cs_priority.issue_id, cs_priority.time, field_option.name AS value, 'CS Priority' AS changed
      FROM jira.issue_cs_priority_history cs_priority
        LEFT JOIN jira.field_option field_option
          ON cs_priority.field_option_id = field_option.id

      UNION ALL

      SELECT customer_history.issue_id, customer_history.time, field_option.name AS value, 'Customer' AS changed
      FROM jira.issue_customer_history customer_history
        LEFT JOIN jira.field_option field_option
          ON customer_history.field_option_id = field_option.id

      UNION ALL

      SELECT issue_id, time, value, 'Description' AS changed
      FROM jira.issue_description_history

      UNION ALL

      SELECT issue_id, time, CAST(value AS STRING) AS value, 'Due Date' AS changed
      FROM jira.issue_duedate_history

      UNION ALL

      SELECT issue_id, time, value, 'Environment' AS changed
      FROM jira.issue_environment_history

      UNION ALL

      SELECT issue_id, time, value, 'Epic Color' AS changed
      FROM jira.issue_epic_color_history

      UNION ALL

      SELECT epic_link.issue_id, epic_link.time, epic.name AS value, 'Epic Link' AS changed
      FROM jira.issue_epic_link_history  epic_link
        LEFT JOIN jira.epic epic
          ON epic_link.epic_id = epic.id

      UNION ALL

      SELECT issue_id, time, value, 'Epic Name' AS changed
      FROM jira.issue_epic_name_history

      UNION ALL

      SELECT epic_status.issue_id, epic_status.time, field_option.name AS value, 'Epic Status' AS changed
      FROM jira.issue_epic_status_history epic_status
        LEFT JOIN jira.field_option field_option
          ON epic_status.field_option_id = field_option.id

      UNION ALL

      SELECT fix_version.issue_id, fix_version.time, version.name AS value, 'Fix Version' AS changed
      FROM jira.issue_fix_version_history fix_version
        LEFT JOIN jira.version version
          ON fix_version.version_id = version.id

      UNION ALL

      SELECT flagged.issue_id, flagged.time, field_option.name AS value, 'Flagged' AS changed
      FROM jira.issue_flagged_history flagged
        LEFT JOIN jira.field_option field_option
          ON flagged.field_option_id = field_option.id

      UNION ALL

      SELECT issue_id, time, value, 'Freshdesk Tickets' AS changed
      FROM jira.issue_freshdesk_tickets_history

      UNION ALL

      SELECT issuetype.issue_id, issuetype.time, issue_type.name AS value, 'Type' AS changed
      FROM jira.issue_issuetype_history issuetype
        LEFT JOIN jira.issue_type issue_type
          ON issuetype.issue_type_id = issue_type.id

      UNION ALL

      SELECT issue_id, time, value, 'Labels' AS changed
      FROM jira.issue_labels_history

      UNION ALL

      SELECT priority.issue_id, priority.time, pri.name AS value, 'Priority' AS changed
      FROM jira.issue_priority_history priority
        LEFT JOIN jira.priority pri
          ON priority.priority_id = pri.id

      UNION ALL

      SELECT products.issue_id, products.time, field_option.name AS value, 'Products' AS changed
      FROM jira.issue_products_history products
        LEFT JOIN jira.field_option field_option
          ON products.field_option_id = field_option.id

      UNION ALL

      SELECT ph.issue_id, ph.time, p.name AS value, 'Project' AS changed
      FROM jira.issue_project_history ph
        LEFT JOIN jira.project p
          ON ph.project_id = p.id

      UNION ALL

      SELECT reporter.issue_id, reporter.time, user.name AS value, 'Reporter' AS changed
      FROM jira.issue_reporter_history reporter
        LEFT JOIN jira.user user
          ON reporter.user_id = user.id

      UNION ALL

      SELECT resolution.issue_id, resolution.time, r.name AS value, 'Resolution' AS changed
      FROM jira.issue_resolution_history resolution
        LEFT JOIN jira.resolution r
          ON resolution.resolution_id = r.id

      UNION ALL

      SELECT sales.issue_id, sales.time, field_option.name AS value, 'Sales Request' AS changed
      FROM jira.issue_sales_request_history sales
        LEFT JOIN jira.field_option field_option
          ON sales.field_option_id = field_option.id

      UNION ALL

      SELECT sprint.issue_id, sprint.time, s.name AS value, 'Sprint' AS changed
      FROM jira.issue_sprint_history sprint
        LEFT JOIN jira.sprint s
          ON sprint.sprint_id = s.id

      UNION ALL

      SELECT issue_id, time, CAST(value AS STRING) AS value, 'Start Date' AS changed
      FROM jira.issue_start_date_history

      UNION ALL

      SELECT issue_id, time, value, 'Status Comment' AS changed
      FROM jira.issue_status_comment_history

      UNION ALL

      SELECT status.issue_id, status.time, s.name AS value, 'Status' AS changed
      FROM jira.issue_status_history status
        LEFT JOIN jira.status s
          ON status.status_id = s.id

      UNION ALL

      SELECT issue_id, time, CAST(value AS STRING) AS value, 'Story Points' AS changed
      FROM jira.issue_story_points_history

      UNION ALL

      SELECT strategic.issue_id, strategic.time, field_option.name AS value, 'Strategic Initiative' AS changed
      FROM jira.issue_strategic_initiative_history strategic
        LEFT JOIN jira.field_option field_option
          ON strategic.field_option_id = field_option.id

      UNION ALL

      SELECT issue_id, time, value, 'Summary' AS changed
      FROM jira.issue_summary_history

      UNION ALL

      SELECT issue_id, time, value, 'Target' AS changed
      FROM jira.issue_target_history

      UNION ALL

      SELECT issue_id, time, CAST(value AS STRING) AS value, 'Time Estimate' AS changed
      FROM jira.issue_timeestimate_history

      UNION ALL

      SELECT issue_id, time, CAST(value AS STRING) AS value, 'Time Original Estimate' AS changed
      FROM jira.issue_timeoriginalestimate_history

      UNION ALL

      SELECT issue_id, time, CAST(value AS STRING) AS value, 'Time Spent' AS changed
      FROM jira.issue_timespent_history

      UNION ALL

      SELECT value.issue_id, value.time, field_option.name AS value, 'Value' AS changed
      FROM jira.issue_value_history value
        LEFT JOIN jira.field_option field_option
          ON value.field_option_id = field_option.id
;;

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
    suggestions: ["Asana", "Assignee", "Bug Pain", "Bug Priority", "Bug Severity", "Bug Spread", "Business Value",
      "Client", "Component", "CS Priority", "Customer", "Description", "Due Date", "Environment", "Epic Color",
      "Epic Link", "Epic Name", "Epic Status", "Fix Version", "Flagged", "Freshdesk Tickets", "Type", "Labels", "Priority", "Products", "Project", "Reporter",
      "Resolution", "Sales Request", "Sprint", "Start Date", "Status Comment", "Status", "Story Points", "Strategic Initiative", "Summary", "Target", "Time Estimate",
      "Time Original Estimate", "Time Spent", "Value"]
  }

  set: detail {
    fields: [issue_id, time_time, value, changed]
  }
}
