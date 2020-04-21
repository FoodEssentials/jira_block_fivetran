view: member_count {
  derived_table: {
    sql:
      SELECT
        project.key  AS project_key,
        TIMESTAMP_TRUNC(issue.resolved, MONTH) AS month,
        COUNT(DISTINCT assignee.id ) AS member_count
      FROM jira.issue  AS issue
      LEFT JOIN jira.user  AS assignee ON issue.assignee = assignee.id
      LEFT JOIN jira.issue_type AS issue_type ON issue.issue_type = issue_type.id
      LEFT JOIN jira.project  AS project ON issue.project = project.id
      WHERE
        (issue.story_points  > 0)
        AND (issue_type.name = 'Story')
        AND (NOT issue._fivetran_deleted)
      GROUP BY 1, 2 ;;
  }

  dimension: project_key {
    sql: ${TABLE}.project_key ;;
    hidden: yes
  }

  dimension: month {
    sql: ${TABLE}.month ;;
    hidden: yes
  }

  dimension: member_count {
    sql: ${TABLE}.member_count ;;
    hidden: yes
  }
}

view: point_totals {
  derived_table: {
    sql:
      SELECT
        project.key AS project_key,
        TIMESTAMP_TRUNC(issue.resolved, MONTH) AS month,
        SUM(issue.story_points) AS total_story_points
      FROM jira.issue  AS issue
      LEFT JOIN jira.project  AS project ON issue.project = project.id
      WHERE (NOT issue._fivetran_deleted)
      GROUP BY 1,2 ;;
  }

  dimension: project_key {
    sql: ${TABLE}.project_key ;;
    hidden: yes
  }

  dimension: month {
    sql: ${TABLE}.month ;;
    hidden: yes
  }

  dimension: assignee_count {
    sql: ${TABLE}.total_story_points ;;
    hidden: yes
  }
}

view: point_normalization {
  derived_table: {
    sql:
     SELECT
        _mc.project_key,
        _mc.month,
        SAFE_DIVIDE(
          SAFE_DIVIDE(
            SUM(_pt.total_story_points) OVER(PARTITION BY _mc.month),
            SUM(_mc.member_count) OVER(PARTITION BY _mc.month)
          ),
          SAFE_DIVIDE(
            _pt.total_story_points,
            _mc.member_count
          )
        ) AS normalization_factor
      FROM
        ${member_count.SQL_TABLE_NAME} _mc
          INNER JOIN
        ${point_totals.SQL_TABLE_NAME} _pt
            ON _mc.project_key = _pt.project_key
              AND _mc.month = _pt.month ;;
  }

  dimension: project_key {
    sql: ${TABLE}.project_key ;;
    hidden: yes
  }

  dimension: month {
    sql: ${TABLE}.month ;;
    hidden: yes
  }

  dimension: normalization_factor {
    sql: ${TABLE}.normalization_factor ;;
    hidden: yes
  }
}
