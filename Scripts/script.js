function countScore(login) {
    let inputs = document.getElementsByTagName('input');
    let count = 0;
    for (let input of inputs) 
    {
        if (input.checked == true) 
        {
            count+=Number(input.value);
        }
    }

    $.ajax({
        url: '/api/wearrate/' + id,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            document.getElementById("wearrate").innerHTML = data;
        },
        error: function (x, y, z) {
            alert(x + '\n' + y + '\n' + z);
        }
    });


    setNumber(login, count);
}
function setNumber(login, count) {
    $.ajax({
        url: '/api/addhistory/' + login,
        type: 'POST',
        data: count,
        contentType: "application/json;charset=utf-8",
        success: function (data) {
            alert('Данные отправлены');
        }
    });
}