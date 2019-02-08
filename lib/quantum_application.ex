defmodule QuantumClima.Supervisor do
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg)
  end

  def init(arg) do
    children = [
      worker(QuantumClima.Scheduler, [arg], restart: :temporary)
    ]

    opts = opts = [strategy: :one_for_one, name: QuantumClima.Supervisor]
    supervise(children, opts)
  end
end