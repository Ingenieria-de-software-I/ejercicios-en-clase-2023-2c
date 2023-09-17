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
    constructor() {
    }

    obtenerJugadoresArqueros(jugadores) {
        let jugadoresArqueros = [];

        jugadores.forEach(jugador => {
            if (jugador.esArquero()) {
                jugadoresArqueros.push(jugador);
            }
        });

        return jugadoresArqueros;
    }

    obtenerJugadoresDelanteros(jugadores) {
        let jugadoresDelanteros = [];

        jugadores.forEach(jugador => {
            if (jugador.tipo() === 'delantero') {
                jugadoresDelanteros.push(jugador);
            }
        });

        return jugadoresDelanteros;
    }
}

const equipo = new EquipoDeFutbol();
const jugadores = [
    new Jugador('delantero'),
    new Jugador('arquero'),
    new Jugador('delantero'),
];

const jugadoresArqueros = equipo.obtenerJugadoresArqueros(jugadores);
const jugadoresDelanteros = equipo.obtenerJugadoresDelanteros(jugadores);

assert.strictEqual(jugadoresArqueros.length, 1, 'Debería haber un solo arquero');
assert.strictEqual(jugadoresDelanteros.length, 2, 'Debería haber solo dos delanteros');
