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

function isHeigherThanAtLeastOneNeighborTowardsEdge(row, column, area) {
    const targetHeight = area[row][column];

    let visibleRight = true;
    for (let col = column + 1; col < area[row].length; col++) {
        const elementHeight = area[row][col];
        if (elementHeight >= targetHeight) {
            visibleRight = false;
            break;
        }
    }

    if (visibleRight) {
        return true;
    }

    let visibleLeft = true;
    for (let col = column - 1; col >= 0; col--) {
        const elementHeight = area[row][col];
        if (elementHeight >= targetHeight) {
            visibleLeft = false;
            break;
        }
    }

    if (visibleLeft) {
        return true;
    }

    let visibleBottom = true;
    for (let ro = row + 1; ro < area.length; ro++) {
        const elementHeight = area[ro][column];
        if (elementHeight >= targetHeight) {
            visibleBottom = false;
            break;
        }
    }

    if (visibleBottom) {
        return true;
    }

    let visibleTop = true;
    for (let ro = row - 1; ro >= 0; ro--) {
        const elementHeight = area[ro][column];
        if (elementHeight >= targetHeight) {
            visibleTop = false;
            break;
        }
    }

    return visibleTop;
}

function isVisible(row, column, area) {
    return isBorder(row, column, area)
        || isHeigherThanAtLeastOneNeighborTowardsEdge(row, column, area);
}


const filename = getFilename();
readFile(filename, (data) => {
    const area = extractArea(data);

    let counter = 0;
    const visibilities = [];

    for (let row = 0; row < area.length; row++) {
        visibilities[row] = [];
        for (let column = 0; column < area[row].length; column++) {
            if (isVisible(row, column, area)) {
                counter++;
                visibilities[row][column] = 1;
            } else {
                visibilities[row][column] = 0;
            }
        }
    }

    console.log(visibilities);

    console.log('-'.repeat(40));
    console.log(` RESULT: ${counter}`);
    console.log('-'.repeat(40));
});