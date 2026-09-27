{% macro multiply_macro(x,y,precision)%}
round({{x}}*{{y}},{{precision}})

{% endmacro %}