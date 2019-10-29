  view: priority {
    sql_table_name: jira.priority ;;

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

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, issue_priority_history.count]
    }
  }
