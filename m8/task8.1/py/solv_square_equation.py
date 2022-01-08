from math import sqrt


def validate_param(userdata):
    """
    Function checks if entered numbers are integer
    :param userdata:
    :return:
    """
    i = 0
    while i < 3:
        try:
            userdata = int(userdata)
            return userdata
        except ValueError:
            userdata = input("Incorrect input. Enter integer number: ")
            i += 1
    print("Input Error. Integer was expected.")
    exit(-1)


def discriminant(a, b, c):
    """
    Discriminant calculates as:
    D = b^2 - 4ac
    :param a:
    :param b:
    :param c:
    :return:
    """
    return b ** 2 - 4 * a * c


def roots(d, a, b, c):
    """
    Roots calculate as:
    x1 = (-b - D^-1) / 2a
    x2 = (-b + D^-1) / 2a
    :param d:
    :param a:
    :param b:
    :param c:
    :return:
    """
    return ((b * -1) - sqrt(d)) / (2 * a), ((b * -1) + sqrt(d)) / (2 * a)


def solv_square(a, b, c):
    """
    Function calculates end returns a roots of square equation
    :param a:
    :param b:
    :param c:
    :return:
    """
    if discriminant(a, b, c) < 0:
        return -1
    else:
        return roots(discriminant(a, b, c), a, b, c)


def square_print(a, b, c, roots):
    """
    Function prints a found roots of square equation to the screen
    :param a:
    :param b:
    :param c:
    :param roots:
    :return:
    """
    if roots == -1:
        print("Equation has no roots.")
    elif roots[0] == roots[1]:
        print("Equation " + str(a) + "*x^2 + " + str(b) + "*x + " + str(c) + " has one root:\nx1 = " +
        str(roots[0]))
    else:
        print("\nFor equation " + str(a) + "*x^2 + " + str(b) + "*x + " + str(c) + " the roots are: \nx1 = " +
        str(roots[0]) + "\nx2 = " + str(roots[1]))


def main(SUCCESS_EXIT=0):
    """
    Main function.
    :return:
    """
    print("Solving the quadratic equation ax^2 + bx + c = 0")
    a = validate_param(input("Enter a constant 'a': "))
    b = validate_param(input("Enter a constant 'b': "))
    c = validate_param(input("Enter a constant 'c': "))
    try:
        roots = solv_square(a, b, c)
        square_print(a, b, c, roots)
    except ZeroDivisionError:
        print("Error: division by zero.")
        exit(-1)
    except:
        print("Unknown error")
        exit(-1)
    exit(0)


main()

