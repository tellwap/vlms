//.............Authentication Urls..............
// const baseURL = 'http://172.20.10.3:8000/api';
// const baseURL = 'http://192.168.1.100:8000/api';
const baseURL = 'http://172.20.10.2:8000/api';

// https://fahamupay-faas.bfast.fahamutech.com/functions/pay/check/02375676
//0237:bDCCi6fhcp0XWk6zNfI98trBth00pKwl1IH7Xnr0FAEJQeLa

// const baseURL = 'http://192.168.43.202:8000/api';

// const baseURL = 'http://192.168.43.202:8000/api';
// const baseImageURL = 'http://192.168.43.202:8000';

const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/profile';

const placeURL = baseURL + '/centers';
const AREA_URL = baseURL + '/districts';

//...............Errors...........
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
