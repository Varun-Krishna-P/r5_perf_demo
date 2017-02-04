class AddLocableToDeviceUsers < ActiveRecord::Migration[5.0]
  def up
      change_table(:users) do |t|
          t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
          t.string   :unlock_token # Only if unlock strategy is :email or :both
          t.index :unlock_token, unique: true
          t.datetime :locked_at
      end
#      add_index :users, :unlock_token,         unique: true
  end
    
  def down      
      change_table(:users) do |t|
          t.remove :failed_attempts
#          to remove index
          t.remove_index :unlock_token
          t.remove :unlock_token
          t.remove :locked_at
      end      
  end
#    rake db:migrate:down VERSION=<version>
#    rake db:migrate:status
#    database: r5_perf_demo_development
#
# Status   Migration ID    Migration Name
#--------------------------------------------------
#   up     20170204054204  Devise create users
#  down    20170204055649  Add locable to device users
#
#
#rake db:version
#Current version: 20170204054204
    
end
