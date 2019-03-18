  view: issue_sub_tasks {
    sql_table_name: jira.issue_sub_tasks ;;

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

    dimension: issue_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.ISSUE_ID ;;
    }

    dimension: related_issue_id {
      type: number
      sql: ${TABLE}.RELATED_ISSUE_ID ;;
    }

    measure: count {
      type: count
      drill_fields: [issue.id, issue.epic_name]
    }
  }
