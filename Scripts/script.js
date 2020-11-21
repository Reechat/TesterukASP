function countScore() {
    let inputs = document.getElementsByTagName('input');
    let count = 0;
    for (let input of inputs) 
    {
        if (input.checked == true) 
        {
            count+=Number(input.value);
        }
    }
    alert(count);
  }