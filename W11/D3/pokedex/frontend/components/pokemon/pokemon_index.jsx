import React from 'react'

export default class PokemonIndex extends React.Component {
    componentDidMount () {
        this.props.requestAllPokemon();
    }

    render () {
        return (
            <ul className="pokemon-list">
                {this.props.pokemon.map( poke => {
                    return(
                        <div key={poke.id}>
                            <li>
                                {poke.name}
                                <img src={poke.imageUrl}/>
                            </li>
                        </div>
                    )
                })}
            </ul>
        )
    }
}