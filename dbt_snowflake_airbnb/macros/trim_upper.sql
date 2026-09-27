{% macro trim_upper(col_name,node)%}
  UPPER(TRIM({{col_name}}))
{%endmacro%}