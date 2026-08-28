const app = document.getElementById('app');
const players = document.getElementById('players');
const search = document.getElementById('search');

let playerData = [];

function nui(name, data = {}) {
    return fetch(`https://${GetParentResourceName()}/${name}`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data)
    });
}

function render() {
    const query = search.value.toLowerCase();

    players.innerHTML = '';

    playerData
        .filter(p => `${p.name} ${p.id}`.toLowerCase().includes(query))
        .forEach(p => {
            const row = document.createElement('div');
            row.className = 'player';

            row.innerHTML = `
                <div>
                    <div class="name">${p.name}</div>
                    <div class="meta">ID ${p.id} · Ping ${p.ping}ms</div>
                </div>
                <div class="actions">
                    <button onclick="heal(${p.id})">Heal</button>
                    <button onclick="revive(${p.id})">Revive</button>
                    <button onclick="freeze(${p.id})">Freeze</button>
                    <button onclick="kick(${p.id})">Kick</button>
                </div>
            `;

            players.appendChild(row);
        });
}

function heal(id) {
    nui('heal', {id});
}

function revive(id) {
    nui('revive', {id});
}

function freeze(id) {
    nui('freeze', {id});
}

function kick(id) {
    const reason = prompt('Kick reason:', 'Kicked by an administrator.');
    if (reason !== null) {
        nui('kick', {id, reason});
    }
}

document.getElementById('close').onclick = () => nui('close');
document.getElementById('refresh').onclick = () => nui('refresh');
search.addEventListener('input', render);

window.addEventListener('message', event => {
    const data = event.data || {};

    if (data.action === 'open') {
        app.style.display = 'flex';
        nui('refresh');
    }

    if (data.action === 'close') {
        app.style.display = 'none';
    }

    if (data.action === 'players') {
        playerData = data.players || [];
        render();
    }

    if (data.action === 'announce') {
        const box = document.getElementById('announce');
        box.textContent = `ADMIN: ${data.message}`;
        box.style.display = 'block';

        setTimeout(() => {
            box.style.display = 'none';
        }, 6000);
    }
});
