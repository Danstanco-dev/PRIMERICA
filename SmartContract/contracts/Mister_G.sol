// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract Mister_G is ERC721, ERC721URIStorage, ERC721Burnable{
    
      // Overridering the supportsInterface and tokenURI because it's duplicate to avoid errors, implementing the _burn to destroy tokens 
     function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns(bool) {
    return super.supportsInterface(interfaceId);
  }
   
   function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns(string memory) {
    return super.tokenURI(tokenId);
   }

    // Owner
  address private contract_owner; 

    struct Agent {
        address _agent_address;
        string  _agent_name;
        string  _agent_email;
        uint256 _agent_id;
        bool _agent_banned;
        bool _registered;
        string[] sales_premium_data;
         bool spare_time; 
         bool agent_part_time; 
         bool agent_full_time;
         bool senior_representative; 
         bool district_leader; 
         bool division_leader; 
         bool regional_leader; 
         bool regional_vice_president; 
         bool two_direct_district_leaders; 
         bool four_direct_district_leaders;
         bool six_direct_district_leaders; 
    }
  uint256 private _agent_identication_Count;
  uint256 private _your_agent_id;  
  
  mapping (address => Agent) private _routing_agent;

       // Badge Tier Systems 
    struct Mister_G_Tier_One {
     address _achiever_address;
      bool _licensed_Passed; 
    }
    mapping(address => Mister_G_Tier_One) private _routing_tier_one;

   struct Mister_G_Tier_Two {
    address _achiever_address;
    bool _Debt_Free_Advocate_Task; 
    }
    mapping(address => Mister_G_Tier_Two) private _routing_tier_two;

    struct Mister_G_Tier_Three {
     address _achiever_address;
     bool _Recruiter_Plus_Five_Members_Task; 
    }
    mapping (address => Mister_G_Tier_Three) private _routing_tier_three;

    struct Mister_G_Tier_Four {
    address _achiever_address;
     bool _Broker_Series_Six_Licensed_Task;
    }
    mapping(address => Mister_G_Tier_Four) private _routing_tier_four;

    struct Mister_G_Tier_Five {
      address _achiever_address;
      bool _Mentor_Top_Earner_Task;
    }
    mapping(address => Mister_G_Tier_Five) private _routing_tier_five;

    struct Mister_G_Tier_Six {
      address _achiever_address;
      bool _Recruiter_Plus_Ten_Members_Task; 
    }
    mapping (address => Mister_G_Tier_Six) private _routing_tier_six;

    struct Mister_G_Tier_Seven {
        address _achiever_address;
        bool _Series_Six_3_Licensed_Senior_VP_Task;  
    }
    mapping(address => Mister_G_Tier_Seven) private _routing_tier_seven;

    struct Mister_G_Tier_Eight {
        address _achiever_address;
        bool _Series_Seven_Licensed_Senior_VP_Task;
    }
    mapping(address => Mister_G_Tier_Eight) private _routing_tier_eight;

    struct Mister_G_Tier_Nine {
        address _achiever_address;     
        bool _Series_Six_5_And_Six_6_Licensed_Senior_VP_Task;
    }
    mapping (address => Mister_G_Tier_Nine) private _routing_tier_nine;

    struct Mister_G_Tier_Ten {
     address _achiever_address;
     bool  _Series_Twenty_Six_Licensed_Senior_VP_Task;
    }
    mapping (address => Mister_G_Tier_Ten) private _routing_tier_ten;

    struct US_North_East {
      string[] _New_York_City; 
      string[] _Boston_City; 
      string[] _Philadelphia_City; 
      string[] _Baltimore_City; 
      string[] _Washington_D_C_City; 
      string[] _Pittsburgh_City;
      string[] _Buffalo_City; 
      string[] _Albany_City;
      string[] _Hartford_City; 
      string[] _Providence_City; 
    }
 
    struct US_South { 
      string[] _Atlanta_City; 
      string[] _Miami_City; 
      string[] _Orlando_City; 
      string[] _Tampa_City; 
      string[] _Charlotte; 
      string[] _Raleigh_City; 
      string[] _Nashvilla_City; 
      string[] _New_Orleans_City; 
      string[] _Dallas_City; 
      string[] _Houston_City; 
      string[] _San_Antonio_City; 
      string[] _Austin_City; 
      string[] _Memphis_City; 
      string[] _Birmingham_City; 
      string[] _Louisvilla_City; 
    }

    struct US_Midwest { 
      string[] _Chicago_City; 
      string[] _Detroit_City; 
      string[] _Cleverland_City; 
      string[] _Columbus_City; 
      string[] _Indianapolis_City; 
      string[] _Milwaukee_City; 
      string[] _Minneapolis_City; 
      string[] _St_Louis_City; 
      string[] _Kansas_City;
      string[] _Omaha_City; 
      string[] _Wichita_City;
    }

    struct US_West { 
      string[] _Los_Angeles_City; 
      string[] _San_Francisco_City;
      string[] _San_Diego_City; 
      string[] _Sacramento_City;
      string[] _Phoenix_City; 
      string[] _Denver_City; 
      string[] _Seattle_City; 
      string[] _Portland_City; 
      string[] _Las_Vegas_City; 
      string[] _Salt_Lake_City; 
      string[] _Albuquerque_City; 
      string[] _Honolulu; 
    }

    struct Canada_Hubs { 
      string[] _Toronto_City;
      string[] _Vancouver_City; 
      string[] _Montreal_City; 
      string[] _Calgary_City; 
      string[] _Edmonton_City; 
      string[] _Ottawa_City; 
      string[] _Winnipeg_City; 
      string[] _Halifax_City; 
      string[] _Quebec_City; 
      string[] _Mississauga_City; 
      string[] _Victoria_City; 
    }
     
     struct PRIMERICA_NFTS { 
      string  _nft_diagram_one; 
      string  _nft_diagram_two; 
      string  _nft_diagram_three; 
      string  _nft_diagram_four; 
      string  _nft_diagram_five; 
      string  _nft_diagram_six; 
      string  _nft_diagram_seven; 
      string  _nft_diagram_eight; 
      string  _nft_diagram_nine;
      string  _nft_diagram_ten;
      string  _recruit_nft;  
     }
     
     struct StakeHolders { 
    address  _kayne_anderson_rudnick; 
    address  _vanguard_group;
    address  _blackrock; 
    address  _fmr_fidelity; 
    address  _bamco_baron_capital; 
    address  _burgundy_asset_management; 
    address  _state_street; 
    address  _brave_warrior_advisors;
     }

     US_North_East private _US_north_east; 
     US_South private _US_south; 
     US_Midwest private _US_midwest; 
     US_West  private _US_west; 
     Canada_Hubs private _CA_hubs; 
    PRIMERICA_NFTS private _PRI_NFTs;
    StakeHolders private _Stake_Holders; 
    

    constructor(
      PRIMERICA_NFTS memory _primerica_nfts, 
      US_North_East memory _us_north_east,
      US_South memory _us_south, 
      US_Midwest memory _us_midwest,
      US_West memory _us_west, 
      Canada_Hubs memory _canada_hubs, 
     StakeHolders memory _stakeholders
    ) ERC721("Mister_G_Award_Coin", "M_G_A_C"){
      _Stake_Holders = _stakeholders;
      contract_owner = msg.sender; 
       _PRI_NFTs = _primerica_nfts; 
      _US_north_east = _us_north_east;
      _US_south =  _us_south;
      _US_midwest =  _us_midwest; 
      _US_west = _us_west; 
      _CA_hubs = _canada_hubs; 
    }
     /* USA North East States Variables */
     string private constant _New_York = "New York";
     string private constant _Boston = "Boston"; 
     string private constant _Philadelphia = "Philadelphia"; 
     string private constant _Baltimore = "Baltimore"; 
     string private constant _Washing_D_C = "Washing DC";
     string private constant _Pittsburgh = "Pittsburgh"; 
     string private constant _Buffalo = "Buffalo"; 
     string private constant _Albany = "Albany"; 
     string private constant _Hartford = "Hartford"; 
     string private constant _Providence = "Providence"; 

   /* --------------------------------------------------------------------------------------------- */
        /* --------------------------- View Exam Centers ----------------------------------------- */
        event View_US_North_East_Emitted(string indexed _US_North_East_Msg);

            function View_US_North_East(string memory _state_name) external  returns(string[] memory) {

             if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
               }

             if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
              }

             
              
             if (keccak256(abi.encode(_New_York)) == keccak256(abi.encode(_state_name))) {
                return  _US_north_east._New_York_City; 
              } else if(keccak256(abi.encode(_Boston)) == keccak256(abi.encode(_state_name))) {
                return _US_north_east._Boston_City; 
              } else if(keccak256(abi.encode(_Philadelphia)) == keccak256(abi.encode(_state_name))) {
                 return _US_north_east._Philadelphia_City; 
              } else if(keccak256(abi.encode(_Baltimore)) == keccak256(abi.encode(_state_name))) {
                 return _US_north_east._Baltimore_City; 
              } else if(keccak256(abi.encode(_Washing_D_C)) == keccak256(abi.encode(_state_name))) { 
                 return  _US_north_east._Washington_D_C_City;
              } else if(keccak256(abi.encode(_Pittsburgh)) == keccak256(abi.encode(_state_name))) { 
                 return _US_north_east._Pittsburgh_City; 
              } else if(keccak256(abi.encode(_Buffalo)) == keccak256(abi.encode(_state_name))) { 
                  return _US_north_east._Buffalo_City; 
              } else if(keccak256(abi.encode(_Albany)) == keccak256(abi.encode(_state_name))) { 
                   return _US_north_east._Albany_City;  
              } else if(keccak256(abi.encode(_Hartford)) == keccak256(abi.encode(_state_name))) { 
                   return _US_north_east._Hartford_City; 
               } else if (keccak256(abi.encode(_Providence)) == keccak256(abi.encode(_state_name))) {
                  return _US_north_east._Providence_City; 
               }         

               emit View_US_North_East_Emitted("Your search has been received this is the list of the locations of the exam centers in your state!");

            }

         

          
            string private constant _Atlanta = "Atlanta"; 
            string private constant _Miami = "Miami"; 
            string private constant _Orlando = "Orlando"; 
            string private constant _Tampa  = "Tampa"; 
            string private constant _Charlotte = "Charlotte"; 
            string private constant _Raleigh = "Raleigh"; 
            string private constant _Nashvilla = "Nashvilla"; 
            string private constant _New_Orleans = "New Orleans"; 
            string private constant _Dallas = "Dallas"; 
            string private constant _Houston = "Houston"; 
            string private constant _San_Antonio = "San Antonio"; 
            string private constant _Austin = "Austin";
            string private constant _Memphis = "Memphis"; 
            string private constant _Birmingham = "Birmingham"; 
            string private constant _Louisvilla = "Louisvilla"; 

             event View_US_South_Emitted(string indexed _US_South_Msg);

             function View_US_South(string memory _state_name) external  returns(string[] memory) {

             if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
               }

             if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
              }

              
              
              if(keccak256(abi.encode(_Atlanta)) == keccak256(abi.encode(_state_name))) {
                return  _US_south._Atlanta_City; 
              } else if(keccak256(abi.encode(_Miami)) == keccak256(abi.encode(_state_name))) {
                return _US_south._Miami_City; 
              } else if(keccak256(abi.encode(_Orlando)) == keccak256(abi.encode(_state_name))) {
                 return _US_south._Orlando_City; 
              } else if(keccak256(abi.encode(_Tampa)) == keccak256(abi.encode(_state_name))) {
                 return _US_south._Tampa_City; 
              } else if(keccak256(abi.encode(_Charlotte)) == keccak256(abi.encode(_state_name))) { 
                 return  _US_south._Charlotte;
              } else if(keccak256(abi.encode(_Raleigh)) == keccak256(abi.encode(_state_name))) { 
                 return _US_south._Raleigh_City; 
              } else if(keccak256(abi.encode(_Nashvilla)) == keccak256(abi.encode(_state_name))) { 
                  return _US_south._Nashvilla_City; 
              } else if(keccak256(abi.encode(_New_Orleans)) == keccak256(abi.encode(_state_name))) { 
                   return _US_south._New_Orleans_City;  
              } else if(keccak256(abi.encode(_Dallas)) == keccak256(abi.encode(_state_name))) { 
                   return _US_south._Dallas_City; 
               } else if (keccak256(abi.encode(_Houston)) == keccak256(abi.encode(_state_name))) {
                  return _US_south._Houston_City; 
               } else if(keccak256(abi.encode(_San_Antonio)) == keccak256(abi.encode(_state_name))) {
                   return _US_south._San_Antonio_City; 
               } else if(keccak256(abi.encode(_Austin)) == keccak256(abi.encode(_state_name))) { 
                    return _US_south._Austin_City; 
               } else if(keccak256(abi.encode(_Memphis)) == keccak256(abi.encode(_state_name))) {
                     return _US_south._Memphis_City; 
               } else if(keccak256(abi.encode(_Birmingham)) == keccak256(abi.encode(_state_name))) {
                     return _US_south._Birmingham_City; 
               } else if(keccak256(abi.encode(_Louisvilla)) == keccak256(abi.encode(_state_name))) {
                   return _US_south._Louisvilla_City; 
               }

               emit View_US_South_Emitted("Your search has been received this is the list of the locations of the exam centers in your state!");
            }
   
            
            
            string private constant _Chicago = "Chicago"; 
            string private constant _Detroit = "Detroit"; 
            string private constant _Columbus = "Columbus"; 
            string private constant _Indianapolis = "Indianapolis"; 
            string private constant _Milwaukee = "Milwaukee"; 
            string private constant _Minneapolis = "Minneapolis"; 
            string private constant _St_Louis = "St Louis"; 
            string private constant _Kansas = "Kansas"; 
            string private constant _Omaha = "Omaha"; 
            string private constant _Wichita = "Wichita"; 
            
            event View_US_Midwest_Emitted(string indexed _US_Midwest_Msg);

             function View_US_Midwest(string memory _state_name) external  returns(string[] memory) {

             if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
               }

             if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
              }

             
              
              if(keccak256(abi.encode(_Chicago)) == keccak256(abi.encode(_state_name))) {
                return  _US_midwest._Chicago_City; 
              } else if(keccak256(abi.encode(_Detroit)) == keccak256(abi.encode(_state_name))) {
                return _US_midwest._Detroit_City; 
              }  else if(keccak256(abi.encode(_Columbus)) == keccak256(abi.encode(_state_name))) {
                 return _US_midwest._Columbus_City; 
              } else if(keccak256(abi.encode(_Indianapolis)) == keccak256(abi.encode(_state_name))) { 
                 return  _US_midwest._Indianapolis_City;
              } else if(keccak256(abi.encode(_Milwaukee)) == keccak256(abi.encode(_state_name))) { 
                 return _US_midwest._Milwaukee_City; 
              } else if(keccak256(abi.encode(_Minneapolis)) == keccak256(abi.encode(_state_name))) { 
                  return _US_midwest._Minneapolis_City; 
              } else if(keccak256(abi.encode(_St_Louis)) == keccak256(abi.encode(_state_name))) { 
                   return _US_midwest._St_Louis_City;  
              } else if(keccak256(abi.encode(_Kansas)) == keccak256(abi.encode(_state_name))) { 
                   return _US_midwest._Kansas_City; 
               } else if(keccak256(abi.encode(_Omaha)) == keccak256(abi.encode(_state_name))) {
                  return _US_midwest._Omaha_City; 
               } else if (keccak256(abi.encode(_Wichita)) == keccak256(abi.encode(_state_name))) {
                  return _US_midwest._Wichita_City; 
               }

               emit View_US_Midwest_Emitted("Your search has been received this is the list of the locations of the exam centers in your state!"); 
            }

      string private constant _Los_Angeles = "Los Angeles";
      string private constant _San_Francisco = "San Francisco"; 
      string private constant _San_Diego = "San Diego"; 
      string private constant _Sacramento = "Sacramento";
      string private constant _Phonenix = "Phonenix"; 
      string private constant _Denver = "Denver"; 
      string private constant _Seattle = "Seattle";
      string private constant _Portland = "Portland";
      string private constant _Las_Vasgas = "Las Vasgas"; 
      string private constant _Salt_Lake = "Salt Lake";
      string private constant _Albuquerque = "Albuquerque";
      string private constant _Honolulu = "Honolulu";
      
      event View_US_West_Emitted(string indexed _US_West_Msg);

      function View_US_West(string memory _state_name) external  returns(string[] memory) {

             if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
               }

             if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
              }

            
              
              if(keccak256(abi.encode(_Los_Angeles)) == keccak256(abi.encode(_state_name))) {
                return  _US_west._Los_Angeles_City; 
              } else if(keccak256(abi.encode(_San_Francisco)) == keccak256(abi.encode(_state_name))) {
                return _US_west._San_Francisco_City; 
              }  else if(keccak256(abi.encode(_San_Diego)) == keccak256(abi.encode(_state_name))) {
                 return _US_west._San_Diego_City; 
              } else if(keccak256(abi.encode(_Sacramento)) == keccak256(abi.encode(_state_name))) { 
                 return  _US_west._Sacramento_City;
              } else if(keccak256(abi.encode(_Phonenix)) == keccak256(abi.encode(_state_name))) { 
                 return _US_west._Phoenix_City; 
              } else if(keccak256(abi.encode(_Denver)) == keccak256(abi.encode(_state_name))) { 
                  return _US_west._Denver_City; 
              } else if(keccak256(abi.encode(_Seattle)) == keccak256(abi.encode(_state_name))) { 
                   return _US_west._Seattle_City;  
              } else if(keccak256(abi.encode(_Portland)) == keccak256(abi.encode(_state_name))) { 
                   return _US_west._Portland_City; 
               } else if(keccak256(abi.encode(_Las_Vasgas)) == keccak256(abi.encode(_state_name))) {
                  return _US_west._Las_Vegas_City; 
               } else if(keccak256(abi.encode(_Salt_Lake)) == keccak256(abi.encode(_state_name))) {
                  return _US_west._Salt_Lake_City; 
               } else if(keccak256(abi.encode(_Albuquerque)) == keccak256(abi.encode(_state_name))) {
                  return _US_west._Albuquerque_City;
               } else if(keccak256(abi.encode(_Honolulu)) == keccak256(abi.encode(_state_name))) { 
                  return _US_west._Honolulu;
               } 

               emit View_US_West_Emitted("Your search has been received this is the list of the locations of the exam centers in your state!");
            }

       string private constant _Toronto = "Toronto"; 
       string private constant _Vancouver = "Vancouver"; 
       string private constant _Montreal = "Montreal"; 
       string private constant _Calgary = "Calgary"; 
       string private constant _Edmonton = "Edmonton"; 
       string private constant _Ottawa = "Ottawa"; 
       string private constant _Winnipeg = "Winnipeg"; 
       string private constant _Halifax = "Halifax"; 
       string private constant _Quebec = "Quebec"; 
       string private constant _Mississauga = "Mississauga"; 
       string private constant _Victoria = "Victoria"; 
         
         event View_Canada_Hubs_Emitted(string indexed _Canada_Hubs_Msg);

            function View_Canada_Hubs(string memory _state_name) external  returns(string[] memory) {

             if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
               }

             if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
              }

             
              
              if(keccak256(abi.encode(_Toronto)) == keccak256(abi.encode(_state_name))) {
                return  _CA_hubs._Toronto_City; 
              } else if(keccak256(abi.encode(_Vancouver)) == keccak256(abi.encode(_state_name))) {
                return _CA_hubs._Vancouver_City; 
              }  else if(keccak256(abi.encode(_Montreal)) == keccak256(abi.encode(_state_name))) {
                 return _CA_hubs._Montreal_City; 
              } else if(keccak256(abi.encode(_Calgary)) == keccak256(abi.encode(_state_name))) { 
                 return  _CA_hubs._Calgary_City;
              } else if(keccak256(abi.encode(_Edmonton)) == keccak256(abi.encode(_state_name))) { 
                 return _CA_hubs._Edmonton_City; 
              } else if(keccak256(abi.encode(_Ottawa)) == keccak256(abi.encode(_state_name))) { 
                  return _CA_hubs._Ottawa_City; 
              } else if(keccak256(abi.encode(_Winnipeg)) == keccak256(abi.encode(_state_name))) { 
                   return _CA_hubs._Winnipeg_City;  
              } else if(keccak256(abi.encode(_Halifax)) == keccak256(abi.encode(_state_name))) { 
                   return _CA_hubs._Halifax_City; 
               } else if(keccak256(abi.encode(_Quebec)) == keccak256(abi.encode(_state_name))) {
                  return _CA_hubs._Quebec_City; 
               } else if(keccak256(abi.encode(_Mississauga)) == keccak256(abi.encode(_state_name))) {
                  return _CA_hubs._Mississauga_City; 
               } else if(keccak256(abi.encode(_Victoria)) == keccak256(abi.encode(_state_name))) {
                  return _CA_hubs._Victoria_City;
               } 

               emit View_Canada_Hubs_Emitted("Your search has been received this is the list of the locations of the exam centers in your state!");
            }
        /* --------------------------------------------------------------------------------------- */
   /* ---------------------------------------------------------------------------------------------- */
      /* ------------------------------- Pre-Licensing --------------------------------------  */


          struct Digital_TextBook {
           string[] _Digital_links;
           string[] _Digital_Textbook_Questions; 
          }
           mapping(address => Digital_TextBook) private _routing_digital_textbook; 
        
        event SetDigital_Textbook_guides_Emitted(string ); 
        function SetDigital_Textbook_guides(string memory _digital_links, string memory _digital_textbook_questions) public Mister_G_Only(msg.sender) returns(bool){
           if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            }

         Digital_TextBook storage _digital_var = _routing_digital_textbook[msg.sender]; 
         _digital_var._Digital_links.push(_digital_links); 
         _digital_var._Digital_Textbook_Questions.push(_digital_textbook_questions);
         
         return true; 
        }
        
        struct Digital_Videos_Tut {
         string[] _Digital_Tut; 
         string[] _Digital_Tut_Questions; 
        }

        mapping(address => Digital_Videos_Tut) private _routing_digital_video_tut; 

        function SetDigital_Tutorial_Video_Guides(string memory _digital_study_video, string memory _digital_study_ques) public  Mister_G_Only(msg.sender) returns(bool)  {
          if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            }

            Digital_Videos_Tut storage _digital_var = _routing_digital_video_tut[msg.sender]; 
            _digital_var._Digital_Tut.push(_digital_study_video);
            _digital_var._Digital_Tut_Questions.push(_digital_study_ques);

            return true; 
        } 
        
        event AccessDigital_Textbook_Emitted(string indexed _access_msg, bool indexed _state);

        function AccessDigital_Textbook() external  returns(Digital_TextBook memory){
           if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            }

           if(msg.sender == address(this)) { 
                 revert Mister_G__Contract_Admin_Restricted(address(this));      
            }

            if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
             }

            

            Digital_TextBook memory digital_textbook_var = _routing_digital_textbook[msg.sender]; 
            
            emit AccessDigital_Textbook_Emitted("Welcome to the Digital Textbook and question Utility to guide you along Primerica", true); 

            return(digital_textbook_var);
        }

         event AccessDigital_Video_Tut_Emitted(string indexed _access_msg, bool indexed _state);

        function AccessDigital_Video_Tut() external returns(Digital_Videos_Tut memory){
           if(address(0) == msg.sender) { 
                  revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            }

           if(msg.sender == address(this)) { 
                 revert Mister_G__Contract_Admin_Restricted(address(this));      
            }

            if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
             }


            Digital_Videos_Tut memory digital_video_tut_var = _routing_digital_video_tut[msg.sender]; 
            
            emit AccessDigital_Video_Tut_Emitted("Welcome to the Digital Video Tutorial and questions Utility to guide you along Primerica", true); 
            
            return(digital_video_tut_var);
        }


       struct Training_Recruited_Rep {
         string[] _learn_to_sell_insurance_mutual_funds_videos;
         string[] _learn_to_sell_insurance_mutual_funds_books; 
       }  
      mapping(address => Training_Recruited_Rep) private routing_training_recruited_rep; 
      
      Training_Recruited_Rep private _training_rep_state_var;

       function Set_Training_Recruited_Rep(string memory _rep_sell_insurance_mutual_funds_video_model, string memory _rep_sell_insurance_mutual_funds_book_model) public Mister_G_Only(msg.sender) returns(string memory) {
          if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 

      Training_Recruited_Rep storage  _training_recruited_rep_var =  routing_training_recruited_rep[msg.sender]; 
      _training_recruited_rep_var._learn_to_sell_insurance_mutual_funds_videos.push(_rep_sell_insurance_mutual_funds_video_model);
       _training_recruited_rep_var._learn_to_sell_insurance_mutual_funds_books.push(_rep_sell_insurance_mutual_funds_book_model);
        
        return("Rep Training Data utilities successfully uploaded"); 
       }

       function Remove_Training_Recruited_Rep_Video_data(uint256 _index) public Mister_G_Only(msg.sender) returns(string memory) {
         if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 

for(uint256 i = _index; i < _training_rep_state_var._learn_to_sell_insurance_mutual_funds_videos.length -1; i++) {
         _training_rep_state_var._learn_to_sell_insurance_mutual_funds_videos[i] = _training_rep_state_var._learn_to_sell_insurance_mutual_funds_videos[i + 1]; 
        }
      
       _training_rep_state_var._learn_to_sell_insurance_mutual_funds_videos.pop();

       return("Rep Training Tutuorial successfully removed!");  
       }
      
      function Remove_Training_Recruited_Rep_Book_data(uint256 _index) public Mister_G_Only(msg.sender) returns(string memory) {
         if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 

        for (uint256 i = _index; i < _training_rep_state_var._learn_to_sell_insurance_mutual_funds_books.length - 1; i++) {
         _training_rep_state_var._learn_to_sell_insurance_mutual_funds_videos[i] = _training_rep_state_var._learn_to_sell_insurance_mutual_funds_books[i + 1]; 
        }
      
       _training_rep_state_var._learn_to_sell_insurance_mutual_funds_books.pop();

       return("Rep Training Digital book successfully removed!"); 
       }

     function View_Training_Recruited_Rep_Video_data() external view returns(string[] memory) {

        if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 
       
        
         
        return(_training_rep_state_var._learn_to_sell_insurance_mutual_funds_videos);
     }

      function View_Training_Recruited_Rep_Book_data() external view returns(string[] memory) {

        if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 
     
       
        
        return(_training_rep_state_var._learn_to_sell_insurance_mutual_funds_books);
     }

    // 24 hours in seconds 
    uint256 public constant  _INTERVAL = 24 hours; 

    // total number of ratings given (lifetime)
    uint256 private totalRatings; 

    // tracks when each user last rated 
    mapping(address => uint256) private lastRatedAt; 
    
    mapping(address => uint256) private _users_rate_volume; 

    event Rated(address indexed _caller, uint256 timestamp, uint256 newTotal);
    error Wait_For_Time_To_Compelete(string _wait_msg);
    address[] private _users_who_rated; 

    function Rate() external returns(string memory) {         
         if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 
        
         

      uint256 last = lastRatedAt[msg.sender]; 

      if(last == 0 || block.timestamp - last >= _INTERVAL) {
         revert Wait_For_Time_To_Compelete("You must wait 24hrs");
      }

      // record rating 
      totalRatings += 1; 
      lastRatedAt[msg.sender] = block.timestamp; 
      _users_rate_volume[msg.sender] = totalRatings; 

      _users_who_rated.push(msg.sender);
      emit Rated(msg.sender, block.timestamp, totalRatings); 
       return("Thanks for rating Primerica! we appreciate your support!"); 
    }

    function timeUntilNext_Rate(address _user) external view  returns (uint256) {
        
         if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 
         
         

      uint256 last = lastRatedAt[_user]; 

      if(last == 0) return 0;

      uint256 elapsed  = block.timestamp - last; 

      if(elapsed >= _INTERVAL) return 0; 

      return _INTERVAL - elapsed; 
    }
   
   function View_Users_Rating_Volume(address _primerica_user) public view returns(uint256) {
        if(address(0) == msg.sender) { 
               revert Mister_G__Invalid_Wallet_Address(msg.sender);       
            } 
      
        

      return(_users_rate_volume[_primerica_user]); 
   }

      /* ------------------------------------------------------------------------------------------ */ 
   /* ---------------------------------------------------------------------------------------------- */
   /* ---------------------------------------------------------------------------------------------- */  

   
   // Registered Agents Array for their name, address, email 
  struct Register_Agents {
    string[]  _Registered_Agents_Name; 
   address[]  _Registered_Agents_Addresses; 
   string[]  _Registered_Agents_Emails;  
   uint256  _agent_registeration_count; 
   string[]  _verified_Primerica_licenses;
  } 
  mapping(address => Register_Agents) private _routing_register_agents;


   error Mister_G__NO_ACCESS_FOR_YOU(address _caller, string _avoid_Msg);
   error Mister_G__Invalid_Wallet_Address(address _caller);
   error Mister_G__Already_Registered(address _caller, uint256 _registered_id);
   error Mister_G__Contract_Admin_Restricted(address _caller);
   error Mister_G__Agent_ON_BAN(address _caller, bool _ban_state);
   error Mister_G__You_Need_To_Registered(address _caller, bool _registered_False);
   error Mister_G__Nothing_To_Confirm(uint256 _nothing_To_Confirm);
   error Mister_G__Zero_Value_Needed(uint256 _Not_Zero); 

    modifier Mister_G_Only(address _caller) {
        if(contract_owner != _caller) {
         revert Mister_G__NO_ACCESS_FOR_YOU(msg.sender, "Plsease you can not access this function call Thank you!");
        }
        _;
    }
    
    event _Agent_Registeration_Emitted(address indexed _client_address, string indexed _client_Name, string indexed _client_Email);
    event Push_Verified_Submitted_licensed_Emitted(address indexed _caller, string indexed _confirmed_license); 
    event Confirm_Verified_Submitted_licensed_Emitted(address indexed _owner, bool indexed _confirmed); 
     
    /* ------------------------------- Tier One system ---------------------------------*/ 
    function Push_Verified_Submitted_licensed_(string memory _confirmed_license) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }

        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }

        Mister_G_Tier_One storage _mister_g_tier_one  = _routing_tier_one[msg.sender]; 
        _mister_g_tier_one._achiever_address  = msg.sender; 
       
       _routing_register_agents[msg.sender]._verified_Primerica_licenses.push(_confirmed_license);
       
       emit Push_Verified_Submitted_licensed_Emitted(msg.sender, _confirmed_license);

       return("Thanks for submitting your primerica license the admin will confirm it and  grant you access to request tier one");   
    }

   function Confirm_Verified_Submitted_licensed_() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_register_agents[msg.sender]._verified_Primerica_licenses.length == 0) { 
            revert Mister_G__Nothing_To_Confirm(_routing_register_agents[msg.sender]._verified_Primerica_licenses.length);
        }

        Mister_G_Tier_One storage _mister_G_tier_one = _routing_tier_one[msg.sender];
        _mister_G_tier_one._licensed_Passed = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }

/* --------------------------------------------------------------------------------------- */

/* ------------------------------- Tier Two System -------------------------------------- */
   
   struct DebtRecord_struct { 
 string[]  _Type_of_debt; 
 uint256[]  _Balance_owned; 
 uint256[]  _Interest_rate; 
 uint256[]  _Minimum_Monthly_Payment;
   }

 DebtRecord_struct private _debtrecord_struct;

 event Push_Client_Debt_InformationEmitted(uint256 indexed _minimum_monthly_payment, uint256 indexed _interest_rate, uint256 indexed _balance_owned);

 function Push_Client_Debt_Information(string memory _type_of_debt, uint256 _balance_owned, uint256 _interest_rate, uint256 _minimum_monthly_payment) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
        Mister_G_Tier_Two storage _mister_g_tier_two = _routing_tier_two[msg.sender];
        _mister_g_tier_two._achiever_address = msg.sender; 
    

       _debtrecord_struct._Type_of_debt.push(_type_of_debt);
       _debtrecord_struct._Balance_owned.push(_balance_owned);
       _debtrecord_struct._Interest_rate.push(_interest_rate);
       _debtrecord_struct._Minimum_Monthly_Payment.push(_minimum_monthly_payment);

       emit  Push_Client_Debt_InformationEmitted(_minimum_monthly_payment, _interest_rate, _balance_owned);

       return("Thank you compeleting this milestone more to go your almost there for the tier two upgrade");
 }
 
 event Debt_Free_Advocate_Emitted(uint256 indexed _interest_percentage_value, uint256 indexed _Minimum_Monthly_Payment_Value, uint256 indexed _number_Of_Days_Left_);

 function Debt_Free_Advocate(uint256 _index) external returns(uint256 _Days_Left) {
       if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
        if(_index != 0 ) { 
            revert Mister_G__Zero_Value_Needed(_index);
        }
   
   uint256 _Balance_owned_Value = _debtrecord_struct._Balance_owned[_index]; 
   uint256 _Interest_rate_Value = _debtrecord_struct._Interest_rate[_index]; 
   uint256 _Minimum_Monthly_Payment_Value = _debtrecord_struct._Minimum_Monthly_Payment[_index]; 

   uint256 _interest_percentage_value = _Balance_owned_Value * _Interest_rate_Value;
   uint256 _number_Of_Days_Left_ = _Balance_owned_Value / _Minimum_Monthly_Payment_Value; 

  emit Debt_Free_Advocate_Emitted(_interest_percentage_value, _Minimum_Monthly_Payment_Value, _number_Of_Days_Left_);

  return(_number_Of_Days_Left_); 
 }
 error Mister_G__DFA_Length_NOT_COMPLETED_YET(uint256 _not_yet_completed);
 event Assign_Debt_Free_Advocate_Tier_Emitted(bool indexed _dfa_reached, string indexed _mister_G_dfa_msg); 

 function Assign_Debt_Free_Advocate_Tier() public Mister_G_Only(msg.sender) returns(bool) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      if(_debtrecord_struct._Type_of_debt.length < 10) {
          revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_debtrecord_struct._Type_of_debt.length);
      }
      if(_debtrecord_struct._Balance_owned.length < 10) {
          revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_debtrecord_struct._Balance_owned.length);
      }
      if(_debtrecord_struct._Interest_rate.length < 10) {
          revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_debtrecord_struct._Interest_rate.length);
      }
      if(_debtrecord_struct._Minimum_Monthly_Payment.length < 10) {
        revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_debtrecord_struct._Minimum_Monthly_Payment.length);
      }
   Mister_G_Tier_Two storage _mister_g_tier_two  = _routing_tier_two[msg.sender];
   _mister_g_tier_two._Debt_Free_Advocate_Task = true;
    
    emit Assign_Debt_Free_Advocate_Tier_Emitted(true, "DFA(Deft Free Advocate) milestone reached");
   return(true); 
 }
/* -------------------------------------------------------------------------------------- */
/* ------------------------------- Tier Three System ------------------------------------ */

 struct Recruit_Function_record { 
string[]  store_recruited_Name;
string[]  store_recruited_Nation_ID;
string[]  store_recruited_Email;
uint256[]  _Store_recruit_Count;

 }
 uint256  _recruit_Id_count;
Recruit_Function_record private _recruit_function_record;  
mapping(address => Recruit_Function_record) private _routing_recruit_function_record; 
mapping(address => address) private _track_recruiter;
mapping(address =>  uint256) private _track_number_recruited; 

 event Recruiter_Function_Emitted(string indexed _recruited_Name, string indexed _recruit_Msg);

   function Recruiter_Function(string memory _recruited_Name, string memory _recruited_National_Identification, string memory _recruited_Email) external  returns(string memory _Recruit_Msg) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
         if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
        
        Recruit_Function_record storage _recruit_function_record = _routing_recruit_function_record[msg.sender]; 

       _recruit_function_record.store_recruited_Name.push(_recruited_Name);
       _recruit_function_record.store_recruited_Nation_ID.push(_recruited_National_Identification);
       _recruit_function_record.store_recruited_Email.push(_recruited_Email);
     
         _recruit_Id_count++;
       _recruit_function_record._Store_recruit_Count.push(_recruit_Id_count);
         
       _track_recruiter[msg.sender] = msg.sender; 
       _track_number_recruited[msg.sender] += 1;
      _Recruit_Msg = "Your  Primerica Backbone member, keep going and let's build the future together!"; 
      emit Recruiter_Function_Emitted(_recruited_Name, _Recruit_Msg);

      return(_Recruit_Msg);
   }
  
  error Mister_G_Rcruit_Count_NOT_Reached(uint256 _recruit_Not_reached, string _Keeper_Recruiting);
   
   event Claim_Recruit_Tier_Three_Emitted(bool indexed _recruiter_Five, string indexed _recruiting_msg);

   function Claim_Recruit_Tier_Three() external returns(string memory) {
       //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
          if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
        if(_recruit_function_record._Store_recruit_Count.length < 5) {
            revert Mister_G_Rcruit_Count_NOT_Reached(_recruit_function_record._Store_recruit_Count.length, "Pls keep recruiting your almost there!");
        }

        Mister_G_Tier_Three storage _mister_g_three = _routing_tier_three[msg.sender]; 
        _mister_g_three._achiever_address = msg.sender; 
        _mister_g_three._Recruiter_Plus_Five_Members_Task = true;

        emit  Claim_Recruit_Tier_Three_Emitted(true, "Congrats you have successfully earned Tier 3");

        return("Congrats you have successfully earned Tier 3"); 
   }
/* -------------------------------------------------------------------------------------- */
/* ---------------------------------- Tier 4 System ------------------------------------- */
  string[] private _verified_Primerica_license_Six;
  event Push_Verified_Submitted_licensed_Six_Emitted(address indexed _license_six_achiever, string indexed _confirmed_license_six);

    function Push_Verified_Submitted_licensed_Six(string memory _confirmed_license_six) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }

        Mister_G_Tier_Four storage _mister_g_tier_four  = _routing_tier_four[msg.sender]; 
        _mister_g_tier_four._achiever_address  = msg.sender; 
       
       _verified_Primerica_license_Six.push(_confirmed_license_six);
       
       emit Push_Verified_Submitted_licensed_Six_Emitted(msg.sender, _confirmed_license_six);

       return("Thanks for submitting your primerica license Six the admin will confirm it and  grant you access to  tier four");   
    }
   
   event Confirm_Verified_Submitted_licensed_Six_Emitted(address indexed _license_six_achiever, bool indexed _confirmed); 

   function Confirm_Verified_Submitted_licensed_Six() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_verified_Primerica_license_Six.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _routing_register_agents[msg.sender]._verified_Primerica_licenses.length);
        }

        Mister_G_Tier_Four storage _mister_G_tier_four = _routing_tier_four[msg.sender];
        _mister_G_tier_four._Broker_Series_Six_Licensed_Task = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Six_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }

/* -------------------------------------------------------------------------------------- */
 
/* ---------------------------------- Tier Five System ----------------------------------- */
struct Submit_Verified_of_Q3 {
string[] _twenty_appointments_record; 
string[]  _ten_policies_written_record; 
string[]  _five_recruits_in_30_days_record; 
string[]  _two_licensed_within_30_days_record;
string[]  _investments_reached_record; 
string[]  _proof_of_team_repeatation_record;
}
  mapping(address => Submit_Verified_of_Q3) private _routing_submit_verified_of_Q3; 

  event Submit_Verified_of_Q3_Top_Earner_Emiited(string indexed _twenty_appointments_record_event, string indexed _ten_policies_written_record, string indexed _five_recruits_in_30_days_record); 

  function Submit_Verified_of_Q3_Top_Earner(string memory client_twenty_appointments_record, string memory client_ten_policies_written_record, string memory client_five_recruits_in_30_days_record, string memory client_two_licensed_within_30_days_record, string memory client_investments_reached_record, string memory client_proof_of_team_repeatation_record) external returns(string memory) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
         if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
       Submit_Verified_of_Q3 storage _submit_verified_of_q3_var = _routing_submit_verified_of_Q3[msg.sender]; 
    _submit_verified_of_q3_var._twenty_appointments_record.push(client_twenty_appointments_record);
    _submit_verified_of_q3_var._ten_policies_written_record.push(client_ten_policies_written_record);
    _submit_verified_of_q3_var._five_recruits_in_30_days_record.push(client_five_recruits_in_30_days_record);
    _submit_verified_of_q3_var._two_licensed_within_30_days_record.push(client_two_licensed_within_30_days_record);
    _submit_verified_of_q3_var._investments_reached_record.push(client_investments_reached_record);
     _submit_verified_of_q3_var._proof_of_team_repeatation_record.push(client_proof_of_team_repeatation_record);

     emit Submit_Verified_of_Q3_Top_Earner_Emiited(client_twenty_appointments_record, client_ten_policies_written_record, client_five_recruits_in_30_days_record);

     return("Thanks for your hardwork your reward is waiting your one of the reasons primerica is strong today.");  
  }
  
  event Claim__Tier_5_Q3_Top_Earner_Emitted(string indexed twenty_appointments_record, string indexed twentyappointments_record, string indexed ten_policies_written_record);

  function Claim__Tier_5_Q3_Top_Earner(uint256 _index) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
         if(_index != 0 ) { 
            revert Mister_G__Zero_Value_Needed(_index);
        }
        if(_routing_submit_verified_of_Q3[msg.sender]._twenty_appointments_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm(_routing_submit_verified_of_Q3[msg.sender]._twenty_appointments_record.length);
        }
        if(_routing_submit_verified_of_Q3[msg.sender]._ten_policies_written_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm(_routing_submit_verified_of_Q3[msg.sender]._ten_policies_written_record.length);
        }
        if(_routing_submit_verified_of_Q3[msg.sender]._five_recruits_in_30_days_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm(_routing_submit_verified_of_Q3[msg.sender]._five_recruits_in_30_days_record.length);
        }
        if(_routing_submit_verified_of_Q3[msg.sender]._two_licensed_within_30_days_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm( _routing_submit_verified_of_Q3[msg.sender]._two_licensed_within_30_days_record.length);
        }
        if(_routing_submit_verified_of_Q3[msg.sender]._investments_reached_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm(_routing_submit_verified_of_Q3[msg.sender]._investments_reached_record.length);
        }
        if(_routing_submit_verified_of_Q3[msg.sender]._proof_of_team_repeatation_record.length == 0) {
           revert Mister_G__Nothing_To_Confirm(_routing_submit_verified_of_Q3[msg.sender]._proof_of_team_repeatation_record.length);
        }

     Mister_G_Tier_Five storage _mister_g_tier_five = _routing_tier_five[msg.sender];
     _mister_g_tier_five._achiever_address = msg.sender;
     _mister_g_tier_five._Mentor_Top_Earner_Task = true; 

      emit Claim__Tier_5_Q3_Top_Earner_Emitted(_routing_submit_verified_of_Q3[msg.sender]._twenty_appointments_record[_index],_routing_submit_verified_of_Q3[msg.sender]._ten_policies_written_record[_index], _routing_submit_verified_of_Q3[msg.sender]._five_recruits_in_30_days_record[_index]);

      return("Thanks for claiming this milestone you deserve more than this, your impact has change the future.");
  }       
/* --------------------------------------------------------------------------------------- */
/* -------------------------------- Tier Six System ------------------------------------- */
  event Claim_Recruit_Tier_Six_Emitted(bool indexed _recruiter_Ten, string indexed _recruiting_msg);

   function Claim_Recruit_Tier_Six() external returns(string memory) {
       //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
          if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
        if(_recruit_function_record._Store_recruit_Count.length < 10) {
            revert Mister_G_Rcruit_Count_NOT_Reached(_recruit_function_record._Store_recruit_Count.length, "Pls keep recruiting your almost there!");
        }

        Mister_G_Tier_Six storage _mister_g_six = _routing_tier_six[msg.sender]; 
        _mister_g_six._achiever_address = msg.sender; 
        _mister_g_six._Recruiter_Plus_Ten_Members_Task = true;

        emit  Claim_Recruit_Tier_Six_Emitted(true, "Congrats you have successfully earned Tier 6");

        return("Congrats you have successfully earned Tier 6"); 
   }
/* ------------------------------------------------------------------------------------- */

/* -------------------------------- Tier Seven System --------------------------------- */
  string[] private _verified_Primerica_license_Six_Three;

  event Push_Verified_Submitted_licensed_Six_Three_Emitted(address indexed _license_six_achiever, string indexed _confirmed_license_six_three);

    function Push_Verified_Submitted_licensed_Six_Three(string memory _confirmed_license_six_three) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }

        Mister_G_Tier_Seven storage _mister_g_tier_seven  = _routing_tier_seven[msg.sender]; 
        _mister_g_tier_seven._achiever_address  = msg.sender; 
       
       _verified_Primerica_license_Six_Three.push(_confirmed_license_six_three);
       
       emit Push_Verified_Submitted_licensed_Six_Three_Emitted(msg.sender, _confirmed_license_six_three);

       return("Thanks for submitting your primerica license Six_Three the admin will confirm it and  grant you access to  tier seven");   
    }
   
   event Confirm_Verified_Submitted_licensed_Six_Three_Emitted(address indexed _license_six_three_achiever, bool indexed _confirmed); 

   function Confirm_Verified_Submitted_licensed_Six_Three() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_verified_Primerica_license_Six_Three.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_license_Six_Three.length);
        }

        Mister_G_Tier_Seven storage _mister_G_tier_seven = _routing_tier_seven[msg.sender];
        _mister_G_tier_seven._Series_Six_3_Licensed_Senior_VP_Task = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Six_Three_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }

/* ------------------------------------------------------------------------------------ */
/* --------------------------------- Tier Eigth System -------------------------------- */
    string[] private _verified_Primerica_license_Seven;

  event Push_Verified_Submitted_licensed_Seven_Emitted(address indexed _license_seven_achiever, string indexed _confirmed_license_seven);

    function Push_Verified_Submitted_licensed_Seven(string memory _confirmed_license_seven) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }

        Mister_G_Tier_Eight storage _mister_g_tier_eight  = _routing_tier_eight[msg.sender]; 
        _mister_g_tier_eight._achiever_address  = msg.sender; 
       
       _verified_Primerica_license_Seven.push(_confirmed_license_seven);
       
       emit Push_Verified_Submitted_licensed_Seven_Emitted(msg.sender, _confirmed_license_seven);

       return("Thanks for submitting your primerica license Seven the admin will confirm it and  grant you access to  tier seven");   
    }
   
   event Confirm_Verified_Submitted_licensed_Seven_Emitted(address indexed _license_seven_achiever, bool indexed _confirmed); 

   function Confirm_Verified_Submitted_licensed_Seven() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_verified_Primerica_license_Seven.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_license_Seven.length);
        }

        Mister_G_Tier_Eight storage _mister_G_tier_eight = _routing_tier_eight[msg.sender];
        _mister_G_tier_eight._Series_Seven_Licensed_Senior_VP_Task = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Seven_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }
/* ------------------------------------------------------------------------------------ */
/* -------------------------------- Tier Nine System ----------------------------------- */
    string[] private _verified_Primerica_license_Six_Five;
    string[] private _verified_Primerica_license_Six_Six;

  event Push_Verified_Submitted_licensed_Six_Five_Six_Six_Emitted(address indexed _license_seven_achiever, string indexed _confirmed_license_six_five, string indexed _confirmed_license_six_six);

    function Push_Verified_Submitted_licensed_Six_Five_Six_Six(string memory _confirmed_license_six_five, string memory _confirmed_license_six_six) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }

        Mister_G_Tier_Nine storage _mister_g_tier_nine  = _routing_tier_nine[msg.sender]; 
        _mister_g_tier_nine._achiever_address  = msg.sender; 
       
       _verified_Primerica_license_Six_Five.push(_confirmed_license_six_five);
       _verified_Primerica_license_Six_Six.push(_confirmed_license_six_six);
       
       emit Push_Verified_Submitted_licensed_Six_Five_Six_Six_Emitted(msg.sender, _confirmed_license_six_five, _confirmed_license_six_six);

       return("Thanks for submitting your primerica license Six_Five and Six_Six the admin will confirm it and  grant you access to tier night");   
    }
   
   event Confirm_Verified_Submitted_licensed_Six_Five_Six_Six_Emitted(address indexed _license_seven_achiever, bool indexed _confirmed); 

   function Confirm_Verified_Submitted_licensed_Six_Five_Six_Six() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_verified_Primerica_license_Six_Five.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_license_Six_Five.length);
        }
        if(_verified_Primerica_license_Six_Six.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_license_Six_Six.length);
        }

        Mister_G_Tier_Nine storage _mister_G_tier_nine = _routing_tier_nine[msg.sender];
        _mister_G_tier_nine._Series_Six_5_And_Six_6_Licensed_Senior_VP_Task = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Six_Five_Six_Six_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }
/* ------------------------------------------------------------------------------------- */
/* ---------------------------------- Tier 10 System ---------------------------------- */
string[] private _verified_Primerica_license_Twenty_Six;

  event Push_Verified_Submitted_licensed_Twenty_Six_Emitted(address indexed _license_seven_achiever, string indexed _confirmed_license_seven);

    function Push_Verified_Submitted_licensed_Twenty_Six(string memory _confirmed_license_twenty_six) external returns(string memory) {
      //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }

        Mister_G_Tier_Ten storage _mister_g_tier_ten  = _routing_tier_ten[msg.sender]; 
        _mister_g_tier_ten._achiever_address  = msg.sender; 
       
       _verified_Primerica_license_Twenty_Six.push(_confirmed_license_twenty_six);
       
       emit Push_Verified_Submitted_licensed_Twenty_Six_Emitted(msg.sender, _confirmed_license_twenty_six);

       return("Thanks for submitting your primerica license Twenty_Six the admin will confirm it and  grant you access to  tier Ten");   
    }
   
   event Confirm_Verified_Submitted_licensed_Twenty_Six_Emitted(address indexed _license_twenty_six_achiever, bool indexed _confirmed); 

   function Confirm_Verified_Submitted_licensed_Twenty_Six() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_verified_Primerica_license_Twenty_Six.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_license_Twenty_Six.length);
        }

        Mister_G_Tier_Ten storage _mister_G_tier_ten = _routing_tier_ten[msg.sender];
        _mister_G_tier_ten._Series_Twenty_Six_Licensed_Senior_VP_Task = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Twenty_Six_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }
/* ------------------------------------------------------------------------------------ */

/* ------------------------------- Registeration Flow --------------------------------- */
    error Mister_G__You_Have_To_Get_Your_Pre_License(address _caller, bool _No_pre_License);

    // This Function Registers the Agent with the protcol
    function _Agent_Registration(string memory _client_name, string memory _client_email) external returns(string memory _register_agent_msg) {
        //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        // Condition checking the caller is not already registered
        if(_routing_agent[msg.sender]._agent_id == _your_agent_id) {
            revert Mister_G__Already_Registered(msg.sender, _routing_agent[msg.sender]._agent_id);  
        }
        // Condition that contract owner or Admin can not call to register as an agent 
        if(contract_owner == msg.sender) {
            revert Mister_G__Contract_Admin_Restricted(msg.sender);
        }
        // Condition to check if agent is on ban or restricted not to register
        if(_routing_agent[msg.sender]._agent_banned == true) {
            revert Mister_G__Agent_ON_BAN(msg.sender, _routing_agent[msg.sender]._agent_banned); 
        }
       


      Register_Agents storage _register_agents_var = _routing_register_agents[msg.sender];
        // Keeping Track of the Agents Data in an Array 
      _register_agents_var._Registered_Agents_Name.push(_client_name);
      _register_agents_var._Registered_Agents_Emails.push(_client_email);
      _register_agents_var._Registered_Agents_Addresses.push(msg.sender);
            
       // Generate Identification key for Agent
         _agent_identication_Count++; 

         uint256 _agent_identification_key = _agent_identication_Count; 

         // Assign the Identification Key to the contract state for agents to view id key
         _your_agent_id = _agent_identification_key; 
        
        // Store the arguments and value to the contract storage
        Agent storage _agent = _routing_agent[msg.sender];
        _agent._agent_address = msg.sender; 
        _agent._agent_email = _client_email; 
        _agent._agent_name = _client_name; 
        _agent._agent_id = _agent_identification_key; 
        _agent._registered = true;
       
        
        // Keeping Track of the registeration volumn
        _routing_register_agents[msg.sender]._agent_registeration_count + 1;

        // Emit the Agent Data 
        emit  _Agent_Registeration_Emitted(msg.sender, _client_name, _client_email);

        // Funtion Callback message when the function or transaction is mined
       _register_agent_msg = "Thanks for registering with PRIMERICA, you have open your gates of freedom and futurn grantee"; 

       return(_register_agent_msg);

    }

     // This Function let's the Admin search registered address and query them from their Array 
    function Query_Registered_Agents_Address(uint256 _index) public view Mister_G_Only(msg.sender) returns(address) {
       if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
       return _routing_register_agents[msg.sender]._Registered_Agents_Addresses[_index]; 
    }
  
     // This Function let's the Admin search registered Names and query them from their Array 
    function Query_Registered_Agents_Name(uint256 _index) public view Mister_G_Only(msg.sender) returns(string memory) {
       if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }

       return _routing_register_agents[msg.sender]._Registered_Agents_Name[_index]; 
    }

   // This Function let's the Admin search registered Emails and query them from their Array 
    function Query_Registered_Agents_Emails(uint256 _index) public view Mister_G_Only(msg.sender) returns(string memory) {
       if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }

       return _routing_register_agents[msg.sender]._Registered_Agents_Emails[_index]; 
    }

    function Query_Whole_Registered_Addresses() public view Mister_G_Only(msg.sender) returns( address[] memory) {
         if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      
      return(_routing_register_agents[msg.sender]._Registered_Agents_Addresses);
    }

    function Query_Whole_Registered_Name() public view Mister_G_Only(msg.sender) returns( string[] memory) {
         if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      
      return(_routing_register_agents[msg.sender]._Registered_Agents_Name);
    }

      function Query_Whole_Registered_Emails() public view Mister_G_Only(msg.sender) returns( string[] memory) {
         if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      
      return(_routing_register_agents[msg.sender]._Registered_Agents_Emails);
    }

    /* ---------------------------------------------------------------------------------- */
    /* ------------------------ NFT Reward System For Tiers MileStone ------------------- */
      function _update(address to, uint256 tokenId, address auth) internal virtual override returns (address) {
        address from = _ownerOf(tokenId);
        if(from != address(0) && to != address(0)) {
            revert("You can not Transfer NFT card, only mint and burn");
        }
        
        return super._update(to, tokenId, auth);
    }
     

     function burnToken(uint256 _tokenId) external returns(string memory){
         if (address(0) == msg.sender) {
            revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }        
        burn(_tokenId);
        return("You have burned the NFT minted");
     } 
   
    /* ---------------------------- Tier One NFT Reward System --------------------------- */
     uint256 private _rookie_Agent_Nft_Image_Count;
     uint256 private _rookie_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached_Rookie_Agent_MileStone_Yet(address _rookie_agent_caller, bool _failed);
    
    event Rookie_Agent_NFT_Mint_Reward_Emitted(address indexed _rockie_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function Rookie_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_one[msg.sender]._licensed_Passed == false) {
           revert Mister_G__You_Have_Not_Reached_Rookie_Agent_MileStone_Yet(msg.sender, _routing_tier_one[msg.sender]._licensed_Passed );  
         }

      Mister_G_Tier_One memory _read_tier_one_data = _routing_tier_one[msg.sender];

      address _tier_One_Address = _read_tier_one_data._achiever_address;

      _rookie_Agent_Nft_Image_Count++;
      uint256 new__rookie_Agent_Nft_Image_Count = _rookie_Agent_Nft_Image_Count; 
      _rookie_Agent_NFT_Image_ID = new__rookie_Agent_Nft_Image_Count;

      _safeMint(_tier_One_Address, new__rookie_Agent_Nft_Image_Count);
      _setTokenURI(new__rookie_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_one);  
      
      emit Rookie_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__rookie_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_one);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */

     /* ---------------------------- Tier Two NFT Reward System --------------------------- */
     uint256 private _Debt_Free_Advocate_Agent_Nft_Image_Count;
     uint256 private _Debt_Free_Advocate_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached_DFA_Agent_MileStone_Yet(address _dfa_agent_caller, bool _failed);
    
    event Debt_Free_Advocate_Agent_NFT_Mint_Reward_Emitted(address indexed _dfa_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function Debt_Free_Advocate_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_two[msg.sender]._Debt_Free_Advocate_Task == false) {
           revert Mister_G__You_Have_Not_Reached_DFA_Agent_MileStone_Yet(msg.sender, _routing_tier_two[msg.sender]._Debt_Free_Advocate_Task);  
         }

      Mister_G_Tier_Two memory _read_tier_two_data = _routing_tier_two[msg.sender];

      address _tier_Two_Address = _read_tier_two_data._achiever_address;

         _Debt_Free_Advocate_Agent_Nft_Image_Count++;

      uint256 new__Debt_Free_Advocate_Agent_Nft_Image_Count = _Debt_Free_Advocate_Agent_Nft_Image_Count; 

      _Debt_Free_Advocate_Agent_NFT_Image_ID = new__Debt_Free_Advocate_Agent_Nft_Image_Count;

      _safeMint(_tier_Two_Address, new__Debt_Free_Advocate_Agent_Nft_Image_Count);
      _setTokenURI(new__Debt_Free_Advocate_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_two);  
      
      emit Debt_Free_Advocate_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Debt_Free_Advocate_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_two);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");
     }
     /* ---------------------------------------------------------------------------------- */

   
        /* ---------------------------- Tier Three NFT Reward System --------------------------- */
     uint256 private _first_person_sponsored_Agent_Nft_Image_Count;
     uint256 private _first_person_sponsored_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached_First_Person_Sponsored_MileStone_Yet(address _first_person_sponsored_agent_caller, bool _failed);
    
    event _First_Person_Sponsored_Agent_NFT_Mint_Reward_Emitted(address indexed __first_person_sponsored_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function _First_Person_Sponsored_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_three[msg.sender]._Recruiter_Plus_Five_Members_Task == false) {
           revert Mister_G__You_Have_Not_Reached_First_Person_Sponsored_MileStone_Yet(msg.sender, _routing_tier_three[msg.sender]._Recruiter_Plus_Five_Members_Task);  
         }

      Mister_G_Tier_Three memory _read_tier_three_data = _routing_tier_three[msg.sender];

      address _tier_Three_Address = _read_tier_three_data._achiever_address;
       
       _first_person_sponsored_Agent_Nft_Image_Count++;
      uint256 new__first_person_sponsored_Agent_Nft_Image_Count = _first_person_sponsored_Agent_Nft_Image_Count; 
      _first_person_sponsored_Agent_NFT_Image_ID = new__first_person_sponsored_Agent_Nft_Image_Count;

      _safeMint(_tier_Three_Address, new__first_person_sponsored_Agent_Nft_Image_Count);
      _setTokenURI(new__first_person_sponsored_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_three);  
      
      emit _First_Person_Sponsored_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__first_person_sponsored_Agent_Nft_Image_Count,  _PRI_NFTs._nft_diagram_three);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */

 
           /* ---------------------------- Tier Four NFT Reward System --------------------------- */
     uint256 private _Series_Six_Agent_Nft_Image_Count;
     uint256 private _Series_Six_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Series_Six_MileStone_Yet(address _series_six_agent_caller, bool _failed);
    
    event _Series_Six_Agent_NFT_Mint_Reward_Emitted(address indexed _series_six_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function _Series_Six_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_four[msg.sender]._Broker_Series_Six_Licensed_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Series_Six_MileStone_Yet(msg.sender, _routing_tier_four[msg.sender]._Broker_Series_Six_Licensed_Task);  
         }

      Mister_G_Tier_Four memory _read_tier_four_data = _routing_tier_four[msg.sender];

      address _tier_Four_Address = _read_tier_four_data._achiever_address;
       
       _Series_Six_Agent_Nft_Image_Count++;

      uint256 new__Series_Six_Agent_Nft_Image_Count = _Series_Six_Agent_Nft_Image_Count; 
      _Series_Six_Agent_NFT_Image_ID = new__Series_Six_Agent_Nft_Image_Count;

      _safeMint(_tier_Four_Address, new__Series_Six_Agent_Nft_Image_Count);
      _setTokenURI(new__Series_Six_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_four);  
      
      emit _Series_Six_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Six_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_four);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */
  
       /* ---------------------------- Tier Five NFT Reward System --------------------------- */
     uint256 private _Top_Earner_Q_Three_Agent_Nft_Image_Count;
     uint256 private _Top_Earner_Q_Three_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Top_Earner_Q_Three_MileStone_Yet(address _top_earner_q_three_agent_caller, bool _failed);
    
    event _Top_Earner_Q_Three_Agent_NFT_Mint_Reward_Emitted(address indexed _top_earner_q_three_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function _Top_Earner_Q_Three_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_five[msg.sender]._Mentor_Top_Earner_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Top_Earner_Q_Three_MileStone_Yet(msg.sender, _routing_tier_five[msg.sender]._Mentor_Top_Earner_Task);  
         }

      Mister_G_Tier_Five memory _read_tier_five_data = _routing_tier_five[msg.sender];

      address _tier_Five_Address = _read_tier_five_data._achiever_address;
       
       _Top_Earner_Q_Three_Agent_Nft_Image_Count++;

      uint256 new__Top_Earner_Q_Three_Agent_Nft_Image_Count = _Top_Earner_Q_Three_Agent_Nft_Image_Count; 

      _Top_Earner_Q_Three_Agent_NFT_Image_ID = new__Top_Earner_Q_Three_Agent_Nft_Image_Count;

      _safeMint(_tier_Five_Address, new__Top_Earner_Q_Three_Agent_Nft_Image_Count);
      _setTokenURI(new__Top_Earner_Q_Three_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_five);  
      
      emit _Top_Earner_Q_Three_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Top_Earner_Q_Three_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_five);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */
    
          /* ---------------------------- Tier Six NFT Reward System --------------------------- */
     uint256 private _Team_Builder_Agent_Nft_Image_Count;
     uint256 private _Team_Builder_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Team_Builder_MileStone_Yet(address _team_builder_agent_caller, bool _failed);
    
    event _Team_Builder_Agent_NFT_Mint_Reward_Emitted(address indexed _team_builder_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function _Team_Builder_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_six[msg.sender]._Recruiter_Plus_Ten_Members_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Team_Builder_MileStone_Yet(msg.sender, _routing_tier_six[msg.sender]._Recruiter_Plus_Ten_Members_Task );  
         }

      Mister_G_Tier_Six memory _read_tier_six_data = _routing_tier_six[msg.sender];

      address _tier_Six_Address = _read_tier_six_data._achiever_address;
       
       _Team_Builder_Agent_Nft_Image_Count++;

      uint256 new__Team_Builder_Agent_Nft_Image_Count = _Team_Builder_Agent_Nft_Image_Count; 

      _Team_Builder_Agent_NFT_Image_ID = new__Team_Builder_Agent_Nft_Image_Count;

      _safeMint(_tier_Six_Address, new__Team_Builder_Agent_Nft_Image_Count);
      _setTokenURI(new__Team_Builder_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_six);  
      
      emit _Team_Builder_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Team_Builder_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_six);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */

               /* ---------------------------- Tier Seven NFT Reward System --------------------------- */
     uint256 private _Series_Six_Three_Agent_Nft_Image_Count;
     uint256 private _Series_Six_Three_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Series_Six_Three_MileStone_Yet(address _series_six_three_agent_caller, bool _failed);
    
    event _Series_Six_Three_Agent_NFT_Mint_Reward_Emitted(address indexed _series_six_three_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function _Series_Six_Three_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_seven[msg.sender]._Series_Six_3_Licensed_Senior_VP_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Series_Six_Three_MileStone_Yet(msg.sender, _routing_tier_seven[msg.sender]._Series_Six_3_Licensed_Senior_VP_Task);  
         }

      Mister_G_Tier_Seven memory _read_tier_seven_data = _routing_tier_seven[msg.sender];

      address _tier_Seven_Address = _read_tier_seven_data._achiever_address;
       
       _Series_Six_Three_Agent_Nft_Image_Count++;

      uint256 new__Series_Six_Three_Agent_Nft_Image_Count = _Series_Six_Three_Agent_Nft_Image_Count; 

      _Series_Six_Three_Agent_NFT_Image_ID = new__Series_Six_Three_Agent_Nft_Image_Count;

      _safeMint(_tier_Seven_Address, new__Series_Six_Three_Agent_Nft_Image_Count);
      _setTokenURI(new__Series_Six_Three_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_seven);  
      
      emit _Series_Six_Three_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Six_Three_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_seven);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */

                 /* ---------------------------- Tier Eight NFT Reward System --------------------------- */
     uint256 private _Series_Seven_Agent_Nft_Image_Count;
     uint256 private _Series_Seven_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Series_Seven_MileStone_Yet(address _series_seven_agent_caller, bool _failed);
    
    event _Series_Seven_Agent_NFT_Mint_Reward_Emitted(address indexed _series_seven_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function _Series_Seven_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_eight[msg.sender]._Series_Seven_Licensed_Senior_VP_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Series_Seven_MileStone_Yet(msg.sender, _routing_tier_eight[msg.sender]._Series_Seven_Licensed_Senior_VP_Task);  
         }

      Mister_G_Tier_Eight memory _read_tier_eight_data = _routing_tier_eight[msg.sender];

      address _tier_Eight_Address = _read_tier_eight_data._achiever_address;
       
       _Series_Seven_Agent_Nft_Image_Count++;

      uint256 new__Series_Seven_Agent_Nft_Image_Count = _Series_Seven_Agent_Nft_Image_Count; 

      _Series_Seven_Agent_NFT_Image_ID = new__Series_Seven_Agent_Nft_Image_Count;

      _safeMint(_tier_Eight_Address, new__Series_Seven_Agent_Nft_Image_Count);
      _setTokenURI(new__Series_Seven_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_eight);  
      
      emit _Series_Seven_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Seven_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_eight);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */

                   /* ---------------------------- Tier Nine NFT Reward System --------------------------- */
     uint256 private _Series_Six_Five_Six_Six_Agent_Nft_Image_Count;
     uint256 private  _Series_Six_Five_Six_Six_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Series_Six_Five_Six_Six_MileStone_Yet(address  _series_six_five_six_six_agent_caller, bool _failed);
    
    event  _Series_Six_Five_Six_Six_Agent_NFT_Mint_Reward_Emitted(address indexed  _series_six_five_six_six_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function  _Series_Six_Five_Six_Six_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_nine[msg.sender]._Series_Six_5_And_Six_6_Licensed_Senior_VP_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Series_Six_Five_Six_Six_MileStone_Yet(msg.sender, _routing_tier_nine[msg.sender]._Series_Six_5_And_Six_6_Licensed_Senior_VP_Task);  
         }

      Mister_G_Tier_Nine memory _read_tier_nine_data = _routing_tier_nine[msg.sender];

      address _tier_Nine_Address = _read_tier_nine_data._achiever_address;
       
       _Series_Six_Five_Six_Six_Agent_Nft_Image_Count++;

      uint256 new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count = _Series_Six_Five_Six_Six_Agent_Nft_Image_Count; 

      _Series_Six_Five_Six_Six_Agent_NFT_Image_ID = new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count;

      _safeMint(_tier_Nine_Address, new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count);
      _setTokenURI(new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_nine);  
      
      emit _Series_Six_Five_Six_Six_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count,  _PRI_NFTs._nft_diagram_nine);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */
     
                   /* ---------------------------- Tier Nine NFT Reward System --------------------------- */
     uint256 private _Series_Twenty_Six_Agent_Nft_Image_Count;
     uint256 private  _Series_Twenty_Six_Agent_NFT_Image_ID;
     
     error Mister_G__You_Have_Not_Reached__Series__Series_Twenty_Six_MileStone_Yet(address  _series_twenty_six_agent_caller, bool _failed);
    
    event _Series_Twenty_Six_Agent_NFT_Mint_Reward_Emitted(address indexed  _series_twenty_six_minter_address, uint256 indexed _minted_nft_id, string indexed _minted_nft_image);

     function  _Series_Twenty_Six_Agent_NFT_Mint_Reward() external  returns(string memory) {
         //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
         }
         if(_routing_tier_ten[msg.sender]._Series_Twenty_Six_Licensed_Senior_VP_Task == false) {
           revert Mister_G__You_Have_Not_Reached__Series__Series_Twenty_Six_MileStone_Yet(msg.sender, _routing_tier_ten[msg.sender]._Series_Twenty_Six_Licensed_Senior_VP_Task);  
         }

      Mister_G_Tier_Ten memory _read_tier_ten_data = _routing_tier_ten[msg.sender];

      address _tier_Ten_Address = _read_tier_ten_data._achiever_address;
       
       _Series_Twenty_Six_Agent_Nft_Image_Count++;

      uint256 new__Series_Twenty_Six_Agent_Nft_Image_Count = _Series_Twenty_Six_Agent_Nft_Image_Count; 

      _Series_Twenty_Six_Agent_NFT_Image_ID = new__Series_Twenty_Six_Agent_Nft_Image_Count;

      _safeMint(_tier_Ten_Address, new__Series_Twenty_Six_Agent_Nft_Image_Count);
      _setTokenURI(new__Series_Twenty_Six_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_ten);  
      
      emit _Series_Twenty_Six_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Twenty_Six_Agent_Nft_Image_Count, _PRI_NFTs._nft_diagram_ten);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */
    /* ---------------------------------------------------------------------------------- */

  /* ------------ Getter Functions ------------ */
 
  function View_Primerica_Company_Contract_Address() view external returns(address) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
    return(contract_owner);
  }

  function   View_agent_identication_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_agent_identication_Count);
  }
  
  function View__your_agent_id() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_your_agent_id);
  }

  function View_NFT_Rookie_Agent() view external returns(string memory) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_one);
  }

  function View_NFT_Debt_Free_Advocate() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_two);
  }

  function View_NFT_First_Person_sponsored() view external returns(string memory) { 
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_three);
  } 

  function View_NFT_Series_Six_License() view external returns(string memory) { 
      if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_four);
  } 

  function View_NFT_Top_Earner_Q_Three() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_five);
  }

    function View_NFT_Team_Builder() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_six);
  }

  function View_NFT_Series_Six_Three_License() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_seven);
  }

    function View_NFT_Series_Seven() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_eight);
  }

  function View_NFT_Series_Six_Five_Six_Six() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_nine);
  }

  function View_NFT_Series_Twenty_Six() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._nft_diagram_ten);
  }

 function View_Recruit_NFT() view external returns(string memory) { 
     if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_PRI_NFTs._recruit_nft);
  }

  


   function View_INTERVAL() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_INTERVAL);
  }
 
    function View_totalRatings() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(totalRatings);
  }

  function View_Debt_Free_Advocate_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Debt_Free_Advocate_Agent_Nft_Image_Count);
  }

   function View_Debt_Free_Advocate_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Debt_Free_Advocate_Agent_NFT_Image_ID);
  }

    function View_first_person_sponsored_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_first_person_sponsored_Agent_Nft_Image_Count);
  }

    function View_first_person_sponsored_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_first_person_sponsored_Agent_NFT_Image_ID);
  }

  function View_Series_Six_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Six_Agent_Nft_Image_Count);
  }

  function View_Series_Six_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Six_Agent_NFT_Image_ID);
  }

    function View_Top_Earner_Q_Three_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Top_Earner_Q_Three_Agent_Nft_Image_Count);
  }

     function View_Top_Earner_Q_Three_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Top_Earner_Q_Three_Agent_NFT_Image_ID);
  }

  
     function View_Team_Builder_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Team_Builder_Agent_Nft_Image_Count);
  }

   function View_Team_Builder_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Team_Builder_Agent_NFT_Image_ID);
  }

   function View_Series_Six_Three_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Six_Three_Agent_Nft_Image_Count);
  }

   function View_Series_Six_Three_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Six_Three_Agent_NFT_Image_ID);
  }

   function View_Series_Seven_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Seven_Agent_Nft_Image_Count);
  }

 function View_Series_Seven_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Seven_Agent_NFT_Image_ID);
  }

   function View_Series_Six_Five_Six_Six_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Six_Five_Six_Six_Agent_Nft_Image_Count);
  }

    function View_Series_Six_Five_Six_Six_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Six_Five_Six_Six_Agent_NFT_Image_ID);
  }

  function View_Series_Twenty_Six_Agent_Nft_Image_Count() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Twenty_Six_Agent_Nft_Image_Count);
  }

 function View_Series_Twenty_Six_Agent_NFT_Image_ID() view external returns(uint256) { 
    if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        return(_Series_Twenty_Six_Agent_NFT_Image_ID);
  }

}

