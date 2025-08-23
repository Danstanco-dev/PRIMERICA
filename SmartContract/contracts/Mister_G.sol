// SPDX-License-Identifier: UNLICENSED
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
  
  string private _NFT_Rookie_Agent;
  string private _NFT_Debt_Free_Advocate;
  string private _NFT_First_Person_sponsored;
  string private _NFT_Series_Six_License;
  string private _NFT_Top_Earner_Q_Three; 
  string private _NFT_Team_Builder;
  string private _NFT_Series_Six_Three_License; 
  string private _NFT_Series_Seven;
  string private _NFT_Series_Six_Five_Six_Six; 
  string private _NFT_Series_Twenty_Six; 

    constructor(
      string memory _nft_diagram_one, 
      string memory _nft_diagram_two, 
      string memory _nft_diagram_three, 
      string memory _nft_diagram_four, 
      string memory _nft_diagram_five, 
      string memory _nft_diagram_six, 
      string memory _nft_diagram_seven, 
      string memory _nft_diagram_eight, 
      string memory _nft_diagram_nine,
      string memory _nft_diagram_ten
    ) ERC721("Mister_G_Award_Coin", "M_G_A_C"){
      contract_owner = msg.sender; 
      _NFT_Rookie_Agent = _nft_diagram_one;
      _NFT_Debt_Free_Advocate = _nft_diagram_two; 
      _NFT_First_Person_sponsored = _nft_diagram_three; 
      _NFT_Series_Six_License = _nft_diagram_four; 
      _NFT_Top_Earner_Q_Three = _nft_diagram_five; 
      _NFT_Team_Builder = _nft_diagram_six; 
      _NFT_Series_Six_Three_License = _nft_diagram_seven; 
      _NFT_Series_Seven = _nft_diagram_eight; 
      _NFT_Series_Six_Five_Six_Six = _nft_diagram_nine;
      _NFT_Series_Twenty_Six =  _nft_diagram_ten; 
    }
   
   // Registered Agents Array for their name, address, email 
   string[] private _Registered_Agents_Name; 
   address[] private _Registered_Agents_Addresses; 
   string[] private _Registered_Agents_Emails;  
   uint256 private _agent_registeration_count; 
   string[] private _verified_Primerica_licenses; 


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
       
       _verified_Primerica_licenses.push(_confirmed_license);
       
       emit Push_Verified_Submitted_licensed_Emitted(msg.sender, _confirmed_license);

       return("Thanks for submitting your primerica license the admin will confirm it and  grant you access to request tier one");   
    }

   function Confirm_Verified_Submitted_licensed_() public Mister_G_Only(msg.sender)  returns(bool _confirmed) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
        if(_verified_Primerica_licenses.length == 0) { 
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_licenses.length);
        }

        Mister_G_Tier_One storage _mister_G_tier_one = _routing_tier_one[msg.sender];
        _mister_G_tier_one._licensed_Passed = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }

/* --------------------------------------------------------------------------------------- */

/* ------------------------------- Tier Two System -------------------------------------- */
 string[] private _Type_of_debt; 
 uint256[] private _Balance_owned; 
 uint256[] private _Interest_rate; 
 uint256[] private _Minimum_Monthly_Payment; 
 
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

       _Type_of_debt.push(_type_of_debt);
       _Balance_owned.push(_balance_owned);
       _Interest_rate.push(_interest_rate);
       _Minimum_Monthly_Payment.push(_minimum_monthly_payment);

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
   
   uint256 _Balance_owned_Value = _Balance_owned[_index]; 
   uint256 _Interest_rate_Value = _Interest_rate[_index]; 
   uint256 _Minimum_Monthly_Payment_Value = _Minimum_Monthly_Payment[_index]; 

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
      if(_Type_of_debt.length < 10) {
          revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_Type_of_debt.length);
      }
      if(_Balance_owned.length < 10) {
          revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_Balance_owned.length);
      }
      if(_Interest_rate.length < 10) {
          revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_Interest_rate.length);
      }
      if(_Minimum_Monthly_Payment.length < 10) {
        revert Mister_G__DFA_Length_NOT_COMPLETED_YET(_Minimum_Monthly_Payment.length);
      }
   Mister_G_Tier_Two storage _mister_g_tier_two  = _routing_tier_two[msg.sender];
   _mister_g_tier_two._Debt_Free_Advocate_Task = true;
    
    emit Assign_Debt_Free_Advocate_Tier_Emitted(true, "DFA(Deft Free Advocate) milestone reached");
   return(true); 
 }
/* -------------------------------------------------------------------------------------- */
/* ------------------------------- Tier Three System ------------------------------------ */
string[] private store_recruited_Name;
string[] private store_recruited_Nation_ID;
string[] private store_recruited_Email;

uint256 private _recruit_Id_count;
uint256[] private _Store_recruit_Count; 

 event Recruiter_Function_Emitted(string indexed _recruited_Name, string indexed _recruit_Msg);

   function Recruiter_Function(string memory _recruited_Name, string memory _recruited_National_Identification, string memory _recruited_Email) external  returns(string memory _Recruit_Msg) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
         if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
       
       store_recruited_Name.push(_recruited_Name);
       store_recruited_Nation_ID.push(_recruited_National_Identification);
       store_recruited_Email.push(_recruited_Email);

         _recruit_Id_count++;

       _Store_recruit_Count.push(_recruit_Id_count);
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
        if(_Store_recruit_Count.length < 5) {
            revert Mister_G_Rcruit_Count_NOT_Reached(_Store_recruit_Count.length, "Pls keep recruiting your almost there!");
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
            revert Mister_G__Nothing_To_Confirm( _verified_Primerica_licenses.length);
        }

        Mister_G_Tier_Four storage _mister_G_tier_four = _routing_tier_four[msg.sender];
        _mister_G_tier_four._Broker_Series_Six_Licensed_Task = true;
         
        _confirmed = true;  
        emit Confirm_Verified_Submitted_licensed_Six_Emitted(msg.sender, _confirmed);

        return(_confirmed);
   }

/* -------------------------------------------------------------------------------------- */
 
/* ---------------------------------- Tier Five System ----------------------------------- */
string[] private _twenty_appointments_record; 
string[] private _ten_policies_written_record; 
string[] private _five_recruits_in_30_days_record; 
string[] private _two_licensed_within_30_days_record;
string[] private _investments_reached_record; 
string[] private _proof_of_team_repeatation_record;
  
  event Submit_Verified_of_Q3_Top_Earner_Emiited(string indexed _twenty_appointments_record, string indexed _ten_policies_written_record, string indexed _five_recruits_in_30_days_record); 

  function Submit_Verified_of_Q3_Top_Earner(string memory client_twenty_appointments_record, string memory client_ten_policies_written_record, string memory client_five_recruits_in_30_days_record, string memory client_two_licensed_within_30_days_record, string memory client_investments_reached_record, string memory client_proof_of_team_repeatation_record) external returns(string memory) {
     //Condition checking that the caller address is indeed a vaild address to call function
        if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
         if(_routing_agent[msg.sender]._registered == false) { 
            revert Mister_G__You_Need_To_Registered(msg.sender, _routing_agent[msg.sender]._registered); 
        }
       
    _twenty_appointments_record.push(client_twenty_appointments_record);
    _ten_policies_written_record.push(client_ten_policies_written_record);
    _five_recruits_in_30_days_record.push(client_five_recruits_in_30_days_record);
    _two_licensed_within_30_days_record.push(client_two_licensed_within_30_days_record);
    _investments_reached_record.push(client_investments_reached_record);
     _proof_of_team_repeatation_record.push(client_proof_of_team_repeatation_record);

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
        if(_twenty_appointments_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm( _twenty_appointments_record.length);
        }
        if(_ten_policies_written_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm( _ten_policies_written_record.length);
        }
        if(_five_recruits_in_30_days_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm( _five_recruits_in_30_days_record.length);
        }
        if(_two_licensed_within_30_days_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm( _two_licensed_within_30_days_record.length);
        }
        if(_investments_reached_record.length == 0) {
            revert Mister_G__Nothing_To_Confirm( _investments_reached_record.length);
        }
        if(_proof_of_team_repeatation_record.length == 0) {
           revert Mister_G__Nothing_To_Confirm( _proof_of_team_repeatation_record.length);
        }

     Mister_G_Tier_Five storage _mister_g_tier_five = _routing_tier_five[msg.sender];
     _mister_g_tier_five._achiever_address = msg.sender;
     _mister_g_tier_five._Mentor_Top_Earner_Task = true; 

      emit Claim__Tier_5_Q3_Top_Earner_Emitted(_twenty_appointments_record[_index], _ten_policies_written_record[_index], _five_recruits_in_30_days_record[_index]);

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
        if(_Store_recruit_Count.length < 10) {
            revert Mister_G_Rcruit_Count_NOT_Reached(_Store_recruit_Count.length, "Pls keep recruiting your almost there!");
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

         // Keeping Track of the Agents Data in an Array
        _Registered_Agents_Name.push(_client_name);
        _Registered_Agents_Emails.push(_client_email);
        _Registered_Agents_Addresses.push(msg.sender);
        
        // Keeping Track of the registeration volumn
        _agent_registeration_count + 1;

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
       return _Registered_Agents_Addresses[_index]; 
    }
  
     // This Function let's the Admin search registered Names and query them from their Array 
    function Query_Registered_Agents_Name(uint256 _index) public view Mister_G_Only(msg.sender) returns(string memory) {
       if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }

       return _Registered_Agents_Name[_index]; 
    }

   // This Function let's the Admin search registered Emails and query them from their Array 
    function Query_Registered_Agents_Emails(uint256 _index) public view Mister_G_Only(msg.sender) returns(string memory) {
       if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }

       return _Registered_Agents_Emails[_index]; 
    }

    function Query_Whole_Registered_Addresses() public view Mister_G_Only(msg.sender) returns( address[] memory) {
         if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      
      return(_Registered_Agents_Addresses);
    }

    function Query_Whole_Registered_Name() public view Mister_G_Only(msg.sender) returns( string[] memory) {
         if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      
      return(_Registered_Agents_Name);
    }

      function Query_Whole_Registered_Emails() public view Mister_G_Only(msg.sender) returns( string[] memory) {
         if(msg.sender == address(0)) { 
           revert Mister_G__Invalid_Wallet_Address(msg.sender);
        }
      
      return(_Registered_Agents_Emails);
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
      _setTokenURI(new__rookie_Agent_Nft_Image_Count, _NFT_Rookie_Agent);  
      
      emit Rookie_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__rookie_Agent_Nft_Image_Count, _NFT_Rookie_Agent);

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
      _setTokenURI(new__Debt_Free_Advocate_Agent_Nft_Image_Count, _NFT_Debt_Free_Advocate);  
      
      emit Debt_Free_Advocate_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Debt_Free_Advocate_Agent_Nft_Image_Count, _NFT_Debt_Free_Advocate);

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
      _setTokenURI(new__first_person_sponsored_Agent_Nft_Image_Count, _NFT_First_Person_sponsored);  
      
      emit _First_Person_Sponsored_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__first_person_sponsored_Agent_Nft_Image_Count, _NFT_First_Person_sponsored);

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
      _setTokenURI(new__Series_Six_Agent_Nft_Image_Count, _NFT_Series_Six_License);  
      
      emit _Series_Six_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Six_Agent_Nft_Image_Count, _NFT_Series_Six_License);

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
      _setTokenURI(new__Top_Earner_Q_Three_Agent_Nft_Image_Count, _NFT_Top_Earner_Q_Three);  
      
      emit _Top_Earner_Q_Three_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Top_Earner_Q_Three_Agent_Nft_Image_Count, _NFT_Top_Earner_Q_Three);

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
      _setTokenURI(new__Team_Builder_Agent_Nft_Image_Count, _NFT_Team_Builder);  
      
      emit _Team_Builder_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Team_Builder_Agent_Nft_Image_Count, _NFT_Team_Builder);

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
      _setTokenURI(new__Series_Six_Three_Agent_Nft_Image_Count, _NFT_Series_Six_Three_License);  
      
      emit _Series_Six_Three_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Six_Three_Agent_Nft_Image_Count, _NFT_Series_Six_Three_License);

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
      _setTokenURI(new__Series_Seven_Agent_Nft_Image_Count, _NFT_Series_Seven);  
      
      emit _Series_Seven_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Seven_Agent_Nft_Image_Count, _NFT_Series_Seven);

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
      _setTokenURI(new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count, _NFT_Series_Six_Five_Six_Six);  
      
      emit _Series_Six_Five_Six_Six_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Six_Five_Six_Six_Agent_Nft_Image_Count, _NFT_Series_Six_Five_Six_Six);

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
      _setTokenURI(new__Series_Twenty_Six_Agent_Nft_Image_Count, _NFT_Series_Twenty_Six);  
      
      emit _Series_Twenty_Six_Agent_NFT_Mint_Reward_Emitted(msg.sender, new__Series_Twenty_Six_Agent_Nft_Image_Count, _NFT_Series_Twenty_Six);

      return("You Have Successfully claimed your NFT milestone, this serves as a signature of your hardwork and a big upgrade to your reputation");

     }
     /* ---------------------------------------------------------------------------------- */
    /* ---------------------------------------------------------------------------------- */
}
