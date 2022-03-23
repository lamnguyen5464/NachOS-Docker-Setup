const express = require('express');
const { exec } = require('child_process');

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

app.post('/', (req, res) => {
    const { branch = 'stable', test = 'add' } = req.body || {};
    console.log(`implement on ${branch} with ${test}.....`);

    exec(`bash nachos_setup.sh ${branch} && bash run.sh ${test}`, (error, stdout, stderr) => {
        if (error) {
            console.log(`error: ${error.message}`);
            res.send(error);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            res.send(stderr);
            return;
        }

        const ans = stdout.substring(stdout.length - 1000);

        res.send(ans);
        console.log(`stdout: ${ans}`);
    });
});

const port = process.env.PORT || 3003;
app.listen(port, () => {
    console.log(`Server is running...`);
});
