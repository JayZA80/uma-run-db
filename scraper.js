//This is the query I ran on (https://gametora.com/umamusume/skills) to get all the skills currently available

const skillTableHTML = document.querySelector('div.skills_skill_table__ZoEHP');

const skillList = Array.from(skillTableHTML.querySelectorAll('div.skills_table_row_ja__XXxOj'));

let skills = [];

skillList.forEach(skill => {
    let s = {
        name: skill.querySelector('.sc-ab35c2f7-0.gImSzc.skills_table_jpname__5TTkO').innerText,
        desc: skill.querySelector('.skills_table_desc__NzNzY').innerText
    }
    skills.push(s)
});

console.log(skills.length);
