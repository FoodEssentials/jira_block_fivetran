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
      hidden: yes
    }

    dimension: pk {
      type: number
      primary_key: yes
      sql: CONCAT(${TABLE}.ISSUE_ID,' ',${TABLE}.SPRINT_ID) ;;
      hidden: yes
    }

    dimension: issue_id {
      type: number
      sql: ${TABLE}.issue_id ;;
      hidden: yes
    }

    dimension: sprint_id {
      type: number
      sql: ${TABLE}.sprint_id ;;
      hidden: yes
    }

  }
