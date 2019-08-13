  view: project {
    sql_table_name: jira.project ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
      hidden: yes
    }

    dimension_group: _fivetran_syned {
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

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: project_category_id {
      type: number
      sql: ${TABLE}.project_category_id ;;
    }

    dimension: project_type_key {
      type: string
      sql: ${TABLE}.project_type_key ;;
    }

    dimension: key {
      type: string
      sql: ${TABLE}.key ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, component.count, issue_project_history.count, version.count]
    }
  }
