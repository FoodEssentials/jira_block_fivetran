view: issue_link {
  sql_table_name: jira.issue_link ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_syned ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: related_issue_id {
    type: number
    sql: ${TABLE}.RELATED_ISSUE_ID ;;
  }

  dimension: relationship {
    type: string
    sql: ${TABLE}.RELATIONSHIP ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name]
  }
}
