package elif;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class JavaTest {

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		System.out.println("Before all");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		System.out.println("After all");
	}

	@BeforeEach
	void setUp() throws Exception {
		System.out.println("Before Each");
	}

	@AfterEach
	void tearDown() throws Exception {
		System.out.println("After Each");
	}

	@Test
	void testMultiply() {
		Calculator testM = new Calculator();
		double result = testM.multiply(2, 5);

		assertEquals(10, result);
		System.out.println("Multiply Successfull");
	}

	@Test
	void testMultiply1() {
		Calculator testM1 = new Calculator();
		double result = testM1.multiply(2, 5);
		System.out.println("Multiply not Successfull");
	}

	@Test
	void testAdd() {
		Calculator testA = new Calculator();
		double result = testA.add(2, 5);
		assertEquals(7, result);
		System.out.println("add Successfull");

	}

	@Test
	void testAdd1() {
		Calculator testA1 = new Calculator();
		assertEquals(9, testA1.add(2, 5));
		System.out.println("------------------------------add not Successfull");

	}

	@Test
	void testDivide() {
		Calculator testD = new Calculator();
		try {
			assertEquals(2, testD.divide(6, 0));
			System.out.println("2");
		} catch (ArithmeticException e) {
			System.out.println("Divided by zero operation cannot possible");
		}

	}

	@Test
	void testDivide1() {
		Calculator testD = new Calculator();
		assertEquals(2, testD.divide(6, 3));
		System.out.println("Divide successfull");
	}

	@Test
	void testDivide2() {
		Calculator testD = new Calculator();
		assertEquals(2, testD.divide(6, 2));
		System.out.println("Divide not successfull");

	}

	@Test
	void testSubstract() {
		Calculator testS = new Calculator();
		double result = testS.substract(5, 2);
		assertEquals(3, result);
		System.out.println("Substract Successfull");

	}

	@Test
	void testSubstract1() {
		Calculator testS = new Calculator();
		double result = testS.substract(5, 2);
		assertEquals(7, result);
		System.out.println("Substract not Successfull");

	}

}
