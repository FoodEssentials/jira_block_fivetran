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
    sql: CONCAT(CAST(${jira_issue_id} AS string), ${zendesk_ticket_id}) ;;
    hidden: yes
  }

  dimension: jira_issue_id {
    type: string
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
    description: "Number of Zendesk Tickets liked to the Jira Issue."
    type: count
    drill_fields: [detail*]
  }

}
