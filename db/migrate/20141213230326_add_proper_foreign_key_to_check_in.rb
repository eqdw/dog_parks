class AddProperForeignKeyToCheckIn < ActiveRecord::Migration
  def up
    change_table :check_ins do |t|
      t.references :dog
      t.remove :name
    end
  end

  def down
    change_table :check_ins do |t|
      t.string :name
      t.remove :dog_id
    end
  end
end
