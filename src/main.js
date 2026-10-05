import './style.css';

let clicks = 0;
const button = document.querySelector('#test-button');
const result = document.querySelector('#click-result');

button.addEventListener('click', () => {
  clicks += 1;
  result.textContent = `It works! ${clicks} ${clicks === 1 ? 'click' : 'clicks'} so far.`;
});
