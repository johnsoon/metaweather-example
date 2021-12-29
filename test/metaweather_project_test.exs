defmodule MetaweatherProjectTest do
  use ExUnit.Case
  import Mock
  doctest MetaweatherProject

  describe "MetaweatherProject.average/1" do
    test "average simple" do
      assert MetaweatherProject.average([1,2,3]) == 2
    end

    test "average floats" do
      assert MetaweatherProject.average([2.676, 7.4365, 5.994]) == 5.368833333333334
    end
  end

  describe "MetaweatherProject.get_weather_request/1" do
    test "a successful GET request" do
      with_mock MetaweatherProject, [get_weather_request: fn (location_id) -> MetaweatherProjectMock.get_weather_request(location_id) end] do
        assert MetaweatherProject.get_weather_request(232131) != nil
      end
    end

    test "a not found GET request" do
      with_mock MetaweatherProject, [get_weather_request: fn _location_id -> MetaweatherProjectMock.get_weather_request(%{"detail" => "not found"}) end] do
        assert MetaweatherProject.get_weather_request(%{"detail" => "not found"}) != nil
      end
    end
  end
end
