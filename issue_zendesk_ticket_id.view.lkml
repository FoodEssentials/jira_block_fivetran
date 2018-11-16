view: issue_zendesk_ticket_id {
  derived_table: {
  sql: SELECT id as jira_issue_id, zendesk_ticket_id
  FROM `storied-landing-160804.jira.issue` , UNNEST(split(zendesk_ticket_ids,",")) as zendesk_ticket_id
      ;;

  persist_for: "1 hour"
  }

#----- Set of fields for drilling ------
  set: detail {
    fields: [zendesk_ticket_id]
  }

#----- Dimensions ------
  dimension: pkey {
    primary_key: yes
    sql: CONCAT(${jira_issue_id}, ${zendesk_ticket_id}) ;;
    hidden: yes
  }

  dimension: jira_issue_id {
    type: number
    sql: ${TABLE}.jira_issue_id ;;
    hidden: yes
  }

  dimension: zendesk_ticket_id {
    description: "Zendesk ticket that was linked to the Jira ticket."
    type: string
    sql: ${TABLE}.zendesk_ticket_id ;;
  }

#----- Measure ------
  measure: count_zendesk_tickets {
    type: count
    drill_fields: [detail*]
  }

}
