export const RECEIVE_JOB = "RECEIVE_JOB"

// export const receiveMgrJob = { //boilerplate const to test export
//   type: RECEIVE_JOB,
//   job: {
//     position: 'manager',
//     wage: 75,
//     id: 1
//   }
// };

export const receiveJob = (job) => {
  return {
    type: RECEIVE_JOB,
    job // setting job key values to job parameter: job #destructuring

  }
}