view: issue_priority_history {
  sql_table_name: jira.issue_priority_history ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_syned ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: priority_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.PRIORITY_ID ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.TIME ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, priority.id, priority.name]
  }
}