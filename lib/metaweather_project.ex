defmodule MetaweatherProject do
  @city_list [["Salt Lake City", 2487610], ["Los Angeles", 2442047], ["Boise", 2366355]]
  @moduledoc """
  This is the MetawaetherProject module.
  This will make asynchronous calls to
  metaweather to get the forcasts for Salt Lake City, Los Angeles, and Boise.
  It will then take todays forecast and the next five days max temps and average them.
  The module attribute @city_list is an example of city name and location ids for this given project.
  The list could be expanded as needed to accomidate for more locations.
  """

  @doc """
  This is the main function calls create_tasks then executes the tasks asychronously.
  """
  def main do
    create_tasks(@city_list)
    |> Enum.to_list()
  end

  @doc """
  This function takes in a list of City names and their metaweather location ids
  and creates tasks that call get_max_temps_average to make the api call and find the average
  and prints in the proper format.
  """
  def create_tasks(list) when is_list(list) do
    Task.async_stream(list,
     fn(sub_list) ->
      [city_name, location_id] = sub_list
      IO.puts("#{city_name} Average Max Temp: #{get_max_temps_average(location_id)}") end)
  end

  @doc """
  This is a simple average function that takes in a list and sums the contents and divides by the count.
  """
  def average(list) when is_list(list) do
    Enum.sum(list) / Enum.count(list)
  end

  @doc """
  This function makes the api call to metaweather based on the location id passed in.
  """
  def get_weather_request(location_id) do
    HTTPoison.start
    case HTTPoison.get("https://www.metaweather.com/api/location/#{location_id}/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Resource not found!"
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  This function call the get_weather_request function and decodes the response body
  It then grabs the max_temps for each forecast
  Then we call the average function based on that list and rounds it to 2 decimal places
  """
  def get_max_temps_average(location_id) do
    get_weather_request(location_id)
    |> Jason.decode!()
    |> Map.get("consolidated_weather")
    |> Enum.map(fn(x) -> Map.get(x, "max_temp") end)
    |> average()
    |> Decimal.from_float()
    |> Decimal.round(2)
  end
end
