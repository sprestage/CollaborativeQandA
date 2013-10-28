class CreateJoinTableUsersCollaborations < ActiveRecord::Migration
  def self.up
    create_table :users_collaborations, :id => false do |t|
      t.references :collaboration
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :users_collaborations
  end
end
