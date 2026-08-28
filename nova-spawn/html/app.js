const app = document.getElementById('app');
const container = document.getElementById('spawns');

function nui(name, data = {}) {
    return fetch(`https://${GetParentResourceName()}/${name}`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data)
    });
}

function renderSpawns(spawns) {
    container.innerHTML = '';

    (spawns || []).forEach(spawn => {
        const card = document.createElement('div');
        card.className = 'spawn';

        card.innerHTML = `
            <h2>${spawn.label}</h2>
            <p>${spawn.description || ''}</p>
            <button onclick="preview('${spawn.id}')">Preview</button>
            <button onclick="spawn('${spawn.id}')">Spawn Here</button>
        `;

        container.appendChild(card);
    });
}

function preview(id) {
    nui('preview', {id});
}

function spawn(id) {
    nui('spawn', {id});
}

document.getElementById('close').onclick = () => nui('close');

window.addEventListener('message', event => {
    const data = event.data;

    if (data.action === 'open') {
        app.style.display = 'flex';
        renderSpawns(data.spawns);
    }

    if (data.action === 'close') {
        app.style.display = 'none';
    }
});
