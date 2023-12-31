package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate getEmployees_Test() {
		// Set the 'karate.env' system property to 'preprod' before running the tests
		System.setProperty("karate.env", "preprod");
		return Karate.run("PutApiRequestCombinedScenario").relativeTo(getClass());
	}
}
