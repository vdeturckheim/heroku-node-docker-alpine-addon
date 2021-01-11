'use strict';
const app = require('express')();

const tryLoad = function (mod, res) {
    try {
        require(mod);
    }
    catch (e) {
        res.write(`${mod} failed\n`);
        return;
    }
    res.write(`${mod} ok\n`);
}

app.get('/', (req, res) => {


    tryLoad('grpc', res);
    tryLoad('sq-native', res);
    res.end('\n');
});

app.listen(process.env.PORT || 8080, () => {

    console.log('app started');
});
