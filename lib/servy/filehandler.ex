defmodule Servy.FileHandler do
  def handle_file({:ok, content}, conv) do
    %{ conv | status: 200, resp_body: content }
  end

  def handle_file({:error, :enoent}, conv) do
    %{ conv | status: 404, resp_body: "File not found!" }
  end

  def handle_file({:error, error}, conv) do
    %{ conv | status: 400, resp_body: "File error: #{error}" }
  end
end
