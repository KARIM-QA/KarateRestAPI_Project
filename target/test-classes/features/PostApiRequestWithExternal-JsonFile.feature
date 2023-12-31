Feature: PostApiRequestWithExternal-JsonFile

  Background: 
    * url baseUrl
    * def requestBody = read('classpath:payload/employeeInput.json')
      

  Scenario: Create new employee
    Given path  '/employees'
    And request requestBody
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    
    # Validation new user
    And match response.firstName == 'Edgar'
    And match response.lastName == 'Williams'
    And match response.country == 'Germany'
    
  
