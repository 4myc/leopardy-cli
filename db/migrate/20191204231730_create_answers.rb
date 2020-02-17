class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :correct
      t.integer :question_id
      end
  end
end
