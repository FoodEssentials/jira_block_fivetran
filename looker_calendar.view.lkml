explore: looker_calendar {}

view: looker_calendar {
#   Daily calendar used for sprint burndown chart
#   Replace the hard coded date with the correct SQL
#   For your database for choosing a date that is approx
#   3 years in the past
derived_table: {
  persist_for: "24 hours"

  sql:
      SELECT
          (DATE_ADD(DATE(CURRENT_TIMESTAMP()), INTERVAL -1* number DAY)) as series_date
      FROM UNNEST(GENERATE_ARRAY(0, 2047)) AS number ;;

  }

  dimension_group: series_date {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}.series_date ;;
  }

}
