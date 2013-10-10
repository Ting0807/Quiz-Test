class CreateQuzzizes < ActiveRecord::Migration
  def change
    create_table :quzzizes do |t|
      t.string :title
    end
  end
end
