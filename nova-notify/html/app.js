const container = document.getElementById('notifications');
const timers = new Set();

function setPosition(position) {
    container.className = position || 'top-right';
}

function removeNotification(element) {
    if (!element) return;

    element.classList.add('leave');

    setTimeout(() => {
        element.remove();
    }, 250);
}

function addNotification(data) {
    setPosition(data.position);

    const typeData = data.typeData || {
        label: 'INFO',
        icon: 'i'
    };

    const notification = document.createElement('div');
    notification.className = 'notification';

    const icon = document.createElement('div');
    icon.className = 'icon';
    icon.textContent = typeData.icon || 'i';

    const content = document.createElement('div');

    const label = document.createElement('div');
    label.className = 'label';
    label.textContent = typeData.label || 'INFO';

    const message = document.createElement('div');
    message.className = 'message';
    message.textContent = data.message || '';

    content.appendChild(label);
    content.appendChild(message);

    notification.appendChild(icon);
    notification.appendChild(content);
    container.appendChild(notification);

    const maxVisible = Number(data.maxVisible || 5);

    while (container.children.length > maxVisible) {
        removeNotification(container.firstElementChild);
    }

    const duration = Number(data.duration || 4500);

    const timer = setTimeout(() => {
        removeNotification(notification);
        timers.delete(timer);
    }, duration);

    timers.add(timer);
}

function clearNotifications() {
    for (const timer of timers) {
        clearTimeout(timer);
    }

    timers.clear();

    [...container.children].forEach(removeNotification);
}

window.addEventListener('message', event => {
    const data = event.data || {};

    if (data.action === 'notify') {
        addNotification(data);
    }

    if (data.action === 'clear') {
        clearNotifications();
    }
});
