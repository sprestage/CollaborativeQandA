class AddDetailsToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :question, :text
    add_column :collaborations, :answer, :text
  end
end
