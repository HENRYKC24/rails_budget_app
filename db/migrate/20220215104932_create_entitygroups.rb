class CreateEntitygroups < ActiveRecord::Migration[6.1]
  def change
    create_table :entitygroups do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
