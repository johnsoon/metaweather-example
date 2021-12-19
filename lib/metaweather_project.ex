defmodule MetaweatherProject do
  @moduledoc """
  This is the MetawaetherProject module.
  This will make asynchronous calls to
  metaweather to get the forcasts for Salt Lake City, Los Angeles, and Boise.
  It will then take todays forcast and the next five days max temps and average them.
  """

  @doc """
  This is the main function that creates the tasks and makes the function calls with the location ids.
  Call this to run the example
  """
  def main do
    task1 = Task.async(fn -> IO.puts("Salt Lake City Average Max Temp: #{get_max_temps_average(2487610)}") end)
    task2 = Task.async(fn -> IO.puts("Los Angeles Average Max Temp: #{get_max_temps_average(2442047)}") end)
    task3 = Task.async(fn -> IO.puts("Boise Average Max Temp: #{get_max_temps_average(2366355)}") end)
    Task.await_many([task1, task2, task3])
  end

  @doc """
  This is a simple average function that takes in a list and sums the contents and divides by the count.
  """
  def average(list) do
    list_total = Enum.count(list)
    sum_val = Enum.reduce(list, fn(n, sum) -> n + sum end)
    sum_val / list_total
  end

  @doc """
  This function makes the api call to metaweather based on the location id passed in.
  """
  def get_weather_request(location_id) do
    HTTPoison.start
    HTTPoison.get!("https://www.metaweather.com/api/location/#{location_id}/").body
  end

  @doc """
  This function call the get_weather_request function and decodes the response body
  It then grabs the max_temps for each forecast
  Then we call the average function based on that list and rounds it to 2 decimal places
  """
  def get_max_temps_average(location_id) do
    response = get_weather_request(location_id)
    json = Jason.decode!(response)
    weather = Map.get(json, "consolidated_weather")
    max_temps = Enum.map(weather, fn(x) -> Map.get(x, "max_temp") end)
    Decimal.from_float(average(max_temps))
    |> Decimal.round(2)
  end
end
