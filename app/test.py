# a simple test before production
# here would be all the automated tests of the app

def calc(x, y):
    return x + y


def test_calc():
    assert 5 == calc(2, 3)
