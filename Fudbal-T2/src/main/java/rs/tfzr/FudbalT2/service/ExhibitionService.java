/**
 * 
 */
package rs.tfzr.FudbalT2.service;



import rs.tfzr.FudbalT2.model.Exhibition;
import rs.tfzr.FudbalT2.model.Player;

/**
 * @author Miroslav
 *
 */
public interface ExhibitionService extends CrudService<Exhibition> {
	// Returns all players in one exhibition          //
	// @returns list of players                       //  Not sure about this
	//List<Player> listAllPlayers();                 //

	// Add a new player to the exhibition
	// @param exhibition to which the player is added
	void addPlayer(Exhibition exhibition, Long userId);

	// removes a player from the exhibition
	// @param playerId - id of the player that is supposed to be removed
	// @param exhibition from which he is going to be removed
	void removePlayer(Long playerId, Exhibition exhibition);

	//adds the player to the team
	//@param playerId - player that needs to be assigned to the team
	//@param team - enum type team that the player needs to be added to [None, Home, Away]
	void addToTeam(Long playerId, Player.Team team);

}
