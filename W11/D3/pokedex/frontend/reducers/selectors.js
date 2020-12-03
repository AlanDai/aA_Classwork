import entitiesReducer from "./entities_reducer";

export const selectAllPokemon = (state) => (
    Object.values(state["entities"]["pokemon"])
    // Object.values(state.entities.pokemon)
)