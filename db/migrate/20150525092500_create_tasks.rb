# require_relative '../config'
require_relative '../../config/application.rb'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :new_id
      t.integer :completion
      t.string :desc
      t.timestamp
    end
   end
end
