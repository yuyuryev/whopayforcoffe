class CreateCounters < ActiveRecord::Migration
  def up
    create_table 'counters' do |t|
      t.string 'title'
      t.integer 'count'
      t.integer 'lamp_sum'
      t.timestamps
    end
  end

  def down
    drop_table 'counters'
  end
end
