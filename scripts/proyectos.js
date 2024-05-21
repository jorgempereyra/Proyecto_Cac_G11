// proyectos.js

const loggedInUser = "Juan Perez"; // Simula el usuario logueado

let data= {
    "projects": [
        {
            "id": 1,
            "icon": "⭐",
            "name": "Proyecto 1",
            "type": "Desarrollo",
            "status": "Doing",
            "responsible": "Juan Perez",
            "url": "www.proyecto1.com"
        },
        {
            "id": 2,
            "icon": "🥑",
            "name": "Proyecto 2",
            "type": "Marketing",
            "status": "En Riesgo",
            "responsible": "Ana Gomez",
            "url": "www.proyecto2.com"
        },
        {
            "id": 3,
            "icon": "🍒",
            "name": "Proyecto 3",
            "type": "Investigación",
            "status": "Fuera de Tiempo",
            "responsible": "Carlos Ruiz",
            "url": "www.proyecto3.com"
        },
        {
            "id": 4,
            "icon": "🎂",
            "name": "Proyecto 4",
            "type": "Desarrollo",
            "status": "Doing",
            "responsible": "Juan Perez",
            "url": "www.proyecto4.com"
        },
        {
            "id": 5,
            "icon": "⛱️",
            "name": "Proyecto 5",
            "type": "Marketing",
            "status": "Doing",
            "responsible": "Pedro Lopez",
            "url": "www.proyecto5.com"
        },
        {
            "id": 6,
            "icon": "🍒",
            "name": "Proyecto 6",
            "type": "Investigación",
            "status": "Fuera de Tiempo",
            "responsible": "Juan Perez",
            "url": "www.proyecto3.com"
        },
        {
            "id": 7,
            "icon": "🎂",
            "name": "Proyecto 7",
            "type": "Desarrollo",
            "status": "Doing",
            "responsible": "Laura Martinez",
            "url": "www.proyecto4.com"
        },
        {
            "id": 9,
            "icon": "🍒",
            "name": "Proyecto 9",
            "type": "Investigación",
            "status": "Fuera de Tiempo",
            "responsible": "Juan Perez",
            "url": "www.proyecto3.com"
        },
        {
            "id": 8,
            "icon": "⛱️",
            "name": "Proyecto 8",
            "type": "Marketing",
            "status": "Doing",
            "responsible": "Pedro Lopez",
            "url": "www.proyecto5.com"
        },
    {
        "id": 10,
        "icon": "⛱️",
        "name": "Proyecto 8",
        "type": "Marketing",
        "status": "En Riesgo",
        "responsible": "Juan Perez",
        "url": "www.proyecto5.com"
    }
    ]
}


async function loadProjects() {
    try {
        const projects = data.projects;
        const projectsContainer = document.querySelector('.projects');
        projectsContainer.innerHTML = ''; // Limpiar proyectos existentes

        projects.forEach(project => {
            if (project.responsible === loggedInUser) {
                const projectElement = document.createElement('div');
                projectElement.classList.add('project');
                projectElement.setAttribute('data-id', project.id);

                projectElement.innerHTML = `
                    <span class="icon">${project.icon}</span>
                    <span class="name"><a href="incidentes_proyectos.html?id=${project.id}">${project.name}</a></span>
                    <span class="type">${project.type}</span>
                    <span class="status ${project.status.toLowerCase().replace(/ /g, '-')}">${project.status}</span>
                    <span class="responsible">${project.responsible}</span>
                    <span class="url"><a href="#">${project.url}</a></span>
                    <button class="delete-button">Eliminar</button>
                `;

                projectsContainer.appendChild(projectElement);
            }
        });

        addEventListeners();
    } catch (error) {
        console.error('Error cargando proyectos:', error);
    }
}

function addEventListeners() {
    document.getElementById('search-input').addEventListener('input', function () {
        const filter = this.value.toLowerCase();
        const projects = document.querySelectorAll('.project');

        projects.forEach(function (project) {
            const projectName = project.querySelector('.name').textContent.toLowerCase();
            if (projectName.includes(filter)) {
                project.style.display = '';
            } else {
                project.style.display = 'none';
            }
        });
    });

    document.querySelectorAll('.delete-button').forEach(button => {
        button.addEventListener('click', function (event) {
            event.stopPropagation();
            const project = this.closest('.project');
            project.remove();
        });
    });

    document.getElementById('filter-owner').addEventListener('change', function () {
        const owner = this.value;
        const projects = document.querySelectorAll('.project');

        projects.forEach(project => {
            const projectOwner = project.querySelector('.responsible').textContent;
            if (owner === '' || projectOwner === owner) {
                project.style.display = 'grid';
            } else {
                project.style.display = 'none';
            }
        });
    });

    document.querySelectorAll('.project').forEach(project => {
        project.addEventListener('click', function () {
            const projectId = this.getAttribute('data-id');
            if (projectId) {
                window.location.href = `incidentes_proyectos.html?id=${projectId}`;
            } else {
                console.error('El proyecto no tiene un atributo data-id.');
            }
        });
    });
}

document.addEventListener('DOMContentLoaded', loadProjects);