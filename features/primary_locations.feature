Feature: List and view primary locations
	In order to perform a search
	I want to view lists of primary locations and primary location details
	
	Scenario: go to primary location list from homepage
		Given I have primary locations named Maryland, Pennsylvania
		And I am on the homepage
		When I follow "start"
		Then I should see "Maryland"
		And I should see "Pennsylvania"
	
	Scenario: view a primary location with sub locations
		Given I have a primary location named Pennsylvania with sub locations named Philadelphia, Hawley
		And I am on the list of primary locations
		When I follow "Pennsylvania"
		Then I should see "Philadelphia"
		And I should see "Hawley"
		
	Scenario: view a primary location with no sub locations, but with primary categories
		Given I have a primary location named Pennsylvania with primary categories named Housing, Jobs
		And I am on the list of primary locations
		When I follow "Pennsylvania"
		Then I should see "Housing"
		And I should see "Jobs"
		