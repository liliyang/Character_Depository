module CharactersHelper
  
  def map_relationships(relationships)
    relatives = relationships.map do |relationship| 
      link_to relationship.relative.name, character_path(relationship.relative)
    end
    relatives.join(", ").html_safe
  end
end
