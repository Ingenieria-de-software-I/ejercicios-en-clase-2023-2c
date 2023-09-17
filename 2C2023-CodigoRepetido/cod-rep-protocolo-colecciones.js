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

    filtrarJugadorPorPosicion(jugadores, posicionPara) {
        return jugadores.filter(jugador => posicionPara(jugador));
    }
}

const equipo = new EquipoDeFutbol();
const jugadores = [
    new Jugador('delantero'),
    new Jugador('arquero'),
    new Jugador('delantero'),
];


const esArquero = jugador => jugador.esArquero();
const esDelantero = jugador => jugador.esDelantero();

const jugadoresArqueros = equipo.filtrarJugadorPorPosicion(jugadores, esArquero);
const jugadoresDelanteros = equipo.filtrarJugadorPorPosicion(jugadores, esDelantero);

assert.strictEqual(jugadoresArqueros.length, 1, 'Debería haber un solo arquero');
assert.strictEqual(jugadoresDelanteros.length, 2, 'Debería haber solo dos delanteros');
