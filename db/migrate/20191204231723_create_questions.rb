class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
    t.string :clue
    end
  end
end
