# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :RecordType, null: true
      t.string :TypeType, null: true
      t.integer :TypeCode, null: true
      t.string :Name, null: true
      t.string :Tag, null: true
      t.string :MessageStream, null: true
      t.text :Description, null: true
      t.string :Email, null: true
      t.string :From, null: true
      t.datetime :BouncedAt, null: true

      t.timestamps
    end
  end
end
