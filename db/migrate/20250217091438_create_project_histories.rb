class CreateProjectHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :project_histories do |t|
      t.string :action
      t.text :context
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
