{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

select
employee_id as employee_key,
employee_id,
email,
position,
hire_date,
first_name,
last_name,
phone_number
FROM {{ source('oliver_landing', 'employee') }}