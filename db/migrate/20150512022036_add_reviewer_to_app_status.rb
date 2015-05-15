class AddReviewerToAppStatus < ActiveRecord::Migration
  def change
  	add_reference :app_statuses, :reviewer, index: true
    add_foreign_key :app_statuses, :reviewers
  end
end
