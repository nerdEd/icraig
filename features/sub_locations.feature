Feature:View sub locations
	In order to perform a search
	I want to view sub locations
	
	Scenario: view a sub location with primary categories
		Given I have a sub location named Philadelphia whose primary location is Pennsylvania and has primary categories named Housing, Jobs
		And I am on the list of primary locations
		And I follow "Pennsylvania"
		When I follow "Philadelphia"
		Then I should see "Housing"
		And I should see "Jobs"
		