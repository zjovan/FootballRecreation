/**
 * 
 */
package rs.tfzr.FudbalT2.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;

import rs.tfzr.FudbalT2.model.Exhibition;
import rs.tfzr.FudbalT2.model.Player;
import rs.tfzr.FudbalT2.repository.ExhibitionRepository;
import rs.tfzr.FudbalT2.service.ExhibitionService;
import rs.tfzr.FudbalT2.service.PlayerService;

/**
 * @author Miroslav
 *
 */
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired
	private ExhibitionRepository exhibitionRepository;
	
	@Autowired
	private PlayerService playerService;

	/*
	 * (non-Javadoc)
	 * 
	 * @see rs.tfzr.FudbalT2.service.CrudService#findOne(java.lang.Long)
	 */
	@Override
	public Exhibition findOne(Long id) {
		return exhibitionRepository.findOne(id);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see rs.tfzr.FudbalT2.service.CrudService#findAll()
	 */
	@Override
	public List<Exhibition> findAll() {
		return exhibitionRepository.findAll();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see rs.tfzr.FudbalT2.service.CrudService#save(rs.tfzr.FudbalT2.model.
	 * AbstractBaseEntity)
	 */
	@Override
	public Exhibition save(Exhibition exhibition) {
		return exhibitionRepository.save(exhibition);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see rs.tfzr.FudbalT2.service.CrudService#remove(java.lang.Long)
	 */
	@Override
	public void remove(Long id) throws IllegalArgumentException {
		exhibitionRepository.delete(id);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see rs.tfzr.FudbalT2.service.ExhibitionService#listAllPlayers()
	 */
	@Override
	public List<Player> listAllPlayers() {
		// TODO Auto-generated method stub
		return null;
	}

	

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * rs.tfzr.FudbalT2.service.ExhibitionService#addPlayer(rs.tfzr.FudbalT2
	 * .model.Exhibition)
	 */
	@Override
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void addPlayer(Exhibition exhibition) {
		Player player = new Player();
		exhibition.getPlayers().add(player);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * rs.tfzr.FudbalT2.service.ExhibitionService#removePlayer(java.lang.Long,
	 * rs.tfzr.FudbalT2.model.Exhibition)
	 */
	@Override
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void removePlayer(Long playerId, Exhibition exhibition) {
		if (playerId == null || playerId > exhibition.getPlayers().size() - 1) {
			throw new IllegalArgumentException(String.format(
					"Error: Tried to delete non-existing entity with id=%d.",
					playerId));
		}
		exhibition.getPlayers().remove(playerId.intValue());

	}

	@Override
	public void addToTeam(Long playerId, int team) {
		// TODO Auto-generated method stub
		
	}

//	@Override
//	public void addToTeam(Long playerId, Player.Team team) {
//		Player player = playerService.findOne(playerId);
//		
//		
//	}

	

	

	

}