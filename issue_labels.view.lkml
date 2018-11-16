view: issue_labels {
  sql_table_name: jira.issue_labels ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_syned ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.VALUE ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name]
  }
}
