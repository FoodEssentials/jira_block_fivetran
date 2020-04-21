  view: component {
    sql_table_name: jira.component;;

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

    dimension: project_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.project_id ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, project.id, project.name]
    }
  }
