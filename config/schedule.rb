every 1.day, :at => '3:30 am' do 
  rake 'todo:delete_items'
end
