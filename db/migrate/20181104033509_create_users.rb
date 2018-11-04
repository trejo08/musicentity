# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      enable_extension 'hstore' unless extension_enabled?('hstore')
      t.string :name
      t.hstore :personality
  end
end
