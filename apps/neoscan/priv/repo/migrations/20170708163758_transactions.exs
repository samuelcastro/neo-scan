defmodule Neoscan.Repo.Migrations.Transactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :attributes, {:array, :map}
      add :net_fee, :string
      add :scripts, {:array, :map}
      add :size, :integer
      add :sys_fee, :string
      add :txid, :string
      add :type, :string
      add :version, :integer
      add :vin, {:array, :map}

      add :time, :integer
      add :block_hash, :string
      add :block_height, :integer

      add :nonce, :bigint
      add :claims, {:array, :map}
      add :pubkey, :string
      add :asset, :map
      add :description, :string
      add :contract, :map

      add :block_id, references(:blocks, on_delete: :delete_all)

      timestamps()
    end

    create index(:transactions, ["inserted_at DESC NULLS LAST"])
    create index(:transactions, [:txid], unique: true)
    create index(:transactions, ["block_height DESC NULLS LAST"])
    create index(:transactions, [:type])
    create index(:transactions, [:block_id])

  end
end
