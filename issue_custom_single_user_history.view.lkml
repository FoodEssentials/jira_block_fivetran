view: issue_custom_single_user_history {
  sql_table_name: jira.issue_custom_single_user_history ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_syned ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.TIME ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, user.id, user.name]
  }
}