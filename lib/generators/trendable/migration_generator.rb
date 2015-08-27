require 'rails/generators'

module Trendable
  class MigrationGenerator < ::Rails::Generators::NamedBase
    desc "Create a migration for the given class name"
    source_root File.expand_path('../generators', __FILE__)

    def create_migration_file
      plural_name = file_name.pluralize
      model_name  = file_name

      destination = "db/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_trendable_migration_for_#{model_name}.rb".gsub(" ", "")
      migration_name = "TrendableMigrationFor#{model_name.titlecase}".gsub(" ", "")
      count = nil
      i = 1
      while !Dir.glob("db/migrate/*_trendable_migration_for_#{model_name}#{count}.rb".gsub(" ", "")).empty?
        i += 1
        count = "_#{i}"
        destination = "db/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_trendable_migration_for_#{model_name}#{count}.rb".gsub(" ", "")
        migration_name = "TrendableMigrationFor#{model_name.titlecase}#{i}".gsub(" ", "")
      end
      create_file destination, <<-FILE
class #{migration_name} < ActiveRecord::Migration
  def change
    add_column :#{plural_name}, :trending_power, :integer, default: 1000
    add_index  :#{plural_name}, :trending_power
  end
end
FILE
    end
  end
end
