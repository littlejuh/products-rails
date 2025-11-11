# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
