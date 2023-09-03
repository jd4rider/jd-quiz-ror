console.log("<%=j @data['question_no'] %>")
document.body.addEventListener('htmx:beforeSwap', function(evt) {
    if(parseInt("<%=j @data['question_no'] %>") == parseInt("<%=j @data['numofquestions'] %>")){
        document.getElementById("current_number").innerHTML = "1"
    } else {
        document.getElementById("current_number").innerHTML = "<%= parseInt(@data['question_no']) + 1 %>"
    }
});