function myMove() {
  var elem = document.getElementById("animate");
  var pos=0,tpos=0,lpos = 0;
  var id = setInterval(frame, 5);
  var direction = "right";
  function frame() {
    debugger;
    console.log(pos+' '+tpos +' '+lpos)
    if (pos == 350) {
      clearInterval(id);
    } else {
      if (direction=='right') {
        lpos++
        if (lpos==300) {
          direction='down'
        }
      } else if (direction=='down') {
        tpos++
         if (tpos==300) {
          direction='left'
        }
      } else if (direction=='left') {
        lpos--
         if (lpos==0) {
          direction='up'
        }
      } else if (direction=='up') {
        tpos--
         if (tpos==0) {
          clearInterval(id);
          direction='right'
        }
      }
      console.log(pos+' '+tpos +' '+lpos);
      elem.style.top = tpos + 'px';
      elem.style.left = lpos + 'px';
    }
  }
}
