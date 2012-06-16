class AddCounters < ActiveRecord::Migration
  COUNTERS = [
    {:title => 'Alex', :count => 0, :lamp_sum => 0},
    {:title => 'Serg', :count => 0, :lamp_sum => 0},
    {:title => 'YuYu', :count => 0, :lamp_sum => 0},
  ]
  def up
    COUNTERS.each do |c|
      Counter.create!(c)
    end
  end

  def down
    COUNTERS.each do |c|
      Counter.find_by_title(c[:title]).destroy
    end
  end
end
