  view: project {
    sql_table_name: jira.project ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.ID ;;
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

    measure: count {
      type: count
      drill_fields: [id, name, component.count, issue_project_history.count, version.count]
    }
  }