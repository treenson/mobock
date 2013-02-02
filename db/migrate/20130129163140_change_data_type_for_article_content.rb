class ChangeDataTypeForArticleContent < ActiveRecord::Migration
  def up
  	change_table :articles do |t|
  		t.change :content, :text
  	end
  end

end
