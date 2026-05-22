const express = require('express');
const app = express();

app.get('/api', (req, res) => {
    res.json({ message: 'Olá, esta é a API!' });
});

app.listen(3000, () => {
    console.log('API rodando na porta 3000');
})