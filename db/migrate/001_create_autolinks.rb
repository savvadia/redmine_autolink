class CreateAutolinks < ActiveRecord::Migration
  def self.up
    create_table :autolinks do |t|

      t.column :pattern, :string
      t.column :link_replacement, :string
      t.column :title_replacement, :string

    end
  end

  def self.down
    drop_table :autolinks
  end
end
