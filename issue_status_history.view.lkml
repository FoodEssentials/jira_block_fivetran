  view: issue_status_history {
    sql_table_name: jira.issue_status_history ;;

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

    dimension: issue_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.ISSUE_ID ;;
    }

    dimension: status_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.STATUS_ID ;;
    }

    dimension_group: time {
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
      sql: ${TABLE}.TIME ;;
    }

    measure: count {
      type: count
      drill_fields: [issue.id, issue.epic_name, status.id, status.name]
    }
  }