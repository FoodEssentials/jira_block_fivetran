view: issue_component_s {
  sql_table_name: jira.issue_component_s ;;

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

  dimension: component_id {
    type: number
    sql: ${TABLE}.component_id ;;
    hidden: yes
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
    hidden: yes
  }

}
