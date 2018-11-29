class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, :required => true 
      t.datetime :completed_at
    end
  end
end
