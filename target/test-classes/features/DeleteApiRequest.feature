Feature: DeleteApiRequest

  Background: 
    * url baseUrl

  Scenario: Delete existing  employee
    Given path  '/employees/6'
    When method DELETE
    Then status 200
