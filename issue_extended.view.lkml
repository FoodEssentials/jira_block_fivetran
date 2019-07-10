### ISSUE_EXTENDED
# The issue_extended table is designed to make it easier for
# end users to work with the issue table.  The issue table
# contains many foreign keys to other tables and many subsidiary
# tables that contain the values of multi value select fields.
# This PDT is designed to consolidate all of that data in one
# place without the user having to worry about fanouts from joining
# to tables with multiple matching rows or any of the other complexities
# of working with the issue table.
# If any of the fields in the issue table aren't used as part of
# your business process, set them to "hidden: yes" to limit what the
# end user has to work with to only what they need.
# Make liberal user of "group_label" to organize the data in a way
# that is meaningful for your users.  There can be lots of columns
# so make them as easy to work woth as possible.

include: "comment.view"

explore: issue_extended {
  join: comment {
    view_label: "Comment"
    type: left_outer
    sql_on: ${issue_extended.id} = ${comment.issue_id} ;;
    relationship: many_to_many
  }

  join: most_recent_comment {
    view_label: "Comment"
    type: left_outer
    sql_on: ${issue_extended.id} = ${most_recent_comment.issue_id} ;;
    relationship: many_to_many
  }
}

view: issue_extended {
  derived_table: {
    sql:
       SELECT
              issue.*,
               -- Include the values associated with foreign keys
               -- in the issue table
               -- if you add a field in this section, you will
               -- need to add another field to the GROUP BY clause
               -- You will also need to add each one as a new
               -- dimension below

               -- department_name is used as an example of a custom single
               -- value select field.  Use it as a template for your single
               -- select fields
               -- ,department.name as department_name
              _assignee.name as assignee_name,
              _bugcost.name as bug_cost_name,
              _bugpain.name as bug_pain_name,
              _bugspread.name as bug_spread_name,
              _client.name as client_name,
              _creator.name as creator_name,
              _cs_priority.name as cs_priority_name,
              _epic_link.name as epic_link_name,
              _epic_status.name as epic_status_name,
              _issue_type.name as issue_type_name,
              _priority.name as priority_name,
              project.name as project_name,
              _reporter.name as reporter_name,
              resolution.name as resolution_name,
              _sales_request.name as sales_request_name,
              severity.name as severity_name,
              status.name as status_name,
              _bugpriority.name as bug_priority_name,
              _bugseverity.name as bug_severity_name,
              _customer2.name as customer_name,
              _initiative.name as initiative_name,
              _manual_work.name as manual_work_name,
              _strategic_initiative.name as strategic_initiative_name,
              _purpose.name as purpose_name,
              _sales_lead.name as sales_lead_name,
              _label.value as label,
              _sprint.name as sprint_name,
              _product_type_name.name as product_type_name,
              _solution_name.name as solution_name,
              _potential_hic_name.name as potential_hic_name,
              _ongoing_hic_name.name as ongoing_hic_or_commitment_name,
              _hic_type.name as hic_or_commitment_type_name,
              _product_name.name AS product_name,

               -- Include all of the values for multi-value fields associated
               -- with the issue. Each of these fields is stored in its
               -- own separate table
               -- We will use LISTAGG to combine them into a
               -- single field so that we end up with a single record for
               -- each issue
               -- You will also need to add each one as a new
               -- dimension below
               -- Depending on your preferred output style, you may want to
               -- use LISTAGG DISTINCT to eliminate duplicate values

               -- supported_browsers is used as an example of a multi value
               -- select field.  Use it as a template for your multi-value
               -- select fields
               -- ,LISTAGG(issue_supported_browsers.value, ', ') as browser_list

               STRING_AGG(component.name, ', ') as component_list,
               STRING_AGG(version.name, ', ') as fix_version_list,
               STRING_AGG(CAST(issue_link.related_issue_id AS STRING), ', ') as related_issues_list

        FROM jira.issue issue

         -- Single value fields.
         -- If the field contains an id, look it up in the appropriate table.  Many of them will be in the field_option table.  The
         -- field_option table must have a unique alias each time it is referenced
        LEFT JOIN jira.user _assignee
          ON issue.assignee = _assignee.id

        LEFT JOIN jira.field_option _bugcost
          ON issue.bug_cost = _bugcost.id

        LEFT JOIN jira.field_option _bugpain
          ON issue.bug_pain = _bugpain.id

        LEFT JOIN jira.field_option _bugspread
          ON issue.bug_spread = _bugspread.id

        LEFT JOIN jira.field_option _client
          ON issue.client = _client.id

        LEFT JOIN jira.user _creator
          ON issue.creator = _creator.id

        LEFT JOIN jira.field_option _cs_priority
          ON issue.cs_priority = _cs_priority.id

        LEFT JOIN jira.epic _epic_link
          ON issue.epic_link = _epic_link.id

        LEFT JOIN jira.field_option _epic_status
          ON issue.epic_status = _epic_status.id

        LEFT JOIN jira.issue_type _issue_type
          ON issue.issue_type = _issue_type.id

        LEFT JOIN jira.priority _priority
          ON issue.priority = _priority.id

        LEFT JOIN jira.project
          ON issue.project = project.id

        LEFT JOIN jira.user _reporter
          ON issue.reporter = _reporter.id

        LEFT JOIN jira.resolution resolution
          ON issue.resolution = resolution.id

        LEFT JOIN jira.field_option _sales_request
          ON issue.sales_request = _sales_request.id

        LEFT JOIN jira.field_option severity
            ON issue.severity = severity.id

        LEFT JOIN jira.status
            ON issue.status = status.id

        LEFT JOIN jira.field_option _bugpriority
            ON issue.bug_priority = _bugpriority.id

        LEFT JOIN jira.field_option _bugseverity
            ON issue.bug_severity = _bugseverity.id

        LEFT JOIN jira.field_option _initiative
            ON issue.initiative = _initiative.id

        LEFT JOIN jira.field_option _manual_work
            ON issue.manual_work = _manual_work.id

        LEFT JOIN jira.field_option _strategic_initiative
            ON issue.strategic_initiative = _strategic_initiative.id

        LEFT JOIN jira.field_option _purpose
            ON issue.purpose = _purpose.id

        LEFT JOIN jira.user _sales_lead
          ON issue.sales_lead = _sales_lead.id

         -- Multi-value fields
         -- Multi vlaue field that stores ids.  In this example the issue_component table stores component_id's which are looked up in the component table
        LEFT JOIN jira.issue_component_s
            ON issue.id = issue_component_s.issue_id

        LEFT JOIN jira.component
            ON issue_component_s.component_id = component.id

        LEFT JOIN jira.issue_fix_version_s
            ON issue.id = issue_fix_version_s.issue_id

        LEFT JOIN jira.version
            ON issue_fix_version_s.version_id = version.id

        LEFT JOIN jira.issue_link
            ON issue.id = issue_link.issue_id

        LEFT JOIN jira.issue_customer _customer
            ON issue.id = _customer.issue_id

        LEFT JOIN jira.field_option _customer2
            ON _customer.field_option_id = _customer2.id

        LEFT JOIN jira.issue_labels _label
            ON issue.id = _label.issue_id

        LEFT JOIN jira.issue_sprint _issue_sprint
            ON issue.id = _issue_sprint.issue_id

        LEFT JOIN jira.sprint _sprint
            ON _issue_sprint.sprint_id = _sprint.id

        LEFT JOIN jira.issue_product_type _product_type
            ON issue.id = _product_type.issue_id

        LEFT JOIN jira.field_option _product_type_name
            ON _product_type.field_option_id = _product_type_name.id

        LEFT JOIN jira.issue_solution _solution
            ON issue.id = _solution.issue_id

        LEFT JOIN jira.field_option _solution_name
            ON _solution.field_option_id = _solution_name.id

        LEFT JOIN jira.issue_potential_hic _potential_hic
            ON issue.id = _potential_hic.issue_id

        LEFT JOIN jira.field_option _potential_hic_name
            ON _potential_hic.field_option_id = _potential_hic_name.id

        LEFT JOIN jira.issue_ongoing_hic_or_commitment _ongoing_hic
            ON issue.id = _ongoing_hic.issue_id

        LEFT JOIN jira.field_option _ongoing_hic_name
            ON _ongoing_hic.field_option_id = _ongoing_hic_name.id

        LEFT JOIN jira.field_option _hic_type
            ON issue.hic_or_commitment_type = _hic_type.id

        LEFT JOIN jira.issue_product _product
            ON issue.id = _product.issue_id

        LEFT JOIN jira.field_option _product_name
            ON _product.field_option_id = _product_name.id

        WHERE issue.key NOT IN (SELECT JSON_EXTRACT_SCALAR(issue, '$.key') FROM webhooks.jira_deleted_issue)

         -- Each non-aggregated field (not included in a LISTAGG) needs to
         -- be included in the GROUP BY clause, so that's every field in the
         -- issue table along with each additional single value field.

        GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
        24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,
        49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,
        74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,
        102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,
        124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140;;

    datagroup_trigger: fivetran_datagroup
    # indexes: ["id"]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
    hidden: yes
  }

  dimension: _original_estimate {
    type: number
    sql: ${TABLE}._original_estimate ;;
  }

  dimension: _remaining_estimate {
    type: number
    sql: ${TABLE}._remaining_estimate ;;
  }

  dimension: _time_spent {
    description: "Manually logged estimate of how many seconds were spent on the issue. Normally used for bugs and tasks."
    type: number
    sql: ${TABLE}._time_spent ;;
  }

  dimension: asana_link {
    type: string
    sql: ${TABLE}.asana_link ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: assignee_name {
    type: string
    sql: ${TABLE}.assignee_name ;;
  }

  dimension: bug_cost {
    type: number
    sql: ${TABLE}.bug_cost ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: bug_cost_name {
    type: string
    sql: ${TABLE}.bug_cost_name ;;
  }

  dimension: bug_pain {
    type: number
    sql: ${TABLE}.bug_pain ;;
    hidden: yes
  }

  #Extended dimension
  dimension: bug_pain_name {
    type: string
    sql: ${TABLE}.bug_pain_name ;;
  }

  dimension: bug_spread {
    type: number
    sql: ${TABLE}.bug_spread ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: bug_spread_name {
    type: string
    sql: ${TABLE}.bug_spread_name ;;
  }

  dimension: business_value {
    type: string
    sql: ${TABLE}.business_value ;;
  }

  dimension: change_risk {
    type: number
    sql: ${TABLE}.change_risk ;;
  }

  dimension_group: change_start {
    group_label: "Change"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.change_start_date ;;
  }

  dimension: change_type {
    group_label: "Change"
    type: number
    sql: ${TABLE}.change_type ;;
  }

  dimension: characteristic {
    type: string
    sql: ${TABLE}.characteristic ;;
  }

  dimension: client {
    type: number
    sql: ${TABLE}.client ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension_group: created {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}.creator ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: creator_name {
    type: string
    sql: ${TABLE}.creator_name ;;
  }

  dimension: cs_priority {
    type: number
    sql: ${TABLE}.cs_priority ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: cs_priority_name {
    label: "CS Priority Name"
    type: string
    sql: ${TABLE}.cs_priority_name ;;
  }

  dimension: current_value {
    type: string
    sql: ${TABLE}.current_value ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: end_users {
    type: string
    sql: ${TABLE}.end_users ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: epic_color {
    type: string
    sql: ${TABLE}.epic_color ;;
  }

  dimension: epic_link {
    type: number
    sql: ${TABLE}.epic_link ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: epic_link_name {
    type: string
    sql: ${TABLE}.epic_link_name ;;
  }

  dimension: epic_name {
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: epic_status {
    type: number
    sql: ${TABLE}.epic_status ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: epic_status_name {
    type: string
    sql: ${TABLE}.epic_status_name ;;
  }

  dimension: epic_theme {
    type: string
    sql: ${TABLE}.epic_theme ;;
  }

  dimension: flagged {
    type: number
    sql: ${TABLE}.flagged ;;
  }

  dimension: freshdesk_tickets {
    type: string
    sql: ${TABLE}.freshdesk_tickets ;;
  }

  dimension: impact {
    type: number
    sql: ${TABLE}.impact ;;
  }

  dimension: issue_type {
    type: number
    sql: ${TABLE}.issue_type ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: issue_type_name {
    type: string
    sql: ${TABLE}.issue_type_name ;;
  }

  dimension: jira_capture_browser {
    type: string
    sql: ${TABLE}.jira_capture_browser ;;
  }

  dimension: jira_capture_document_mode {
    type: string
    sql: ${TABLE}.jira_capture_document_mode ;;
  }

  dimension: jira_capture_j_query_version {
    type: string
    sql: ${TABLE}.jira_capture_j_query_version ;;
  }

  dimension: jira_capture_operating_system {
    type: string
    sql: ${TABLE}.jira_capture_operating_system ;;
  }

  dimension: jira_capture_screen_resolution {
    type: string
    sql: ${TABLE}.jira_capture_screen_resolution ;;
  }

  dimension: jira_capture_url {
    type: string
    sql: ${TABLE}.jira_capture_url ;;
  }

  dimension: jira_capture_user_agent {
    type: string
    sql: ${TABLE}.jira_capture_user_agent ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
    link: {
       label: "See in Jira"
       url: "https://labelinsight.atlassian.net/browse/{{value}}"
     }
  }

  dimension_group: last_viewed {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_viewed ;;
  }

  dimension: manufacturer {
    type: number
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}.model_type ;;
  }

  dimension: original_estimate {
    type: number
    sql: ${TABLE}.original_estimate ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: parent_link {
    type: number
    sql: ${TABLE}.parent_link ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  #Exteneded dimension
  dimension: priority_name {
    type: string
    sql: ${TABLE}.priority_name ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: project {
    type: number
    sql: ${TABLE}.project ;;
    hidden: yes
  }

  #Extended dimension
  dimension: project_name {
    label: "Current Project"
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: raised_during {
    type: string
    sql: ${TABLE}.raised_during ;;
  }

  dimension: remaining_estimate {
    type: number
    sql: ${TABLE}.remaining_estimate ;;
  }

  dimension: reporter {
    type: string
    sql: ${TABLE}.reporter ;;
    hidden: yes
  }

  #Extended dimension
  dimension: reporter_name {
    type: string
    sql: ${TABLE}.reporter_name ;;
  }

  dimension: resolution {
    group_label: "Resolution"
    type: number
    sql: ${TABLE}.resolution ;;
    hidden: yes
  }

  #Extended dimension
  dimension: resolution_name {
    group_label: "Resolution"
    type: string
    sql: ${TABLE}.resolution_name ;;
  }

  dimension_group: resolved {
    group_label: "Resolution"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.resolved ;;
  }

  dimension: response_type {
    type: number
    sql: ${TABLE}.response_type ;;
  }

  dimension: sales_request {
    type: number
    sql: ${TABLE}.sales_request ;;
    hidden: yes
  }

  #Extended dimension
  dimension: sales_request_name {
    type: string
    sql: ${TABLE}.sales_request_name ;;
  }

  dimension_group: satisfaction {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.satisfaction_date ;;
  }

  dimension: serial_number {
    type: string
    sql: ${TABLE}.serial_number ;;
  }

  dimension: severity {
    type: number
    sql: ${TABLE}.severity ;;
    hidden: yes
  }

  #Extended dimension
  dimension: severity_name {
    type: string
    sql: ${TABLE}.severity_name ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
    hidden: yes
  }

  #Extended dimension
  dimension: status_name {
    type: string
    sql: ${TABLE}.status_name ;;
  }

  dimension: status_comment {
    type: string
    sql: ${TABLE}.status_comment ;;
  }

  dimension: story_points {
    type: number
    sql: ${TABLE}.story_points ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}.target ;;
  }

  dimension: test_sessions {
    type: string
    sql: ${TABLE}.test_sessions ;;
  }

  dimension: testing_status {
    type: string
    sql: ${TABLE}.testing_status ;;
  }

  dimension: time_spent {
    type: number
    sql: ${TABLE}.time_spent ;;
    hidden: yes
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.upc ;;
  }

  dimension_group: updated {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated ;;
  }

  dimension: user_email_address {
    type: string
    sql: ${TABLE}.user_email_address ;;
  }

  dimension: work_ratio {
    type: number
    sql: ${TABLE}.work_ratio ;;
  }

  dimension: bug_priority {
    type: number
    sql: ${TABLE}.bug_priority ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: bug_priority_name {
    type: string
    sql: ${TABLE}.bug_priority_name ;;
  }

  dimension: bug_severity {
    type: number
    sql: ${TABLE}.bug_severity ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: bug_severity_name {
    type: string
    sql: ${TABLE}.bug_severity_name ;;
  }

  dimension_group: due {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: start {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: customer {
    type: number
    sql: ${TABLE}.customer ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: initiative {
    type: number
    sql: ${TABLE}.initiative ;;
    hidden: yes
  }

  #Exteneded dimension
  dimension: initiative_name {
    type: string
    sql: ${TABLE}.initiative_name ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: manual_work {
    type: number
    sql: ${TABLE}.manual_work ;;
    hidden: yes
  }

  #Extended dimension
  dimension: manual_work_name {
    type: string
    sql: ${TABLE}.manual_work_name ;;
  }

  dimension: strategic_initiative {
    type: number
    sql: ${TABLE}.strategic_initiative ;;
    hidden: yes
  }

  #Extended dimension
  dimension: strategic_initiative_name {
    type: string
    sql: ${TABLE}.strategic_initiative_name ;;
  }

  dimension: purpose {
    type: number
    sql: ${TABLE}.purpose ;;
    hidden: yes
  }

  #Extended dimension
  dimension: purpose_name {
    type: string
    sql: ${TABLE}.purpose_name ;;
  }

  dimension: prospect {
    type: string
    sql: ${TABLE}.prospect ;;
  }

  dimension: sales_lead {
    type: string
    sql: ${TABLE}.sales_lead ;;
    hidden: yes
  }

  #Extended dimension
  dimension: sales_lead_name {
    type: string
    sql: ${TABLE}.sales_lead_name ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: salesforce_opportunity_link {
    type: string
    sql: ${TABLE}.salesforce_opportunity_link ;;
  }

  dimension: story_point_estimate {
    type: number
    sql: ${TABLE}.story_point_estimate ;;
  }

  dimension: development {
    type: string
    sql: ${TABLE}.development ;;
    hidden: yes
  }

  dimension_group: projected_date {
    group_label: "Dates"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.projected_date ;;
  }

  dimension: zendesk_ticket_ids {
    type: string
    sql: ${TABLE}.zendesk_ticket_ids ;;
  }

  dimension: solutions_consultant {
    type: string
    sql: ${TABLE}.solutions_consultant ;;
  }

  dimension: issue_color {
    type: string
    sql: ${TABLE}.issue_color ;;
  }

  dimension: product_type {
    type: number
    sql: ${TABLE}.product_type ;;
    hidden: yes
  }

  #Extended dimension
  dimension: product_type_name {
    type: string
    sql: ${TABLE}.product_type_name ;;
  }

  dimension: solution {
    type: number
    sql: ${TABLE}.solution ;;
    hidden: yes
  }

  #Extended dimension
  dimension: solution_name {
    type: string
    sql: ${TABLE}.solution_name ;;
  }

  dimension: potential_hic {
    type: number
    sql: ${TABLE}.potential_hic ;;
    hidden: yes
  }

  #Extended dimension
  dimension: potential_hic_name {
    type: number
    sql: ${TABLE}.potential_hic_name ;;
  }

  dimension: ongoing_hic_or_commitment {
    type: number
    sql: ${TABLE}.ongoing_hic_or_commitment ;;
    hidden: yes
  }

  #Extended dimension
  dimension: ongoing_hic_or_commitment_name {
    label: "Ongoing HIC or Commitment Name"
    type: number
    sql: ${TABLE}.ongoing_hic_or_commitment_name ;;
  }

  dimension: hic_or_commitment_type {
    type: number
    sql: ${TABLE}.hic_or_commitment_type ;;
    hidden: yes
  }

  #Extended dimension
  dimension: hic_or_commitment_type_name {
    label: "HIC or Commitment Type Name"
    type: number
    sql: ${TABLE}.hic_or_commitment_type_name ;;
  }

  ## Additional dimensions for the LISTAGGS defined
  ## in the query

  dimension: browser_list {
    type: string
    sql: ${TABLE}.browser_list ;;
  }

  dimension: component_list {
    type: string
    sql: ${TABLE}.component_list ;;
  }

  dimension: fix_version_list {
    type: string
    sql: ${TABLE}.fix_version_list ;;
  }

  dimension: related_issues_list {
    type: string
    sql: ${TABLE}.related_issues_list ;;
  }

  dimension: sprint_name {
    type: string
    sql: ${TABLE}.sprint_name ;;
  }

  dimension: product_name {
    label: "Product"
    sql: ${TABLE}.product_name ;;
  }

  # ----- Added Dimensions ------
  dimension: is_issue_resolved {
    group_label: "Resolution"
    description: "The issues that is resolved (resolved date is not NULL)"
    type: yesno
    sql: ${resolved_date} IS NOT NULL;;
  }

  dimension: is_issue_done_complete {
    group_label: "Resolution"
    description: "The issues that is resolved (resolved date is not NULL) and have a status as 'Done' or 'Ticket Closed'. This is to differentiate resolved issues that is truly done, and resolved issues that are user error, duplicate, rejected, incomplete, cannot reproduce, etc."
    type: yesno
    sql: ${resolved_date} IS NOT NULL AND (${status_name} = 'Done' OR ${status_name} = 'Ticket Closed');;
  }

  # Custom dimensions for time to resolve issue
  dimension: hours_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Hours)"
    type: number
    sql: TIMESTAMP_DIFF(${resolved_raw}, ${created_raw}, HOUR) ;;
    value_format_name: decimal_0
  }

  dimension: minutes_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Minutes)"
    type: number
    sql: TIMESTAMP_DIFF(${resolved_raw}, ${created_raw}, MINUTE) ;;
    value_format_name: decimal_0
  }

  dimension: days_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Days)"
    type: number
    sql: DATE_DIFF(${resolved_date}, ${created_date}, DAY) ;;
    value_format_name: decimal_0
  }


  # ----- Measures ------
  measure: total_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Total Hours to Resolve Issues per Grouping"
    description: "The total hours required to resolve all issues in the chosen dimension grouping"
    type: sum
    sql: ${hours_to_resolve_issue};;
    value_format_name: decimal_0
  }

  measure: avg_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Avg Hours to Resolve Issues per Grouping"
    description: "The average hours required to resolve all issues in the chosen dimension grouping"
    type: average
    sql: ${hours_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: total_story_points {
    type: sum
    sql: ${story_points} ;;
  }

  measure: total_open_story_points {
    description: "To Do, Backlog, Parking Lot, In Progress, Code Review, Review. Excluding Duplicate, Rejected."
    type: sum
    sql: ${story_points} ;;
    filters: {
      field: status_name
      value:"To Do, Backlog, Parking Lot, In Progress, Code Review, Review"
    }
  }

  measure: total_closed_story_points {
    description: "Done, Sign Off. Excluding Duplicate, Rejected."
    type: sum
    sql: ${story_points} ;;
    filters: {
      field: status_name
      value:"Done, Sign Off"
    }
  }

  measure: count {
    type: count_distinct
    sql: ${key} ;;
    drill_fields: [detail*]
  }

  measure: total_time_spent {
    label: "Total time spent in hour"
    description: "Estimated total seconds spent on an issue. Typically only entered for 'Bug' and 'Task' type issues."
    type: sum
    sql: ${_time_spent}/3600 ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: avg_issue_age {
    label: "Average Issue Age (Days)"
    type: average
    value_format: "0"
    sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY) ;;
  }

  dimension: issue_age_group {
    case: {
      when: {
        sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY)  <= 14 ;;
        label: "0-14 days"
      }
      when: {
        sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY)  >= 15 AND DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY)  <= 30;;
        label: "15-30 days"
      }
      when: {
        sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY)  >= 31 AND DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY)  <= 60;;
        label: "31-60 days"
      }
      when: {
        sql: DATE_DIFF(CURRENT_DATE(), ${created_date}, DAY)  > 60 ;;
        label: ">60 days"
      }
    }
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      key, summary, status_name, priority_name, bug_priority_name, bug_severity_name, customer_name, updated_date
    ]
  }
}
