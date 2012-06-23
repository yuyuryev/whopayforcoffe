class AddQueueField < ActiveRecord::Migration
  def up
    change_table 'counters' do |t|
      t.integer 'queue'
    end
    Counter.update_all ["queue = ?", 1]
  end

  def down
    remove_column 'counters', 'queue'
  end
end
