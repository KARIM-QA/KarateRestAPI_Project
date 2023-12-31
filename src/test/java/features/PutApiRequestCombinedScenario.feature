Feature: PutApiRequestCombinedScenario

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

  ###############################################################################################
  
  Scenario: Create new employee and Update it
  # Executing post request before
    Given path  '/employees'
    And request requestBody
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    # Validation new user
    And match response.firstName == 'Alfonso'
    And match response.lastName == 'Davis'
    And match response.country == 'Sweden'
    ###############################################################################################
    # Fetch the employee id generated after post request
    * def employeeIdGenerated = response.id
    * print employeeIdGenerated
    ###############################################################################################
    # Executing put request using the employeeId Generated
    * def requestBody_update =
      """
      {
        "firstName": "Paulo",
        "lastName": "Maldini",
        "country": "Italy",
        "departmentId": 2
      }
      """
    Given path '/employees/' + employeeIdGenerated
    And request requestBody_update
    And header Content-Type = 'application/json'
    When method PUT
    Then status 200
    # Validation update existant user
    And match response.id == employeeIdGenerated
    And match response.firstName == 'Paulo'
    And match response.lastName == 'Maldini'
    And match response.country == 'Italy'
