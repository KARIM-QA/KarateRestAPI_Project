Feature: GetApiRequest

  Background: 
    * url baseUrl

  Scenario: Get List of Employees
    Given path  '/employees'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse

  Scenario: Get a specific Employee
    Given path  '/employees/1'
    When method GET
    Then status 200
    * print response
    
    #Validation Country ,firstname ,lastname
    * def jsonResponse = response
    * def actualCountry = jsonResponse.country
    * def actualFirstName = jsonResponse.firstName
    * def actualLastName = jsonResponse.lastName
    * print actualCountry , actualFirstName, actualLastName
    * match actualCountry == 'TUNISIA'
    * match actualFirstName == 'Karim'
    * match actualLastName == 'Laribi'

  Scenario: Get list of Employees that belong to the same department
    Given path '/departments/1/employees'
    When method GET
    Then status 200
    * print response
    * def actualCountry = response[1].country
    * print actualCountry
    * match actualCountry =='Argentina'
