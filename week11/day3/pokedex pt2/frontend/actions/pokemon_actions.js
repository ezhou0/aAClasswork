import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const REQUEST_SINGLE_POKEMON = 'REQUEST_SINGLE_POKEMON';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
})

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestSinglePokemon = (id) => (dispatch) => {
  dispatch(startLoadingSinglePokemon());
  return APIUtil.fetchSinglePokemon(id)
    .then(payload => dispatch(receiveSinglePokemon(payload)))
}