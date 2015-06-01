class AddApiRequestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :api_requests, :int, default: 0
  end
end
