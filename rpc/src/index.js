const express = require('express');
const { spawn } = require('child_process');

var cors = require('cors');
const app = express();

app.use(express.json());
app.use(cors());

//test
app.get('/', (req, res) => {
    console.log('Co ai do dang vao server cua ban');
    res.json({
        status: 'Connected',
    });
});

let isBlocked = false;
app.post('/', (req, res) => {
    const { branch = 'stable', test = 'add' } = req.body || {};
    console.log(`implement on ${branch} with ${test}.....`);

    if (isBlocked) {
        res.send('NachOS server is busy, please try later');
        return;
    }

    isBlocked = true;

    let ans = '';
    var child = spawn('bash', ['execute_api.sh', branch, test]);

    const onAppendData = data => {
        console.log(data);
        ans = ans + data;
    };

    child.stdout.setEncoding('utf8');
    child.stdout.on('data', onAppendData);
    child.stderr.setEncoding('utf8');
    child.stderr.on('data', onAppendData);

    child.on('close', function (code) {
        isBlocked = false;
        console.log(`End of ${code}`);
        res.send(ans);
    });

    setTimeout(() => {
        isBlocked = false;
    }, 1000 * 60 * 5);
});

const port = process.env.PORT || 3003;
app.listen(port, () => {
    console.log(`Server is running...`);
}).setTimeout(1000 * 60 * 60);
