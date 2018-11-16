view: issue_fix_version {
  sql_table_name: jira.issue_fix_version_s ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_syned ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.VERSION_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, version.id, version.name]
  }
}
