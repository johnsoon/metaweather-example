defmodule MetaweatherProjectTest do
  use ExUnit.Case
  doctest MetaweatherProject

  test "average simple" do
    assert MetaweatherProject.average([1,2,3]) == 2
  end

  test "average floats" do
    assert MetaweatherProject.average([2.676, 7.4365, 5.994]) == 5.368833333333334
  end

  test "metaweatherapi for Los Angeles" do
    assert MetaweatherProject.get_weather_request(2442047) != nil
  end
end
