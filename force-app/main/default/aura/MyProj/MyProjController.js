({    
    CreateRecord: function (component, event, helper) {
        var fileInput = component.find("file").getElement();
        var file = fileInput.files[0];
        //alert(file);
        if (file){
            //console.log("File");
            var reader = new FileReader();
            reader.readAsText(file, "UTF-8");
            reader.onload = function (evt) {
                
                //console.log("EVT FN");
                var csv = evt.target.result;
                //console.log('csv file contains'+ csv);
                var result = helper.CSV2JSON(component,csv);
                //console.log('result = ' + result);
                //console.log('Result = '+JSON.parse(result));
                helper.Create(component,result);
                
            }
            reader.onerror = function (evt) {
                //console.log("error reading file");
            }
        }
        
    },
    
    showfiledata :  function (component, event, helper){        
        var fileInput = component.find("file").getElement();// получаем наш инпут
        var file = fileInput.files[0];//файл
        if (file) { //если файл есть
            component.set("v.showcard", true); // задаем в тру переменную в компоненте 
            //console.log("File");
            var reader = new FileReader(); // объект считки
            reader.readAsText(file, "UTF-8");//убмбум
            reader.onload = function (evt) {
                var csv = evt.target.result;
                var table = document.createElement("table");
                var rows = csv.split("\n");
                for (var i = 0; i < rows.length; i++) {
                    var cells = rows[i].split(",");
                    if (cells.length > 1) {
                        var row = table.insertRow(-1);
                        for (var j = 0; j < cells.length; j++) {
                            var cell = row.insertCell(-1);
                            cell.innerHTML = cells[j];
                        }
                    }
                }
                var divCSV = document.getElementById("divCSV");
                divCSV.innerHTML = "";
                divCSV.appendChild(table);
            } //выводит файл на экра
            reader.onerror = function (evt) {
                //console.log("error reading file");
            }
        }
    },    
    
    
   
    
})