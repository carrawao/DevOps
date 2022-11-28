from app import generateGreeting



def test_hello():
    response = generateGreeting("Robin")

    assert 'Hello Robin' in response


