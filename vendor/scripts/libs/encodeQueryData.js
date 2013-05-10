
// Usage:
//   var data = { 'first name': 'George', 'last name': 'Jetson', 'age': 110 };
//   var querystring = EncodeQueryData(data);
//
function encodeQueryData(data) {
   var ret = [];
   for (var d in data)
      ret.push(encodeURIComponent(d) + "=" + encodeURIComponent(data[d]));
   return ret.join("&");
}
