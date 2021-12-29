defmodule HTTPoison.Response do
  defstruct ~w[body headers status_code]a
end

defmodule MetaweatherProjectMock do
  def get_weather_request(%{"detail" => _}) do
    {:ok, not_found_response()}
  end

  def get_weather_request(_location_id) do
    {:ok, successful_response()}
  end

  defp successful_response do
    %HTTPoison.Response{
      body: "{\"consolidated_weather\":[{\"id\":5748219989458944,\"weather_state_name\":\"Light Rain\",\"weather_state_abbr\":\"lr\",\"wind_direction_compass\":\"WSW\",\"created\":\"2021-12-29T02:29:16.140086Z\",\"applicable_date\":\"2021-12-28\",\"min_temp\":-6.975,\"max_temp\":-3.3200000000000003,\"the_temp\":-1.3299999999999998,\"wind_speed\":5.383443677634614,\"wind_direction\":241.97760716102772,\"air_pressure\":1009.5,\"humidity\":76,\"visibility\":12.505716614968584,\"predictability\":75},{\"id\":4942550260514816,\"weather_state_name\":\"Heavy Rain\",\"weather_state_abbr\":\"hr\",\"wind_direction_compass\":\"S\",\"created\":\"2021-12-29T02:29:19.561166Z\",\"applicable_date\":\"2021-12-29\",\"min_temp\":-9.445,\"max_temp\":0.79,\"the_temp\":1.46,\"wind_speed\":6.736499056963335,\"wind_direction\":188.16492153098028,\"air_pressure\":1009.5,\"humidity\":80,\"visibility\":11.461191640817624,\"predictability\":77},{\"id\":4577412877647872,\"weather_state_name\":\"Sleet\",\"weather_state_abbr\":\"sl\",\"wind_direction_compass\":\"SW\",\"created\":\"2021-12-29T02:29:22.095128Z\",\"applicable_date\":\"2021-12-30\",\"min_temp\":-4.545,\"max_temp\":3.1750000000000003,\"the_temp\":1.38,\"wind_speed\":7.376451373506721,\"wind_direction\":228.66804053718147,\"air_pressure\":1009.5,\"humidity\":81,\"visibility\":10.207885946074923,\"predictability\":85},{\"id\":6068450167357440,\"weather_state_name\":\"Thunder\",\"weather_state_abbr\":\"t\",\"wind_direction_compass\":\"W\",\"created\":\"2021-12-29T02:29:25.162716Z\",\"applicable_date\":\"2021-12-31\",\"min_temp\":-6.324999999999999,\"max_temp\":1.0,\"the_temp\":-1.915,\"wind_speed\":7.9563036319494165,\"wind_direction\":267.60365160135433,\"air_pressure\":1020.5,\"humidity\":79,\"visibility\":8.457172611946234,\"predictability\":80},{\"id\":6752670468538368,\"weather_state_name\":\"Light Rain\",\"weather_state_abbr\":\"lr\",\"wind_direction_compass\":\"S\",\"created\":\"2021-12-29T02:29:28.057327Z\",\"applicable_date\":\"2022-01-01\",\"min_temp\":-11.925,\"max_temp\":-4.9399999999999995,\"the_temp\":-4.615,\"wind_speed\":4.6355600209496535,\"wind_direction\":172.66532052452658,\"air_pressure\":1034.0,\"humidity\":80,\"visibility\":11.560300345979478,\"predictability\":75},{\"id\":4814326897573888,\"weather_state_name\":\"Clear\",\"weather_state_abbr\":\"c\",\"wind_direction_compass\":\"SE\",\"created\":\"2021-12-29T02:29:31.166415Z\",\"applicable_date\":\"2022-01-02\",\"min_temp\":-11.58,\"max_temp\":0.02999999999999997,\"the_temp\":-3.06,\"wind_speed\":3.2894378827646547,\"wind_direction\":138.00000000000003,\"air_pressure\":1035.0,\"humidity\":78,\"visibility\":9.999726596675416,\"predictability\":68}],\"time\":\"2021-12-28T20:36:39.371408-07:00\",\"sun_rise\":\"2021-12-28T07:51:02.795246-07:00\",\"sun_set\":\"2021-12-28T17:07:01.111268-07:00\",\"timezone_name\":\"LMT\",\"parent\":{\"title\":\"Utah\",\"location_type\":\"Region / State / Province\",\"woeid\":2347603,\"latt_long\":\"39.499741,-111.547318\"},\"sources\":[{\"title\":\"BBC\",\"slug\":\"bbc\",\"url\":\"http://www.bbc.co.uk/weather/\",\"crawl_rate\":360},{\"title\":\"Forecast.io\",\"slug\":\"forecast-io\",\"url\":\"http://forecast.io/\",\"crawl_rate\":480},{\"title\":\"HAMweather\",\"slug\":\"hamweather\",\"url\":\"http://www.hamweather.com/\",\"crawl_rate\":360},{\"title\":\"Met Office\",\"slug\":\"met-office\",\"url\":\"http://www.metoffice.gov.uk/\",\"crawl_rate\":180},{\"title\":\"OpenWeatherMap\",\"slug\":\"openweathermap\",\"url\":\"http://openweathermap.org/\",\"crawl_rate\":360},{\"title\":\"Weather Underground\",\"slug\":\"wunderground\",\"url\":\"https://www.wunderground.com/?apiref=fc30dc3cd224e19b\",\"crawl_rate\":720},{\"title\":\"World Weather Online\",\"slug\":\"world-weather-online\",\"url\":\"http://www.worldweatheronline.com/\",\"crawl_rate\":360}],\"title\":\"Salt Lake City\",\"location_type\":\"City\",\"woeid\":2487610,\"latt_long\":\"40.759499,-111.888229\",\"timezone\":\"America/Denver\"}",
      headers: [
        {"x-xss-protection", "1; mode=block"},
        {"Content-Language", "en"},
        {"x-content-type-options", "nosniff"},
        {"strict-transport-security", "max-age=2592000; includeSubDomains"},
        {"Vary", "Accept-Language, Cookie"},
        {"Allow", "GET, HEAD, OPTIONS"},
        {"x-frame-options", "DENY"},
        {"Content-Type", "application/json"},
        {"X-Cloud-Trace-Context", "b38f8db64f787b4a3ea5fb56df034934"},
        {"Date", "Wed, 29 Dec 2021 03:36:39 GMT"},
        {"Server", "Google Frontend"},
        {"Content-Length", "3583"}
      ],
      status_code: 200
    }
  end

  defp not_found_response do
    %HTTPoison.Response{
      body: "{\"detail\":\"Not found.\"}",
      headers: [
        {"x-xss-protection", "1; mode=block"},
        {"Content-Language", "en"},
        {"x-content-type-options", "nosniff"},
        {"strict-transport-security", "max-age=2592000; includeSubDomains"},
        {"Vary", "Accept-Language, Cookie"},
        {"Allow", "GET, HEAD, OPTIONS"},
        {"x-frame-options", "DENY"},
        {"Content-Type", "application/json"},
        {"X-Cloud-Trace-Context", "60c97653a07d39cb0e4239c9553364ff"},
        {"Date", "Wed, 29 Dec 2021 03:37:46 GMT"},
        {"Server", "Google Frontend"},
        {"Content-Length", "23"}
      ],
      status_code: 404
    }
  end
end
