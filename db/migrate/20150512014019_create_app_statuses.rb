class CreateAppStatuses < ActiveRecord::Migration
  def change
    create_table :app_statuses do |t|
      t.boolean :status, default: nil

      t.timestamps null: false
    end
  end
end
