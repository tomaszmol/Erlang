-module(power).

-export([power/2]).

power(Podstawa, Wykladnik) when Wykladnik == 0 -> 1;
power(Podstawa, Wykladnik) when Wykladnik > 0 ->  Podstawa * power(Podstawa, Wykladnik - 1);
power(Podstawa, Wykladnik) when Wykladnik < 0 -> 1/power(Podstawa, -Wykladnik).