-module(airQuality).
-export([generate_sample_data/0, number_of_readings/2, calculate_max/2, calculate_mean/2]).

generate_sample_data() ->
  [
    {"Stacja A", {2025, 3, 17, 14, 30}, [{pm10, 15.5}, {pm2_5, 10.3}, {temperature, 22.5}]},
    {"Stacja B", {2025, 3, 17, 15, 00}, [{pm10, 12.0}, {pm2_5, 8.0}, {temperature, 20.0}, {humidity, 65}]},
    {"Stacja C", {2025, 3, 17, 15, 30}, [{pm10, 18.3}, {pm2_5, 11.0}, {pressure, 1012}]},
    {"Stacja D", {2025, 3, 18, 16, 00}, [{pm10, 14.0}, {pm2_5, 9.0}, {temperature, 21.0}]}
  ].


number_of_readings(Readings, Date) ->
  lists:filter(fun({_, DateTime, _}) -> Date == DateTime end, Readings).


calculate_max(Readings, Type) ->
  lists:foldl(fun({_, _, Measurements}, Max) ->
    case lists:keyfind(Type, 1, Measurements) of
      {Type, Value} -> max(Max, Value);
      false -> Max
    end
                end, -100000, Readings).


calculate_mean(Readings, Type) ->
  Values = lists:foldl(fun({_, _, Measurements}, Acc) ->
    case lists:keyfind(Type, 1, Measurements) of
      {Type, Value} -> [Value | Acc];
      false -> Acc
    end
                       end, [], Readings),
  case length(Values) > 0 of
    true -> lists:sum(Values) / length(Values);
    false -> 0.0
  end.
