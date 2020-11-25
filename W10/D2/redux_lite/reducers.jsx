let state = {
    user: "Sam",
    role: "cross fit mastery"
}

let alan = {
    user: "Alan",
    role: "small feet"
}

const action = {
    type: "change role",
    newRole: "brittle teeth"
}

const userAction = {
    type: "change user",
    newUser: "alan"
}

function userReducer(oldRole = null, action){
  if(action.type === "change user"){
    return reduce.newUser;
  } else {
    return oldRole;
  }
}

function roleReducer(oldRole = null, action){
  if(action.type === "change role"){
    return reduce.newRole;
  } else {
    return oldRole;
  }
}

