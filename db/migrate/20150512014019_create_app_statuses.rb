class CreateAppStatuses < ActiveRecord::Migration
  def change
    create_table :app_statuses do |t|
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
