window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === 'showMinigame') {
        document.getElementById('settings').style.display = 'none';
    } else if (data.action === 'hideMinigame') {
        document.getElementById('settings').style.display = 'block';
    }
});

function notifyCompletion(success) {
    fetch(`https://${GetParentResourceName()}/minigameComplete`, {
        method: 'POST',
        body: JSON.stringify({ success }),
    }).then(() => {
        window.postMessage({ action: 'hideMinigame' });
    });
}

function notifyExit() {
    fetch(`https://${GetParentResourceName()}/minigameExit`, {
        method: 'POST',
    }).then(() => {
        window.postMessage({ action: 'hideMinigame' });
    });
}

document.getElementById('start-game').addEventListener('click', () => {
    notifyCompletion(true);
});
