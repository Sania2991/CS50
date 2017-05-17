require_relative 'train.rb'
require_relative 'passanger_train.rb'
require_relative 'cargo_train.rb'

require_relative 'wagon.rb'
require_relative 'passanger_wagon.rb'
require_relative 'cargo_wagon.rb'

require_relative 'railwaystation.rb'

require_relative 'route.rb'

module TestsForTrain
  puts "\n\n\n1. train1 = Train.new(1, 10)"
  $train1 = PassangerTrain.new(10)
  puts "\n2. train1.current_speed"
  $train1.current_speed
  puts "\n3. train1.go"
  $train1.go
  puts "\n4. train1.add_wagon"
  $train1.add_wagon

  puts "\n5. train1.del_wagon"
  $train1.del_wagon
  puts "\n6. train1.go(100)"
  $train1.go(100)
  puts "\n7. train1.stop"
  $train1.stop
  puts "\n8. train1.add_wagon"
  $train1.add_wagon
  puts "\n9. train1.add_wagon(5)"
  $train1.add_wagon(5)

  puts "\n\n10. train1.del_wagon(2)"
  $train1.del_wagon(2)
  puts "\n11. train1.del_wagon(5)"
  $train1.del_wagon(5)
  puts "\n12. train1.current_speed"
  $train1.current_speed
  puts "\n13. train1.count_wagon"
  $train1.count_wagon

  $train2 = CargoTrain.new(30)
end

module TestsForRailsaystation
  puts "\n\n14. station1 = RailwayStation.new(Phili)"
  $station1 = RailwayStation.new("Phili")
  $station2 = RailwayStation.new("Kuntsevo")
  $station3 = RailwayStation.new("Trechgorka")
  $station4 = RailwayStation.new("Odintsovo")

  puts "\n15. $station1.take_train($train1)"
  $station1.take_train($train1)

  puts "\n16. $station1.take_train($train2)"
  $station1.take_train($train2)

  puts "\n17. $station1.list"
  $station1.list

  puts "\n18. $station1.send_train($train1)"
  $station1.send_train($train1)

  puts "\n18_2. $station1.take_train($train1)"
  $station1.take_train($train1)

  puts "\n19. $station1.list_type"
  $station1.list_type
end

module TestsForRoute
  puts "\n20. route1 = Route.new($station1)"
  route1 = Route.new([$station1.name])

  puts "\n20_2. route1 = Route.new($station1, $station4)"
  route1 = Route.new([$station1.name, $station4.name])

  puts "\n21. route1.list"
  route1.list

  puts "\n22. route1.add_station($station2)"
  route1.add_station($station3.name)

  puts "\n23. route1.list"
  route1.list

  puts "\n24. route1.del_station($station2)"
  route1.del_station($station3.name)

  puts "\n25. route1.list"
  route1.list
end



