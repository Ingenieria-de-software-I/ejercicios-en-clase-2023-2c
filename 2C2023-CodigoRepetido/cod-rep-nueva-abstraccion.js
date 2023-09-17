const assert = require('assert'); // https://nodejs.org/api/assert.html

class Jugador {
    constructor(tipo) {
        this._tipo = tipo;
    }

    esDelantero() {
        return this._tipo === 'delantero';
    }

    esArquero() {
        return this._tipo === 'arquero';
    }

    tipo() {
        return this._tipo;
    }
}

class EquipoDeFutbol {

    // Utilizamos nueva abstracción

    filtrarJugadorPorPosicion(jugadores, posicionPara) {
        let jugadoresPorPosicion = [];

        jugadores.forEach(jugador => {
            if (posicionPara(jugador)) {
                jugadoresPorPosicion.push(jugador);
            }
        });

        return jugadoresPorPosicion;
    }
}

const equipo = new EquipoDeFutbol();
const jugadores = [
    new Jugador('delantero'),
    new Jugador('arquero'),
    new Jugador('delantero'),
];

// Funciones callback --> Analogía con los closures de ST

const esArquero = jugador => jugador.esArquero();
const esDelantero = jugador => jugador.esDelantero();

const jugadoresArqueros = equipo.filtrarJugadorPorPosicion(jugadores, esArquero);
const jugadoresDelanteros = equipo.filtrarJugadorPorPosicion(jugadores, esDelantero);

assert.strictEqual(jugadoresArqueros.length, 1, 'Debería haber un solo arquero');
assert.strictEqual(jugadoresDelanteros.length, 2, 'Debería haber solo dos delanteros');
