  view: comment {
    sql_table_name: jira.comment ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.ID ;;
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

    dimension: author_id {
      type: string
      sql: ${TABLE}.AUTHOR_ID ;;
    }

    dimension: body {
      label: "Comment"
      type: string
      sql: ${TABLE}.BODY ;;
    }

    dimension_group: created {
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
      sql: ${TABLE}.CREATED ;;
    }

    dimension: issue_id {
      type: number
      # hidden: yes
      sql: ${TABLE}.ISSUE_ID ;;
      hidden: yes
    }

    dimension: update_author_id {
      type: string
      sql: ${TABLE}.UPDATE_AUTHOR_ID ;;
    }

    dimension_group: updated {
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
      sql: ${TABLE}.UPDATED ;;
    }

    measure: count_distinct_comment {
      type: count
      drill_fields: [id, issue.id, issue.epic_name]
    }
  }

view: most_recent_comment {
  derived_table: {
    sql: SELECT issue_id, body, MAX(updated) FROM jira.comment GROUP BY 1, 2;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
    hidden: yes
  }

  dimension: most_recent_comment {
    type: string
    sql: ${TABLE}.body;;
  }
}
