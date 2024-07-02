document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const projectId = urlParams.get('id');
    const projectTitleElement = document.getElementById('project-title');

    fetch(`/api/proyectos/${projectId}`)
        .then(response => response.json())
        .then(data => {
            if (data && data.name) {
                projectTitleElement.textContent = `Proyectos / ${data.name}`;
            } else {
                projectTitleElement.textContent = 'Proyectos / Proyecto Desconocido';
            }
        })
        .catch(error => {
            projectTitleElement.textContent = 'Proyectos / Proyecto Desconocido';
        });

    document.getElementById('back-button').addEventListener('click', function() {
        window.location.href = 'proyectos.html';
    });

    cargarTareas(projectId);
    document.getElementById('filter-button').addEventListener('click', function() {
        filtrarTareas();
    });
});

function cargarTareas(idProyecto) {
    fetch(`/api/tareas/${idProyecto}`)
        .then(response => response.json())
        .then(data => {
            const tasksContainer = document.querySelector('.tasks');
            tasksContainer.innerHTML = '';

            const header = document.createElement('div');
            header.classList.add('task-header');
            header.innerHTML = `
                <span>Título</span>
                <span>Asignado</span>
                <span>Estado</span>
            `;
            tasksContainer.appendChild(header);

            data.tareas.forEach(tarea => {
                const tareaElement = document.createElement('div');
                tareaElement.classList.add('tarea');
                tareaElement.innerHTML = `
                    <span>${tarea.titulo}</span>
                    <span>${tarea.asignado}</span>
                    <span>${tarea.estado}</span>
                `;
                tasksContainer.appendChild(tareaElement);
            });
        })
        .catch(error => {
            console.error('Error cargando tareas:', error);
        });
}

function filtrarTareas() {
    const titulo = document.getElementById('search-title').value;
    const asignado = document.getElementById('assigned').value;
    const estado = document.getElementById('status').value;
    const urlParams = new URLSearchParams(window.location.search);
    const idProyecto = urlParams.get('id');

    fetch(`/api/tareas/${idProyecto}?titulo=${titulo}&asignado=${asignado}&estado=${estado}`)
        .then(response => response.json())
        .then(data => {
            const tasksContainer = document.querySelector('.tasks');
            tasksContainer.innerHTML = '';

            const header = document.createElement('div');
            header.classList.add('task-header');
            header.innerHTML = `
                <span>Título</span>
                <span>Asignado</span>
                <span>Estado</span>
            `;
            tasksContainer.appendChild(header);

            data.tareas.forEach(tarea => {
                const tareaElement = document.createElement('div');
                tareaElement.classList.add('tarea');
                tareaElement.innerHTML = `
                    <span>${tarea.titulo}</span>
                    <span>${tarea.asignado}</span>
                    <span>${tarea.estado}</span>
                `;
                tasksContainer.appendChild(tareaElement);
            });
        })
        .catch(error => {
            console.error('Error filtrando tareas:', error);
        });
}
