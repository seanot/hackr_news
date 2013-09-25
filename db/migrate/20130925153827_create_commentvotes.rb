class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer :comment_vote
      t.integer :comment_id
      t.timestamps
    end
  end
end
