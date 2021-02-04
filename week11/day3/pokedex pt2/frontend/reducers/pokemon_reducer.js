import { RECEIVE_ALL_POKEMON, REQUEST_SINGLE_POKEMON} from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case REQUEST_SINGLE_POKEMON:
      nextState[action.payload.pokemon.id] = action.payload.pokemon;
      return nextState;
  default:
    return state;
  }
}
  
export default pokemonReducer;
