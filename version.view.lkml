  view: version {
    sql_table_name: jira.version ;;

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

    dimension: archived {
      type: yesno
      sql: ${TABLE}.archived ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: overdue {
      type: yesno
      sql: ${TABLE}.overdue ;;
    }

    dimension: project_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.project_id ;;
    }

    dimension_group: release {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.release_date ;;
    }

    dimension: released {
      type: yesno
      sql: ${TABLE}.released ;;
    }

    dimension_group: start {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.start_date ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    # ----- Sets of fields for drilling ------
    set: detail {
      fields: [
        id,
        name,
        project.id,
        project.name
      ]
    }
  }
