
var table = document.getElementById("tablaCarrito"), sumVal = 0;

for(var i = 1; i < table.rows.length; i++)
{
    sumVal = sumVal + parseInt(table.rows[i].cells[3].innerHTML);
}

document.getElementById("val").innerHTML = "Sum Value = " + sumVal;
console.log(sumVal);