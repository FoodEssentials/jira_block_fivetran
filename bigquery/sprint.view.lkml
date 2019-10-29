view: sprint {
  sql_table_name: jira.sprint ;;

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

  dimension: board_id {
    type: number
    sql: ${TABLE}.board_id ;;
    hidden: yes
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
    sql: ${TABLE}.complete_date ;;
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
    sql: ${TABLE}.name ;;
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
    sql: DATE_DIFF(${start_raw}, ${end_raw}, DAY) ;;
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
