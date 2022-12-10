fs = require('fs')

function getFilename() {
    return (process.argv.length > 2) ? process.argv[2] : 'input.txt';
}

function readFile(filename, callback) {
    fs.readFile(filename, 'utf8', function (err, data) {
        if (err) {
            return console.log(err);
        }
        console.log(`Reading from '${filename}' ...\n`);
        callback(data);
    });
}

function extractArea(data) {
    const area = [];
    let row = 0;
    data.split(/\r?\n/)
        .filter(line => !!line)
        .forEach(line => {
            let column = 0;
            area[row] = [];
            [...line].forEach(char => {
                // console.log(`[${row}][${column}] = ${char}`);
                area[row][column] = Number(char);
                column++;
            });
            row++;
        });

     console.log(area);
    return area;
}

function isBorder(row, column, area) {
    return row === 0
        || row === (area.length - 1)
        || column === 0
        || column === (area[row].length - 1);
}

function actuallyCalculateScore(row, column, area) {
    const targetHeight = area[row][column];

    let scoreRight = 0;
    for (let col = column + 1; col < area[row].length; col++) {
        scoreRight++;
        if (area[row][col] >= targetHeight) {
            break;
        }
    }

    let scoreLeft = 0;
    for (let col = column - 1; col >= 0; col--) {
        scoreLeft++;
        if (area[row][col] >= targetHeight) {
            break;
        }
    }

    let scoreBottom = 0;
    for (let ro = row + 1; ro < area.length; ro++) {
        scoreBottom++;
        if (area[ro][column] >= targetHeight) {
            break;
        }
    }

    let scoreTop = 0;
    for (let ro = row - 1; ro >= 0; ro--) {
        scoreTop++;
        if (area[ro][column] >= targetHeight) {
            break;
        }
    }
    
    return scoreBottom * scoreTop * scoreLeft * scoreRight;
}

function calculateScore(row, column, area) {
    return isBorder(row, column, area) ? 0 : actuallyCalculateScore(row, column, area);
}


const filename = getFilename();
readFile(filename, (data) => {
    const area = extractArea(data);

    let highScore = 0;
    const scores = [];

    for (let row = 0; row < area.length; row++) {
        scores[row] = [];
        for (let column = 0; column < area[row].length; column++) {

            const score = calculateScore(row, column, area);
            scores[row][column] = score;

            if (score > highScore) {
                console.log(`New high score: ${score} > ${highScore}`);
                highScore = score;
            }
        }
    }

    console.log(scores);

    console.log('-'.repeat(40));
    console.log(` RESULT: ${highScore}`);
    console.log('-'.repeat(40));
});