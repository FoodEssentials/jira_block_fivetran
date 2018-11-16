view: issue_zendesk_ticket_id {
  derived_table: {
  sql: SELECT id as jira_issue_id, zendesk_ticket_id
  FROM `storied-landing-160804.jira.issue` , UNNEST(split(zendesk_ticket_ids,",")) as zendesk_ticket_id
      ;;

  persist_for: "1 hour"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: jira_issue_id {
    type: number
    sql: ${TABLE}.jira_issue_id ;;
  }

  dimension: zendesk_ticket_id {
    type: string
    sql: ${TABLE}.zendesk_ticket_id ;;
  }

  set: detail {
    fields: [jira_issue_id, zendesk_ticket_id]
  }

}
