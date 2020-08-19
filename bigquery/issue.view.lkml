view: issue {
  sql_table_name: jira.issue ;;

  set: detail {
    fields: [
      key, summary, status.name, priority.name, bug_priority.name, bug_severity.name, customer.name, updated_date
    ]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
    hidden: yes
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

  dimension: bug_cost {
    type: number
    sql: ${TABLE}.bug_cost ;;
    hidden: yes
  }

  dimension: bug_pain {
    type: number
    sql: ${TABLE}.bug_pain ;;
    hidden: yes
  }

  dimension: bug_spread {
    type: number
    sql: ${TABLE}.bug_spread ;;
    hidden: yes
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

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      day_of_week_index,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension_group: jira_created_start_of_business {
    type: time
    timeframes: [
      raw,
      day_of_week,
      hour_of_day,
      time,
      date,
      week,
      day_of_week_index,
      month,
      quarter,
      year
    ]
    sql:
      CASE
        -- M-Th after 5pm = next day 9am
        WHEN
          ${created_day_of_week_index} IN (0,1,2,3) AND ${created_hour_of_day} > 16
        THEN
          TIMESTAMP( CONCAT( SAFE_CAST( DATE_ADD( ${created_date}, INTERVAL 1 DAY) AS STRING), " 09:00:00") )
        -- M-F before 9am = same day 9am
        WHEN
          ${created_day_of_week_index} IN (0,1,2,3,4) AND ${created_hour_of_day} < 9
        THEN
          TIMESTAMP( CONCAT( SAFE_CAST(${created_date} AS STRING), " 09:00:00") )
        -- F after 5pm and Sat = next Monday 9am
        WHEN
          (${created_day_of_week_index} IN (4) AND ${created_hour_of_day} > 16) OR ${created_day_of_week_index} IN (5,6)
        THEN
          TIMESTAMP( CONCAT( SAFE_CAST( DATE_ADD( ${created_date}, INTERVAL 7-${created_day_of_week_index} DAY) AS STRING), " 09:00:00") )
        ELSE
          ${created_raw}
      END
    ;;
    hidden: yes
  }

  dimension_group: jira_sla_due {
    label: "JIRA - SLA Due"
    group_label: "JIRA SLAs"
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
    sql:
      CASE
        WHEN
          ${bug_severity} = 10800
        THEN
          TIMESTAMP_ADD( ${created_raw}, INTERVAL 8 HOUR)
        WHEN
          ${bug_severity} = 10801
        THEN
          CASE
            WHEN ${jira_created_start_of_business_day_of_week_index} IN (0,1,2)
              THEN TIMESTAMP_ADD( ${jira_created_start_of_business_raw}, INTERVAL 2 DAY)
            ELSE
              TIMESTAMP_ADD( ${jira_created_start_of_business_raw}, INTERVAL 7-${jira_created_start_of_business_day_of_week_index} DAY)
          END
        WHEN
          ${bug_severity} = 10802
        THEN
          TIMESTAMP_ADD( ${jira_created_start_of_business_raw}, INTERVAL 14 DAY)
        WHEN
          ${bug_severity} = 10803
        THEN
          TIMESTAMP_ADD( ${jira_created_start_of_business_raw}, INTERVAL 28 DAY)
        ELSE
          NULL
      END
    ;;
  }

  dimension: jira_over_bug_severity_response_sla {
    label: "JIRA - Over JIRA Bug Severity SLA?"
    group_label: "JIRA SLAs"
    type: yesno
    sql:
    (${is_issue_resolved} AND ${resolved_raw} > ${jira_sla_due_raw})
    OR
    (${is_issue_resolved} AND CURRENT_TIMESTAMP() > ${jira_sla_due_raw})
    ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}.creator ;;
    hidden: yes
  }

  dimension: cs_priority {
    type: number
    sql: ${TABLE}.cs_priority ;;
    hidden: yes
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

  dimension: epic_name {
    type: string
    sql: ${TABLE}.epic_name ;;
  }

  dimension: epic_status {
    type: number
    sql: ${TABLE}.epic_status ;;
    hidden: yes
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

  dimension: number_of_impacted_products {
    description: "Defines the number of products that were impacted during an issue. Normally used for bugs."
    type: number
    sql: ${TABLE}.number_of_impacted_products ;;
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
    hidden: yes
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

  dimension: prospect {
    description: "An opportunity that will potentially turn into a customer, client, etc"
    type: string
    sql: ${TABLE}.prospect ;;
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

  dimension: resolution {
    type: number
    sql: ${TABLE}.resolution ;;
    hidden: yes
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

  dimension: sales_request {
    type: number
    sql: ${TABLE}.sales_request ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
    hidden: yes
  }

  dimension: status_comment {
    type: string
    sql: ${TABLE}.status_comment ;;
  }

  dimension: story_points {
    type: number
    sql: ${TABLE}.story_points ;;
  }

  dimension: story_point_is_null {
    type: yesno
    sql: ${story_points} IS NULL ;;
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
    label: "UPC"
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

  dimension: work_ratio {
    type: number
    sql: ${TABLE}.work_ratio ;;
  }

  dimension: bug_priority {
    type: number
    sql: ${TABLE}.bug_priority ;;
    hidden: yes
  }

  dimension: bug_severity {
    type: number
    sql: ${TABLE}.bug_severity ;;
    hidden: yes
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

  dimension: customer {
    type: number
    sql: ${TABLE}.customer ;;
    hidden: yes
  }

  dimension: initiative {
    type: number
    sql: ${TABLE}.initiative ;;
    hidden: yes
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

  dimension: products {
    type: number
    sql: ${TABLE}.products ;;
  }

  dimension: strategic_initiative {
    type: number
    sql: ${TABLE}.strategic_initiative ;;
    hidden: yes
  }

  dimension: purpose {
    type: number
    sql: ${TABLE}.purpose ;;
    hidden: yes
  }

  dimension: sales_lead {
    type: string
    sql: ${TABLE}.sales_lead ;;
    hidden: yes
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
    sql: ${TABLE}.solutions_consultant;;
    hidden: yes
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

  dimension: solution {
    type: number
    sql: ${TABLE}.solution ;;
    hidden: yes
  }

  dimension: potential_hic {
    type: number
    sql: ${TABLE}.potential_hic ;;
    hidden: yes
  }

  dimension: ongoing_hic_or_commitment {
    type: number
    sql: ${TABLE}.ongoing_hic_or_commitment ;;
    hidden: yes
  }

  dimension: hic_or_commitment_type {
    type: number
    sql: ${TABLE}.hic_or_commitment_type ;;
    hidden: yes
  }

  dimension: commitment_category {
    type: number
    sql: ${TABLE}.commitment_category ;;
    hidden: yes
  }

# ----- Added Dimension ------
  dimension: points_normalized {
    description: "Story points adjusted for differences in pointing across teams."
    sql: ${story_points} * ${point_normalization.normalization_factor} ;;
  }

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

  # ----- Measures ------
  measure: total_normalized_points {
    type: sum
    sql: ${points_normalized} ;;
    drill_fields: [detail*, story_points, points_normalized]
  }

  measure: total_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Total Hours to Resolve Issues"
    description: "The total hours required to resolve issues (from date created to date resolved)"
    type: sum
    sql: ${hours_to_resolve_issue} ;;
    value_format_name: decimal_0
    drill_fields: [detail*, hours_to_resolve_issue]
  }

  measure: avg_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Avg Hours to Resolve Issues"
    description: "The average hours required to resolve issues (from date created to date resolved)"
    type: average
    sql: ${hours_to_resolve_issue} ;;
    value_format_name: decimal_0
    drill_fields: [detail*, hours_to_resolve_issue]
  }

  measure: total_time_to_resolve_issues_days {
    group_label: "Resolution"
    label: "Total Days to Resolve Issues"
    description: "The total days required to resolve issues (from date created to date resolved)"
    type: sum
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
    drill_fields: [detail*, days_to_resolve_issue]
  }

  measure: avg_time_to_resolve_issues_days {
    group_label: "Resolution"
    label: "Avg Days to Resolve Issues"
    description: "The average days required to resolve issues (from date created to date resolved)"
    type: average
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
    drill_fields: [detail*, days_to_resolve_issue]
  }

  measure: total_time_spent {
    label: "Time Spent in Seconds"
    type: sum
    sql: ${_time_spent} ;;
    drill_fields: [detail*, _time_spent]
  }

  measure: total_hours_spent {
    label: "Time Spent in Hours"
    type: sum
    value_format_name: decimal_0
    sql: ${_time_spent} / 3600 ;;
    drill_fields: [detail*, _time_spent]
  }

  measure: total_story_points {
    type: sum
    sql: ${story_points} ;;
    drill_fields: [detail*, story_points]
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
    type: count_distinct
    sql: ${key} ;;
    drill_fields: [detail*]
  }
}
