  view: status {
    sql_table_name: jira.status ;;

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
      label: "Status Name"
      group_label: "Issue"
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: status_category_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.status_category_id ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, status_category.id, status_category.name, issue_status_history.count]
    }
  }
