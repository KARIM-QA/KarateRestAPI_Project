Feature: PutApiRequestWithExternal-JsonFile

  Background: 
    * url baseUrl
    * def requestBody = read('classpath:payload/employeeInput.json')
      

  Scenario: Update existant employee
    
    Given path '/employees/6' 
    And request requestBody
    And header Content-Type = 'application/json'
    When method PUT
    Then status 200
    
    # Validation update existant user
    And match response.firstName == 'Edgar'
    And match response.lastName == 'Williams'
    And match response.country == 'Germany'
