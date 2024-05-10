
import unittest
from app import app

class TestApp(unittest.TestCase):
    def test_index(self):
        response = app.test_client().get('/produtos')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'message': 'Requisição recebida com sucesso!'})

if __name__ == '__main__':
    unittest.main()

