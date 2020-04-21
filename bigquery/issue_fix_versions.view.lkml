view: issue_fix_versions {
  sql_table_name: jira.issue_fix_versions ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
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

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
    hidden: yes
  }

  dimension: version_id {
    type: number
    sql: ${TABLE}.version_id ;;
    hidden: yes
  }

}
