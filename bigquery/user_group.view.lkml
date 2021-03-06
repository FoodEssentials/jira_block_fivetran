  view: user_group {
    sql_table_name: jira.user_group ;;

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

    dimension: group_name {
      type: string
      sql: ${TABLE}.GROUP_NAME ;;
    }

    dimension: user_id {
      type: string
      # hidden: yes
      sql: ${TABLE}.USER_ID ;;
    }

    measure: count {
      type: count
      drill_fields: [group_name, user.id, user.name]
    }
  }
