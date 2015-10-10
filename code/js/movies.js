/**
 * Created by shawnkyzer on 3/10/15.
 */

// Normally this would be done in jQuery or some other library but to keep the HTML JS free and clean I am adding the
// event here to the button.
window.onload = (function () {
    var button = document.getElementById("fixem");
    // add onclick event
    button.onclick = function () {
        fixList("movie-list");
    }
});


function fixList(tableId) {
    var table = document.getElementById(tableId);
    var rowCount = table.rows.length;
    var removedItemsCount = 0;
    var maxYear = 2000;
    var minVotes = 200000;

    for (var i = 1; i < rowCount; i++) {
        var row = table.rows[i];

        var curMovie = getMovieData(row.innerHTML);

        // It is important for optimization that once a record is identified
        // it is removed and the row and iterator adjusted accordingly as
        // we traverse the DOM
        if (curMovie.year <= maxYear | curMovie.votes < minVotes) {
            table.deleteRow(i);
            i--;
            rowCount--;
            removedItemsCount++;
        } else {
            // fix the titilization
            row.innerHTML = row.innerHTML.replace(curMovie.title, curMovie.title.toTitleCase());
        }

    }
    var spanRemoved = document.getElementById("num-of-removed");
    spanRemoved.innerHTML = removedItemsCount.toString();
}
function getMovieData(row) {

    // Store the html in preparation for regex
    var rowHtml = row;

    // Construct the pattern
    var moviePattern = /<a.*>[\s\S]?(.*)[\s\S]?.*[\s\S]?<\/a>\s?.*\((.*\d)\)[\s\S]*Votes:(.*\d)/;

    // execute regex and add to array
    var movieData = moviePattern.exec(rowHtml);

    // update the movie object/record to hold the data
    var movie = {
        title: movieData[1].trim(),
        year: movieData[2].trim(),
        votes: movieData[3].trim().replace(",", "")
    };

    return movie;
}
// Seemed better to use a prototype as this is a lot like upper or lower case and will almost always be used on a string
String.prototype.toTitleCase = function () {
    return this.toLowerCase().replace(/^(.)|\s(.)/g,
        function ($1) {
            return $1.toUpperCase();
        });
};
