  view: status_category {
    sql_table_name: jira.status_category ;;

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

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, status.count]
    }
  }
