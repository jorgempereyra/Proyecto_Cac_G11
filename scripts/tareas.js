document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const projectId = urlParams.get('id');
    const projectTitleElement = document.getElementById('project-title');

    // Simula la obtención del nombre del proyecto según el ID 
    const projectNames = {
        1: 'Proyecto 1',
        2: 'Proyecto 2',
        3: 'Proyecto 3',
    };

    if (projectId && projectNames[projectId]) {
        projectTitleElement.textContent = `Proyectos / ${projectNames[projectId]}`;
    } else {
        projectTitleElement.textContent = 'Proyectos / Proyecto Desconocido';
    }

    document.getElementById('back-button').addEventListener('click', function() {
        window.location.href = 'Proyectos.html';
    });

    cargarTareas(projectId);
    document.getElementById('filter-button').addEventListener('click', function() {
        filtrarTareas();
    });
});


const listaTareas = [
    { id: 1, idProyecto: 1, titulo: "Tarea 1", asignado: "Persona 1", estado: "Pendiente" },
    { id: 2, idProyecto: 1, titulo: "Tarea 2", asignado: "Persona 2", estado: "En progreso" },
    { id: 3, idProyecto: 1, titulo: "Tarea 3", asignado: "Persona 1", estado: "Completado" },
    { id: 4, idProyecto: 2, titulo: "Tarea 4", asignado: "Persona 2", estado: "Pendiente" },
    { id: 5, idProyecto: 3, titulo: "Tarea 5", asignado: "Persona 1", estado: "Completado" },
    { id: 6, idProyecto: 2, titulo: "Tarea 6", asignado: "Persona 2", estado: "Pendiente" },
    // Agrega más tareas según sea necesario
];

function cargarTareas(idProyecto) {
    const tareasProyecto = listaTareas.filter(tarea => tarea.idProyecto == idProyecto);
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

    tareasProyecto.forEach(tarea => {
        const tareaElement = document.createElement('div');
        tareaElement.classList.add('tarea');
        tareaElement.innerHTML = `
            <span>${tarea.titulo}</span>
            <span>${tarea.asignado}</span>
            <span>${tarea.estado}</span>
        `;
        tasksContainer.appendChild(tareaElement);
    });
}

function filtrarTareas(titulo, asignado, estado) {
    let tareasFiltradas = listaTareas;

    if (titulo) {
        tareasFiltradas = tareasFiltradas.filter(tarea => tarea.titulo.toLowerCase().includes(titulo.toLowerCase()));
    }
    if (asignado) {
        tareasFiltradas = tareasFiltradas.filter(tarea => tarea.asignado === asignado);
    }
    if (estado) {
        tareasFiltradas = tareasFiltradas.filter(tarea => tarea.estado === estado);
    }

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

    tareasFiltradas.forEach(tarea => {
        const tareaElement = document.createElement('div');
        tareaElement.classList.add('tarea');
        tareaElement.innerHTML = `
            <span>${tarea.titulo}</span>
            <span>${tarea.asignado}</span>
            <span>${tarea.estado}</span>
        `;
        tasksContainer.appendChild(tareaElement);
    });
}

document.getElementById('filter-button').addEventListener('click', function() {
    const titulo = document.getElementById('search-title').value;
    const asignado = document.getElementById('assigned').value;
    const estado = document.getElementById('status').value;
    filtrarTareas(titulo, asignado, estado);
});

window.addEventListener('load', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const idProyecto = urlParams.get('id');
    if (idProyecto) {
        cargarTareas(idProyecto);
    }
});
