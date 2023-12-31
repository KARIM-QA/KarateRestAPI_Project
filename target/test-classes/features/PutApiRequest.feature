Feature: PutApiRequest

  Background: 
    * url baseUrl
    * def requestBody =
      """
       {
          "firstName": "Paulo",
          "lastName": "Maldini",
          "country": "Italy",
          "departmentId": 3
      }

      """

  Scenario: Update existant employee
    
    Given path '/employees/6' 
    And request requestBody
    And header Content-Type = 'application/json'
    When method PUT
    Then status 200
    
    # Validation update existant user
    And match response.firstName == 'Paulo'
    And match response.lastName == 'Maldini'
    And match response.country == 'Italy'
