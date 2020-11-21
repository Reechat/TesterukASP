function countScore(var login) {
    let inputs = document.getElementsByTagName('input');
    let count = 0;
    for (let input of inputs) 
    {
        if (input.checked == true) 
        {
            count+=Number(input.value);
        }
    }
    setNumber(login, count);
}
function setNumber(login, count) {
    $.ajax({
        url: '/api/addhistory/' + id,
        type: 'POST',
        data: id,
        contentType: "application/json;charset=utf-8",
        success: function (data) {
            alert('Данные отправлены');
        }
    });
}