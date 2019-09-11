let titleize = function (names, printCallback) {
    let titleized = names.map(function (name) { 
        return name[0].toUpperCase() + name.slice(1).toLowerCase();
     });
    titleized.forEach(printCallback)
}

// titleize(["Mary", "Brian", "Leo"], function (name) { 
//     console.log(`Mx. ${name} Jingleheimer Schmidt`);
//  });

function Elephant(name, height, tricks /* array */) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function () { console.log(`${ this.name } the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`); }
Elephant.prototype.grow = function() { this.height += 12; }
Elephant.prototype.addTrick = function(trick) { this.tricks.push(trick); }
Elephant.prototype.play = function() {
    console.log(`${ this.name } is ${ this.tricks[Math.floor(Math.random() * this.tricks.length)] }!`);
}
Elephant.prototype.paradeHelper = function (elephant) {
    console.log(`${ elephant.name } is trotting by!`);
}

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
// let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

// let herd = [ellie, charlie, kate, micah];
// herd.forEach(Elephant.prototype.paradeHelper);

function dinerBreakfast() {
    let order = ["cheesy scrambled eggs"];

    return function (food) {
        order.push(food);
        foods = order.join(' and ')
        console.log(`I'd like ${ foods } please.`)
    }
}