import unittest
import solv_square_equation


class SquareEquationTests(unittest.TestCase):

    def test_discriminant_neg(self):
        a = 3
        b = -4
        c = 2
        result = solv_square_equation.discriminant(a, b, c)
        self.assertEqual(result, -8)

    def test_discriminant_zero(self):
        a = 1
        b = -6
        c = 9
        result = solv_square_equation.discriminant(a, b, c)
        self.assertEqual(result, 0)

    def test_discriminant_pos(self):
        a = 1
        b = -4
        c = -5
        result = solv_square_equation.discriminant(a, b, c)
        self.assertEqual(result, 36)

    def test_roots(self):
        a = 1
        b = -4
        c = -5
        d = 36
        result = solv_square_equation.roots(d, a, b, c)
        self.assertEqual(result, (-1.0, 5.0))

    def test_solv_square(self):
        a = 1
        b = -6
        c = 9
        result = solv_square_equation.solv_square(a, b, c)
        self.assertEqual(result,(3.0,3.0))


if __name__ == '__main__':
    unittest.main()
