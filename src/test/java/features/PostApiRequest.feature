Feature: PostApiRequest

  Background: 
    * url baseUrl
    * def requestBody =
      """
       {
          "firstName": "Alfonso",
          "lastName": "Davis",
          "country": "Sweden",
          "departmentId": 2
      }

      """

  Scenario: Create new employee
    Given path  '/employees'
    And request requestBody
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    
    # Validation new user
    And match response.firstName == 'Alfonso'
    And match response.lastName == 'Davis'
    And match response.country == 'Sweden'
    
  
