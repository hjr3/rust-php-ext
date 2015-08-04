extern crate libc;

use libc::c_char;

use std::str::from_utf8;
use std::ffi::CStr;

#[no_mangle]
/// External interface for the scoring algorithm
pub extern "C" fn ext_score(choice: *const c_char, query: *const c_char) -> f64 {
    let slice = unsafe { CStr::from_ptr(choice).to_bytes() };
    let choice = from_utf8(slice).unwrap();

    let slice = unsafe { CStr::from_ptr(query).to_bytes() };
    let query = from_utf8(slice).unwrap();

    score(choice, query)
}

pub fn score(_choice: &str, _query: &str) -> f64 {
    42.0
}
