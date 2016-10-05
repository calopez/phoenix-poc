defmodule Rumbl.Permalink do
  @behaviour Ecto.Type
  @doc """
  Rumbl.Permalink is a custom type defined according to the Ecto.Type behavior.
  It expects us to define four functions:

  type
  ----
  Returns the underlying Ecto type. In this case, we’re building on top of :id.

  cast
  ----
  Called when external data is passed into Ecto.
  It’s invoked when values in queries are interpolated or also by the cast function in changesets.

  dump
  ----
  Invoked when data is sent to the database.

  load
  ----
  Invoked when data is loaded from the database.
p

  dump and load handle the struct-to-database conversion.
  We can expect to work only with integers at this point because cast does the dirty work of sanitizing our input.
  Successful casts return integers.

  """

  def type, do: :id

  def cast(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {int, _} when (int > 0) -> {:ok, int}
      _                       -> :error
    end
  end

  def cast(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def cast(_) do
    :error
  end

  def dump(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def load(integer) when is_integer(integer) do
    {:ok, integer}
  end

end
