defmodule ApiPhoenixWeb.Models.Account do
  def toMap(map) do
    %{
      _id: try do BSON.ObjectId.encode!(map["_id"]) rescue _ -> nil end,
      name: try do map["name"] rescue _ -> nil end,
      companyEmployeeCount: try do map["companyEmployeeCount"] rescue _ -> nil end,
      companyIndustry: try do map["companyIndustry"] rescue _ -> nil end,
      companyGoal: try do map["companyGoal"] rescue _ -> nil end,
      dateCancelation: try do map["dateCancelation"] rescue _ -> nil end,
      dateEndTestPeriod: try do map["dateEndTestPeriod"] rescue _ -> nil end,
      customId: try do map["customId"] rescue _ -> nil end,
      country: try do map["country"] rescue _ -> nil end,
      status: try do map["status"] rescue _ -> nil end,
      updatedAt: try do map["updatedAt"]|>DateTime.to_string  rescue _ -> nil end,
      createdAt: try do map["createdAt"]|>DateTime.to_string  rescue _ -> nil end,
      whitelabel: try do BSON.ObjectId.encode!(map["whitelabel"]) rescue _ -> nil end,
      __v: try do map["__v"] rescue _ -> nil end,
    }
  end

end
