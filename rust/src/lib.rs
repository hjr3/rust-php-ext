extern crate libc;

use libc::c_uchar;

#[no_mangle]
/// External interface for the scoring algorithm
pub extern "C" fn ext_score(choice: *const c_uchar, choice_len: u32, query: *const c_uchar, query_len: u32) -> f64 {
    let c = unsafe {
        std::str::from_utf8(std::slice::from_raw_parts(choice, choice_len as usize)).unwrap()
    };

    let q = unsafe {
        std::str::from_utf8(std::slice::from_raw_parts(query, query_len as usize)).unwrap()
    };

    score(c, q)
}

pub fn score(_choice: &str, _query: &str) -> f64 {
    42.0
}
