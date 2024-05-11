defmodule App.Translator do
  use HTTPoison.Base

  @endpoint "https://api.hy-tech.my.id/api/translate"

  def handle_response(%{status_code: 200, body: body}) do
    {:ok, Jason.decode!(body)}
  end

  def handle_response(response) do
    {:error, response}
  end

  def ask(question, target_lang) do
    case get("#{@endpoint}?text=#{URI.encode(question)}&target=#{URI.encode(target_lang)}") do
      {:ok, response} ->
        handle_response(response)
      {:error, error} ->
        handle_response(error)
    end
  end
end