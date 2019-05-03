class AddCreationTimeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :creation_time, :datetime
  end
end
