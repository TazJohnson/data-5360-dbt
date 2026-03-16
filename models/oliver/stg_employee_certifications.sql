{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    certification_completion_id, 
    first_name,
    last_name, 
    email,
    employee_id,
    PARSE_JSON(certification_JSON): certification_name :: string AS certification_name,
    PARSE_JSON(certification_JSON): certification_cost :: string AS certification_cost,
    PARSE_JSON(certification_JSON): certification_awarded_date :: string AS certification_awarded_date
from {{ source('oliver_landing', 'employee_certifications')}}