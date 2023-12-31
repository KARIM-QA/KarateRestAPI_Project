Feature: GetApiRequestWithQueryParameter

Background:
  * url baseUrl

Scenario: Get a specific Employee using Query Parameter
  * def query = { firstname: 'Karim', lastName: 'Laribi' }
  Given path '/employees'
  And params query
  When method GET
  Then status 200

  * print response

  # put the first Response element in variable named jsonResponse
  * def jsonResponse = response[0]
  * def actualCountry = jsonResponse.country
  * def actualFirstName = jsonResponse.firstName
  * def actualLastName = jsonResponse.lastName
  * print actualCountry, actualFirstName, actualLastName

  #Validation Country ,firstname ,lastname
  * match actualCountry == 'TUNISIA'
  * match actualFirstName == 'Karim'
  * match actualLastName == 'Laribi'
