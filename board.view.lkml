  view: board {
    sql_table_name: jira.board ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.ID ;;
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
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}.TYPE ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, sprint.count]
    }
  }
