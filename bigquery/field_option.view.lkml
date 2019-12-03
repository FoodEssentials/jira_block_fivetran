view: field_option {
  sql_table_name: jira.field_option ;;

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
    sql: ${TABLE}._fivetran_syned ;;
    hidden: yes
  }

  dimension: name {
    type: string
    label: "{% if _view._name == 'bug_cost' %} Bug Cost (Old)
    {% elsif _view._name == 'bug_pain' %} Bug Pain (Old)
    {% elsif _view._name == 'bug_spread' %} Bug Spread (Old)
    {% elsif _view._name == 'client' %} Client
    {% elsif _view._name == 'cs_priority' %} CS Priority
    {% elsif _view._name == 'epic_status' %} Epic Status
    {% elsif _view._name == 'sales_request' %} Sales Request
    {% elsif _view._name == 'severity' %} Severity
    {% elsif _view._name == 'bug_priority' %} Bug Priority (Old)
    {% elsif _view._name == 'bug_severity' %} Bug Severity
    {% elsif _view._name == 'initiative' %} Initiative
    {% elsif _view._name == 'manual_work' %} Manual Work
    {% elsif _view._name == 'strategic_initiative' %} Strategic Initiative
    {% elsif _view._name == 'purpose' %} Purpose
    {% elsif _view._name == 'customer' %} Customer
    {% elsif _view._name == 'product_type' %} Product Type
    {% elsif _view._name == 'solution' %} Solution
    {% elsif _view._name == 'potential_hic' %} Potential HIC
    {% elsif _view._name == 'ongoing_hic_or_commitment' %} Ongoing HIC or Commitment
    {% elsif _view._name == 'hic_or_commitment_type' %} HIC or Commitment Type
    {% elsif _view._name == 'product_name' %} Product
    {% elsif _view._name == 'error_type' %} Error Type
    {% elsif _view._name == 'process_change' %} Process Change
    {% elsif _view._name == 'commitment_category' %} Commitment Category
    {% elsif _view._name == 'process_effectiveness' %} Process Effectiveness
    {% elsif _view._name == 'root_cause_level_1' %} Root Cause Level 1
    {% elsif _view._name == 'root_cause_level_2' %} Root Cause Level 2
    {% else %} The label in field_option view file needs an update
    {% endif %}"
    sql: ${TABLE}.name ;;
  }

}
