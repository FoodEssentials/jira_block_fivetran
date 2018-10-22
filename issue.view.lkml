view: issue {
  sql_table_name: jira.issue ;;

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
  }

  dimension: bug_cost {
    type: number
    sql: ${TABLE}.bug_cost ;;
  }

  dimension: bug_pain {
    type: number
    sql: ${TABLE}.bug_pain ;;
  }

  dimension: bug_priority {
    type: number
    sql: ${TABLE}.bug_priority ;;
  }

  dimension: bug_severity {
    type: number
    sql: ${TABLE}.bug_severity ;;
  }

  dimension: bug_spread {
    type: number
    sql: ${TABLE}.bug_spread ;;
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
  }

  dimension_group: created {
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
  }

  dimension: cs_priority {
    type: number
    sql: ${TABLE}.cs_priority ;;
  }

  dimension: current_value {
    type: string
    sql: ${TABLE}.current_value ;;
  }

  dimension: customer {
    type: number
    sql: ${TABLE}.customer ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: due {
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
  }

  dimension: epic_name {
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: epic_status {
    type: number
    sql: ${TABLE}.epic_status ;;
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

  dimension: initiative {
    type: number
    sql: ${TABLE}.initiative ;;
  }

  dimension: issue_type {
    type: number
    sql: ${TABLE}.issue_type ;;
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
  }

  dimension_group: last_viewed {
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

  dimension: manual_work {
    type: number
    sql: ${TABLE}.manual_work ;;
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

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: products {
    type: number
    sql: ${TABLE}.products ;;
  }

  dimension: project {
    type: number
    sql: ${TABLE}.project ;;
  }

  dimension: prospect {
    type: string
    sql: ${TABLE}.prospect ;;
  }

  dimension: purpose {
    type: number
    sql: ${TABLE}.purpose ;;
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
  }

  dimension: resolution {
    type: number
    sql: ${TABLE}.resolution ;;
  }

  dimension_group: resolved {
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

  dimension: sales_lead {
    type: string
    sql: ${TABLE}.sales_lead ;;
  }

  dimension: sales_request {
    type: number
    sql: ${TABLE}.sales_request ;;
  }

  dimension: salesforce_opportunity_link {
    type: string
    sql: ${TABLE}.salesforce_opportunity_link ;;
  }

  dimension_group: satisfaction {
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
  }

  dimension_group: start {
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

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: status_comment {
    type: string
    sql: ${TABLE}.status_comment ;;
  }

  dimension: story_points {
    type: number
    sql: ${TABLE}.story_points ;;
  }

  dimension: strategic_initiative {
    type: number
    sql: ${TABLE}.strategic_initiative ;;
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
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.upc ;;
  }

  dimension_group: updated {
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

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: work_ratio {
    type: number
    sql: ${TABLE}.work_ratio ;;
  }

# ----- Added Dimension ------
  dimension: is_issue_resolved {
    group_label: "Resolution"
    type: yesno
    sql: ${resolved_date} IS NOT NULL ;;
  }

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
    sql: DATE_DIFF(DATE(${resolved_raw}), DATE(${created_raw}), MONTH) ;;
    value_format_name: decimal_0
  }

  dimension: days_to_resolve_issue {
    group_label: "Resolution"
    label: "Time to Resolve (Days)"
    type: number
    sql: DATE_DIFF(DATE(${resolved_raw}), DATE(${created_raw}), DAY) ;;
    value_format_name: decimal_0
  }

  # ----- Measures ------
  measure: total_time_spent {
    type: sum
    sql: ${_time_spent} ;;
  }

  measure: total_hours_spent {
    type: sum
    sql: ${_time_spent} / 3600 ;;
  }

  measure: total_time_to_resolve_issues_days {
    group_label: "Resolution"
    label: "Total Days to Resolve Issues per Grouping"
    description: "The total days required to resolve all issues in the chosen dimension grouping"
    type: sum
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: avg_time_to_resolve_issues_days {
    group_label: "Resolution"
    label: "Avg Days to Resolve Issues per Grouping"
    description: "The average days required to resolve all issues in the chosen dimension grouping"
    type: average
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: total_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Total Hours to Resolve Issues per Grouping"
    description: "The total hours required to resolve all issues in the chosen dimension grouping"
    type: sum
    sql: ${hours_to_resolve_issue} ;;
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

  measure: total_story_points_closed_within_sprint {
    type: sum
    sql:
      CASE WHEN ${resolved_date} >= ${sprint.start_date} AND ${resolved_date} <= ${sprint.complete_date}
      THEN ${story_points}
      ELSE NULL
      END;;
  }

  measure: count {
    type: count
    drill_fields: [id, days_to_resolve_issue, created_date, severity ]
  }
}
