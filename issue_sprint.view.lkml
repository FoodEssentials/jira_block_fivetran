  view: issue_sprint {
    sql_table_name: jira.issue_sprint ;;

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

    dimension: pk {
      type: number
      hidden: yes
      primary_key: yes
      sql: CONCAT(${TABLE}.ISSUE_ID,' ',${TABLE}.SPRINT_ID) ;;
    }

    dimension: issue_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.issue_id ;;
    }

    dimension: sprint_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.sprint_id ;;
    }

    measure: count {
      type: count
      drill_fields: [issue.id, issue.epic_name, sprint.id, sprint.name]
    }
  }
