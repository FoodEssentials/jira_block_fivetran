view: issue_labels {
  sql_table_name: jira.issue_labels ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_syned ;;
    hidden: yes
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
    hidden: yes
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name]
  }
}
