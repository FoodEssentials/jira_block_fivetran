view: issue {
  derived_table: {
    sql:
      SELECT
        *
        FROM jira.issue
        WHERE issue.key NOT IN ('AD-429',
              'AD-105',
              'AD-61',
              'AD-142',
              'AD-302',
              'AD-4',
              'AD-432',
              'AD-30',
              'AD-428',
              'AD-13',
              'AD-385',
              'AD-367',
              'AD-297',
              'AD-82',
              'AD-296',
              'CS-15',
              'CS-6',
              'CS-3',
              'CS-8',
              'CS-1',
              'CS-11',
              'CS-10',
              'CS-12',
              'CS-2',
              'CS-4',
              'CS-5',
              'CS-9',
              'DCAT-219',
              'DCAT-228',
              'DCAT-286',
              'DCAT-91',
              'DCAT-78',
              'DCAT-168',
              'DCAT-208',
              'DCAT-212',
              'DCAT-83',
              'DCAT-236',
              'DCAT-265',
              'DCAT-199',
              'DCAT-197',
              'DCAT-87',
              'DIGI-1562',
              'DIGI-1563',
              'DIGI-1565',
              'DIGI-1564',
              'DIGI-1776',
              'DIGI-1467',
              'DIGI-1546',
              'DIGI-1874',
              'DIGI-1707',
              'DIGI-1708',
              'DIGI-1695',
              'DIGI-1799',
              'DIGI-1798',
              'DIGI-1771',
              'DIGI-1710',
              'DIGI-1786',
              'DIGI-1711',
              'DIGI-1682',
              'DIGI-1699',
              'DIGI-1697',
              'DIGI-1698',
              'DIGI-1749',
              'DIGI-1748',
              'DIGI-1735',
              'DIGI-1737',
              'DIGI-1728',
              'DIGI-1734',
              'DIGI-1732',
              'DIGI-1736',
              'DIGI-1739',
              'DIGI-1730',
              'DIGI-1733',
              'DIGI-1738',
              'DIGI-1729',
              'DIGI-1726',
              'DIGI-1727',
              'DIGI-1731',
              'DIGI-1454',
              'DIGI-1545',
              'DTREE-2122',
              'DTREE-2689',
              'DTREE-3002',
              'DTREE-1998',
              'DTREE-3351',
              'DTREE-3477',
              'DTREE-3321',
              'DTREE-3510',
              'DTREE-3519',
              'DTREE-3475',
              'DTREE-3478',
              'DTREE-2853',
              'DTREE-3320',
              'DTREE-2930',
              'DTREE-3226',
              'DTREE-3279',
              'DTREE-3280',
              'DTREE-3273',
              'DTREE-3254',
              'DTREE-3276',
              'DTREE-2666',
              'DTREE-2668',
              'DTREE-2667',
              'DTREE-3361',
              'DTREE-2815',
              'DTREE-337',
              'DTREE-235',
              'DTREE-323',
              'DTREE-419',
              'DTREE-2242',
              'DTREE-3127',
              'DTREE-3129',
              'DTREE-2521',
              'DTREE-2017',
              'DTREE-2523',
              'DTREE-2524',
              'DTREE-2525',
              'DTREE-2688',
              'DTREE-3128',
              'DTREE-2522',
              'DTREE-2828',
              'DTREE-2717',
              'DTREE-3401',
              'DTREE-3428',
              'DTREE-2218',
              'DTREE-1477',
              'DTREE-3380',
              'DTREE-1944',
              'DTREE-3019',
              'DTREE-3290',
              'DTREE-3235',
              'DTREE-2843',
              'DTREE-3490',
              'DTREE-3221',
              'DTREE-2328',
              'DTREE-2929',
              'DTREE-1738',
              'EX-169',
              'EX-285',
              'EX-108',
              'EX-451',
              'EX-141',
              'EX-170',
              'EX-9',
              'EX-471',
              'EX-473',
              'EX-207',
              'EX-470',
              'EX-389',
              'EX-472',
              'EX-384',
              'EX-474',
              'EX-222',
              'EX-345',
              'EX-115',
              'EX-116',
              'EX-344',
              'EX-336',
              'EX-327',
              'EX-34',
              'EX-366',
              'EX-357',
              'EX-310',
              'EX-255',
              'IMAGE-209',
              'IMAGE-364',
              'IMAGE-166',
              'IMAGE-99',
              'IMAGE-186',
              'IMAGE-100',
              'IMAGE-160',
              'IMAGE-232',
              'IMAGE-148',
              'IMAGE-194',
              'IMAGE-121',
              'IMAGE-264',
              'IMAGE-188',
              'IMAGE-98',
              'IMAGE-122',
              'IMAGE-251',
              'IMAGE-189',
              'IMAGE-66',
              'IMAGE-171',
              'IMAGE-174',
              'IMAGE-125',
              'IMAGE-126',
              'IMAGE-78',
              'IMAGE-323',
              'IMAGE-192',
              'IMAGE-191',
              'IMAGE-176',
              'IMAGE-286',
              'IMAGE-15',
              'IMAGE-363',
              'IMAGE-276',
              'IMAGE-306',
              'IMAGE-132',
              'IMAGE-383',
              'IMAGE-101',
              'IMAGE-118',
              'IMAGE-153',
              'IMAGE-127',
              'IMAGE-244',
              'IMAGE-115',
              'IMAGE-368',
              'IMAGE-318',
              'IMAGE-299',
              'IMAGE-302',
              'IMAGE-107',
              'IMAGE-185',
              'IMAGE-169',
              'IMAGE-293',
              'IMAGE-274',
              'IMAGE-233',
              'IMAGE-170',
              'IMAGE-76',
              'IMAGE-295',
              'IMAGE-110',
              'IMAGE-219',
              'IMAGE-65',
              'IMAGE-409',
              'IMAGE-373',
              'IMAGE-136',
              'IMAGE-114',
              'IMAGE-131',
              'IMAGE-144',
              'IMAGE-113',
              'IMAGE-109',
              'ONBRD-1988',
              'ONBRD-1527',
              'ONBRD-1564',
              'ONBRD-1528',
              'ONBRD-1530',
              'ONBRD-1523',
              'ONBRD-1535',
              'ONBRD-1599',
              'ONBRD-1531',
              'ONBRD-2034',
              'ONBRD-1712',
              'ONBRD-2114',
              'ONBRD-1774',
              'ONBRD-1846',
              'ONBRD-1713',
              'ONBRD-1768',
              'ONBRD-1714',
              'ONBRD-1674',
              'ONBRD-1717',
              'ONBRD-2106',
              'ONBRD-2122',
              'ONBRD-1941',
              'ONBRD-1978',
              'ONBRD-1820',
              'ONBRD-2037',
              'ONBRD-1976',
              'ONBRD-1433',
              'ONBRD-1429',
              'ONBRD-1384',
              'ONBRD-1205',
              'ONBRD-1615',
              'ONBRD-1595',
              'ONBRD-1558',
              'ONBRD-1623',
              'ONBRD-1428',
              'ONBRD-1438',
              'ONBRD-1467',
              'ONBRD-1427',
              'ONBRD-962',
              'ONBRD-1463',
              'ONBRD-1557',
              'ONBRD-1559',
              'ONBRD-1434',
              'ONBRD-1412',
              'ONBRD-1432',
              'ONBRD-1294',
              'ONBRD-1295',
              'ONBRD-1586',
              'ONBRD-1426',
              'ONBRD-1566',
              'ONBRD-1627',
              'ONBRD-1868',
              'ONBRD-1770',
              'ONBRD-1567',
              'ONBRD-933',
              'ONBRD-932',
              'ONBRD-1655',
              'ONBRD-1661',
              'ONBRD-1328',
              'ONBRD-1552',
              'ONBRD-1811',
              'ONBRD-1332',
              'ONBRD-1930',
              'ONBRD-1931',
              'ONBRD-1407',
              'ONBRD-1585',
              'ONBRD-1560',
              'ONBRD-1542',
              'ONBRD-1673',
              'ONBRD-773',
              'ONBRD-1466',
              'ONBRD-1568',
              'ONBRD-1059',
              'ONBRD-1034',
              'ONBRD-1032',
              'ONBRD-930',
              'ONBRD-934',
              'ROAD-1440',
              'ROAD-1399',
              'ROAD-1197',
              'ROAD-1483',
              'ROAD-1152',
              'ROAD-1397',
              'ROAD-1491',
              'ROAD-1226',
              'ROAD-1522',
              'ROAD-1099',
              'ROAD-1508',
              'ROAD-57',
              'ROAD-1116',
              'AI-19',
              'TFORM-909',
              'TFORM-908',
              'TFORM-922',
              'TFORM-893',
              'TFORM-1014',
              'TFORM-917',
              'TFORM-915',
              'TFORM-863')
              ;;
  }

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

  dimension: prospect {
    type: string
    sql: ${TABLE}.prospect ;;
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
  measure: total_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Total Hours to Resolve Issues"
    description: "The total hours required to resolve issues (from date created to date resolved)"
    type: sum
    sql: ${hours_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: avg_time_to_resolve_issues_hours {
    group_label: "Resolution"
    label: "Avg Hours to Resolve Issues"
    description: "The average hours required to resolve issues (from date created to date resolved)"
    type: average
    sql: ${hours_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: total_time_to_resolve_issues_days {
    group_label: "Resolution"
    label: "Total Days to Resolve Issues"
    description: "The total days required to resolve issues (from date created to date resolved)"
    type: sum
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: avg_time_to_resolve_issues_days {
    group_label: "Resolution"
    label: "Avg Days to Resolve Issues"
    description: "The average days required to resolve issues (from date created to date resolved)"
    type: average
    sql: ${days_to_resolve_issue} ;;
    value_format_name: decimal_0
  }

  measure: total_time_spent {
    type: sum
    sql: ${_time_spent} ;;
  }

  measure: total_hours_spent {
    type: sum
    sql: ${_time_spent} / 3600 ;;
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
    drill_fields: [detail*]
  }
}
