view: sprint {
  sql_table_name: jira.sprint ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
  }

  dimension: board_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.BOARD_ID ;;
  }

  dimension_group: complete {
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
    sql: ${TABLE}.COMPLETE_DATE ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # Custom Fields
  dimension: duration_days {
    type: number
    sql: DATEDIFF(day, ${start_raw}, ${end_raw}) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      board.id,
      board.name,
      issue_sprint.count,
      issue_sprint_history.count
    ]
  }
}
