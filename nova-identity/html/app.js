const app = document.getElementById('app');
const list = document.getElementById('characters');
const error = document.getElementById('error');

function nui(name, data = {}) {
    return fetch(`https://${GetParentResourceName()}/${name}`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data)
    });
}

function renderCharacters(chars) {
    list.innerHTML = '';

    (chars || []).forEach(c => {
        const div = document.createElement('div');
        div.className = 'card';
        div.innerHTML = `
            <strong>${c.firstname} ${c.lastname}</strong><br>
            <small>${c.dateofbirth} · ${c.gender} · ${c.height}cm</small>
            <br>
            <button onclick="selectCharacter(${c.id})">Select</button>
            <button onclick="deleteCharacter(${c.id})">Delete</button>
        `;
        list.appendChild(div);
    });
}

function selectCharacter(id) {
    nui('select', {id});
}

function deleteCharacter(id) {
    nui('delete', {id});
}

document.getElementById('create').addEventListener('submit', e => {
    e.preventDefault();

    nui('create', {
        firstname: document.getElementById('firstname').value,
        lastname: document.getElementById('lastname').value,
        dateofbirth: document.getElementById('dob').value,
        gender: document.getElementById('gender').value,
        height: document.getElementById('height').value
    });
});

document.getElementById('close').onclick = () => nui('close');

window.addEventListener('message', event => {
    const data = event.data;

    if (data.action === 'open') {
        app.style.display = 'flex';
        error.textContent = '';
        renderCharacters(data.characters);
    }

    if (data.action === 'close') {
        app.style.display = 'none';
    }

    if (data.action === 'error') {
        error.textContent = data.message || 'Something went wrong.';
    }
});
