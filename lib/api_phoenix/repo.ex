defmodule ApiPhoenix.Repo do
  use Mongo.Repo,
    otp_app: :api_phoenix,
    topology: :mongo
end
