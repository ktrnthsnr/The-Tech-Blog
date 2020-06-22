// Test to make sure dates are more readable

const {format_date} = require('../utils/helpers');
// const {format_plural} = require('../utils/helpers');
const {format_url} = require('../utils/helpers');


test('format_date() returns a date string', () => {
    const date = new Date('2020-03-20 16:12:03');
  
    expect(format_date(date)).toBe('3/20/2020');
  });

//   // - test 2 (see utils/helpers.js for more detail on what testing)
// test('format_plural() returns a pluralized word', () => {
//     const word = new Word('Tiger');
//     const amount = new Amount('2');

//     expect(format_plural(word, amount)).toBe('tigers');
//     // expect(format_plural(word, amount)).toBe('tigers');
// });

test('format_url() returns a simplified url string', () => {
    const url1 = format_url('http://test.com/page/1');
    const url2 = format_url('https://www.coolstuff.com/abcdefg/');
    const url3 = format_url('https://www.google.com?q=hello');
  
    expect(url1).toBe('test.com');
    expect(url2).toBe('coolstuff.com');
    expect(url3).toBe('google.com');
  });
