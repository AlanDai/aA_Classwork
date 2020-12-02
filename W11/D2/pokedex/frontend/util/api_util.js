
export const fetchAllPokemon = () => (
    $.ajax({
        url: 'api/pokemon',
        method: 'GET'
    })
)

export const fetchPokemon = (id) => {
    return $.ajax({
        url: `api/pokemon/${id}`,
        method: 'GET'
    });
};