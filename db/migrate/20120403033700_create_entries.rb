class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.string :title
      t.hstore :content

      t.timestamps
    end

    execute "CREATE INDEX entries_gin_data ON entries USING GIN(content);"
  end

  def down
    drop_table :entries
  end
end
