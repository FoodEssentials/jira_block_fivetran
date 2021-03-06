connection: "bigquery"

# include all the views
include: "/bigquery/issue_fields/fields/*.view"
include: "/bigquery/*.view"
include: "/models/*.view"

label: "Jira"

datagroup: fivetran_datagroup {
  sql_trigger: SELECT MAX(TIMESTAMP_TRUNC(done, MINUTE)) FROM jira.fivetran_audit ;;
  max_cache_age: "24 hours"
}

persist_with: fivetran_datagroup

explore: issue {
  sql_always_where: NOT ${_fivetran_deleted} ;;

  join: project {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.project} = ${project.id} ;;
  }

  join: assignee {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.assignee} = ${assignee.id} ;;
  }

  join: point_normalization {
    relationship: many_to_one
    sql_on: TIMESTAMP_TRUNC(${issue.resolved_raw}, MONTH) = ${point_normalization.month}
      AND ${project.key} = ${point_normalization.project_key} ;;
  }

  join: bug_cost {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.bug_cost} = ${bug_cost.id} ;;
  }

  join: bug_pain {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.bug_pain} = ${bug_pain.id} ;;
  }

  join: bug_spread {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.bug_spread} = ${bug_spread.id} ;;
  }

  join: client {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.client} = ${client.id} ;;
  }

  join: creator {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.creator} = ${creator.id} ;;
  }

  join: cs_priority {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.cs_priority} = ${cs_priority.id} ;;
  }

  join: epic {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.epic_link} = ${epic.id} ;;
  }

  join: epic_status {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.epic_status} = ${epic_status.id} ;;
  }

  join: issue_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
  }

  join: priority {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.priority} = ${priority.id} ;;
  }

  join: reporter {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.reporter} = ${reporter.id} ;;
  }

  join: resolution {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.resolution} = ${resolution.id} ;;
  }

  join: sales_request {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.sales_request} = ${sales_request.id} ;;
  }

  join: severity {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.severity} = ${severity.id} ;;
  }

  join: status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.status} = ${status.id} ;;
  }

  join: bug_priority {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.bug_priority} = ${bug_priority.id} ;;
  }

  join: bug_severity {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.bug_severity} = ${bug_severity.id} ;;
  }

  join: initiative {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.initiative} = ${initiative.id} ;;
  }

  join: manual_work {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.manual_work} = ${manual_work.id} ;;
  }

  join: strategic_initiative {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.strategic_initiative} = ${strategic_initiative.id} ;;
  }

  join: purpose {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.purpose} = ${purpose.id} ;;
  }

  join: sales_lead {
    from: user
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.sales_lead} = ${sales_lead.id} ;;
  }

  join: issue_component_s {
    type: left_outer
    relationship: many_to_many
    sql_on: ${issue.id} = ${issue_component_s.issue_id} ;;
  }

  join: component {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_component_s.component_id} = ${component.id};;
  }

  join: issue_fix_versions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_fix_versions.issue_id} ;;
  }

  join: version {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_fix_versions.version_id} = ${version.id} ;;
  }

  join: issue_link {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_link.issue_id} ;;
  }

  join: issue_customer {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_customer.issue_id} ;;
  }

  join: customer {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_customer.field_option_id} = ${customer.id} ;;
  }

  join: issue_labels {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_labels.issue_id} ;;
  }

  join: issue_sprint {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_sprint.issue_id} ;;
  }

  join: sprint {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
  }

  join: issue_product_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_product_type.issue_id} ;;
  }

  join: product_type {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_product_type.field_option_id} = ${product_type.id} ;;
  }

  join: issue_solution {
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_solution.issue_id};;
  }

  join: solution {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_solution.field_option_id} = ${solution.id} ;;
  }

  join: issue_potential_hic {
    view_label: "Issue Potential HIC"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_potential_hic.issue_id} ;;
  }

  join: potential_hic {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_potential_hic.field_option_id} = ${potential_hic.id};;
  }

  join: issue_ongoing_hic_or_commitment {
    view_label: "Issue"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_ongoing_hic_or_commitment.issue_id} ;;
  }

  join: ongoing_hic_or_commitment {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_ongoing_hic_or_commitment.field_option_id} = ${ongoing_hic_or_commitment.id} ;;
  }

  join: hic_or_commitment_type {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.hic_or_commitment_type} = ${hic_or_commitment_type.id} ;;
  }

  join: issue_product {
    sql_on: ${issue.id} = ${issue_product.issue_id} ;;
    relationship: one_to_one
  }

  join: product_name {
    view_label: "Issue"
    from: field_option
    sql_on: ${issue_product.field_option_id} = ${product_name.id} ;;
    relationship: one_to_many
  }

  join: issue_error_type {
    view_label: "Issue"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_error_type.issue_id} ;;
  }

  join: error_type {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_error_type.field_option_id} = ${error_type.id} ;;
  }

  join: issue_process_change {
    view_label: "Issue"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_process_change.issue_id} ;;
  }

  join: process_change {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_process_change.field_option_id} = ${process_change.id} ;;
    }

  join: commitment_category {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.commitment_category} = ${commitment_category.id} ;;
  }

  join: issue_process_effectiveness {
    view_label: "Issue"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_process_effectiveness.issue_id};;
  }

  join:  process_effectiveness {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_process_effectiveness.field_option_id} = ${process_effectiveness.id};;
  }

  join: solutions_consultant {
    view_label: "Issue"
    relationship: many_to_one
    type: left_outer
    sql_on: ${issue.solutions_consultant} = ${solutions_consultant.id};;
  }
}

explore: sprint {
  fields: [ALL_FIELDS*, -issue.points_normalized, -issue.total_normalized_points]

  join: issue_sprint {
    type:  left_outer
    sql_on: ${sprint.id} = ${issue_sprint.sprint_id} ;;
    relationship: one_to_many
  }
  join: issue {
    type:  left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id}
      AND NOT ${issue._fivetran_deleted} ;;
    relationship: one_to_many
  }

  join: issue_root_cause_level_1 {
    view_label: "Issue"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_root_cause_level_1.issue_id};;
  }

  join:  root_cause_level_1 {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_root_cause_level_1.field_option_id} = ${root_cause_level_1.id};;
  }

  join: issue_root_cause_level_2 {
    view_label: "Issue"
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue.id} = ${issue_root_cause_level_2.issue_id};;
  }

  join:  root_cause_level_2 {
    view_label: "Issue"
    from: field_option
    type: left_outer
    relationship: many_to_one
    sql_on: ${issue_root_cause_level_2.field_option_id} = ${root_cause_level_2.id};;
  }

}
# Update based on how you are associating versions to
explore: version {
  fields: [ALL_FIELDS*, -issue.points_normalized, -issue.total_normalized_points, -issue_extended.points_normalized, -issue_extended.total_normalized_points]

  join: issue_fix_versions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${version.id} = ${issue_fix_versions.version_id} ;;
  }
  join: issue {
    type: left_outer
    relationship: one_to_one
    sql_on: ${issue_fix_versions.issue_id} = ${issue.id}
      AND NOT ${issue._fivetran_deleted} ;;
  }
  join: issue_extended {
    type: left_outer
    relationship: one_to_one
    sql_on: ${issue_fix_versions.issue_id} = ${issue_extended.id} ;;
  }
  join: issue_sprint {
    type: left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id} ;;
    relationship: many_to_one
  }
  join: sprint {
    from: sprint
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
    relationship: many_to_one
  }

}

explore: issue_history_2 {
  fields: [ALL_FIELDS*, -issue.points_normalized, -issue.total_normalized_points]

  label: "Issue History"
#  fields: [ALL_FIELDS*, -issue.total_open_story_points,-issue.total_closed_story_points]
  view_name: issue
  sql_always_where: NOT ${issue._fivetran_deleted} ;;

  join: issue_history_all {
    type:  left_outer
    sql_on: ${issue.id} = ${issue_history_all.issue_id} ;;
    relationship: many_to_one
  }

  join: issue_sprint {
    type: left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue_history_all.issue_id} ;;
    relationship: many_to_one
  }

  join: sprint {
    from: sprint
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
    relationship: many_to_one
  }

}

### CURRENT OVERVIEW OF STATUS OF PROJECTS, ISSUES, AND ISSUE FACTS (E.G. # OF COMMENTS)

explore: project {
  fields: [ALL_FIELDS*, -issue.points_normalized, -issue.total_normalized_points]

  join: issue {
    type:  left_outer
    sql_on: ${project.id} = ${issue.project}
      AND NOT ${issue._fivetran_deleted} ;;
    relationship: many_to_one
  }
  join:  issue_type {
    type:  left_outer
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
    relationship: many_to_one
  }
  join: issue_sprint {
    type: left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id} ;;
    relationship: many_to_one
  }
  join: sprint {
    from: sprint
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
    relationship: many_to_one
  }
  join:  priority {
    type:  left_outer
    sql_on: ${issue.priority} = ${priority.id} ;;
    relationship: many_to_one
  }
  join:  status {
    type:  left_outer
    sql_on: ${issue.status} = ${status.id} ;;
    relationship: many_to_one
  }
  join:  status_category {
    type:  left_outer
    sql_on: ${status.status_category_id} = ${status_category.id} ;;
    relationship: many_to_one
  }

  ### AS OF NOW, FACT TABLE ONLY INCLUDES COMMENT INFORMATION - SHOULD MAKE THIS A GIANT DERIVED TABLE
  ### WITH FACTS FROM ALL ISSUE-RELATED TABLES SUCH AS PRIORITY, TYPE, ETC.

  join:  issue_comment_facts {
    type:  left_outer
    sql_on: ${issue.id} = ${issue_comment_facts.issue_id} ;;
    relationship: many_to_one
  }

  join: sprint_start_points {
    type: left_outer
    sql_on: ${sprint.id} = ${sprint_start_points.id} ;;
    relationship: one_to_one
  }

}


### HISTORICAL OVERVIEWS

explore: sprint_by_date {

  fields: [ALL_FIELDS*, -issue.points_normalized, -issue.total_normalized_points]
  label: "Sprint History"

  join: issue {
    view_label: "Issue"
    type: left_outer
    sql_on: ${sprint_by_date.issue_id} = ${issue.id}
      AND NOT ${issue._fivetran_deleted} ;;
    relationship: many_to_one
  }

  ### JOIN SINGULAR TABLES WITH NO ASSOCIATED HISTORY TABLES

  join: issue_type {
    type: left_outer
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
    relationship: many_to_one
  }

  join: priority {
    view_label: "Issue Priority"
    type: left_outer
    sql_on: ${issue.priority} = ${priority.id} ;;
    relationship: many_to_one
  }

  join: sprint {
    type: left_outer
    sql_on: ${sprint.id} = ${sprint_by_date.sprint_id} ;;
    relationship: many_to_one
  }

  join: sprint_details {
    type: left_outer
    sql_on: ${sprint_details.id} = ${sprint_by_date.sprint_id} ;;
    relationship: many_to_one
  }

  join: status {
    view_label: "Issue Status"
    type: left_outer
    sql_on: ${status.id} = ${issue.status} ;;
    relationship: many_to_one
  }

  join: status_category {
    view_label: "Issue Status"
    type: left_outer
    sql_on: ${status.status_category_id} = ${status_category.id} ;;
    relationship: many_to_one
  }

}


explore: sprint_burndown {

  fields: [ALL_FIELDS*, -issue.points_normalized, -issue.total_normalized_points]
  view_name: issue
  sql_always_where: NOT ${issue._fivetran_deleted} ;;

  join: issue_sprint {
    type: left_outer
    sql_on: ${issue.id} = ${issue_sprint.issue_id} ;;
    relationship: one_to_many
  }
  join: sprint {
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
    relationship: many_to_one
  }
  join: sprint_start_points {
    type: left_outer
    sql_on: ${sprint.id} = ${sprint_start_points.id} ;;
    relationship: one_to_one
  }

  join:  status {
    type:  left_outer
    sql_on: ${issue.status} = ${status.id} ;;
    relationship: many_to_one
  }


  #always_filter: {
  #  filters: {
  #    field: sprint.name
  #    value: "Data Sprint 5"
  #  }
  #}

}
