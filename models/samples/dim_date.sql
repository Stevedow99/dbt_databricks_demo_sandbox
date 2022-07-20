{{
	dbt_utils.date_spine(
	datepart="day",
	start_date="to_date('01/01/1996', 'mm/dd/yyyy')",
	end_date="to_date('01/01/1998', 'mm/dd/yyyy')"
	)
}}