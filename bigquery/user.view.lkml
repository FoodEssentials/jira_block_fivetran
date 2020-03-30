  view: user {
  sql_table_name: jira.user ;;

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.user_name ;;
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
      issue_assignee_history.count,
      issue_custom_multi_user.count,
      issue_custom_multi_user_history.count,
      issue_custom_single_user_history.count,
      issue_reporter_history.count,
      user_group.count
    ]
  }
  }


view: solutions_consultant {
  extends:[user]

  dimension: name {
    label: "Solutions Consultant"
  }

  dimension: email {
    hidden: yes
  }

  dimension: locale {
      hidden: yes
  }

  dimension: time_zone {
    hidden: yes
  }

  dimension: username {
    hidden: yes
  }
  }
