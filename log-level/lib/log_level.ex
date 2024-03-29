defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      (level === 0 and !legacy?) ->  :trace
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      (level === 5 and !legacy?) -> :fatal
      true -> :unknown
    end

  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    label = to_label(level, legacy?)
    cond do
      label in [:error, :fatal] -> :ops
      (label == :unknown and legacy?) -> :dev1
      (label == :unknown and !legacy?) -> :dev2
      true -> nil
    end
  end
end
