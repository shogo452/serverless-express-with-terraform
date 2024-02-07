const serverlessExpress = require('@vendia/serverless-express')
const app = require('express')()

app.use('/foo', (req, res) => res.send(`foo`));
app.use('/bar', (req, res) => res.send(`bar`));

// ローカル確認用
if (process.env.NODE_ENV === `develop`) app.listen(3001)

exports.handler = serverlessExpress({ app })
