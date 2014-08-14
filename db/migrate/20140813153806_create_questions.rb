class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :content
      t.string :answer

      t.timestamps
    end
  end
end
