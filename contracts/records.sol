// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract EmployeeData {
    uint256 public employeeCount;    
    struct EmployeePrimary {	
        string name;	
        uint256 dob;	
        string fatherName;	
        uint256 aadhar;	}
    struct EmployeePersonal {	
        string currentaddress;	
        uint256 phone;	
        string gender;	
        string photo;	
        string aadharFile;	}
    struct EmployeeSecondary {	
        string qualification;	
        string railwayId;	
        string category;	}
    struct EmployeeJoining {	
        uint256 doj;	
        string designation;	
        uint256 offeredSalary;	
        uint256 hra;	}
    struct EmployeeBank {	
        string accNumber;	
        string bankName;	
        string ifsc;	
        string passbookFile;	}
    struct EmployeeWorking {	
        string siteName;	
        string depot;	
        string workStatus;	}
    struct EmployeeDocs {	
        string form11;	
        string form2;	
        string form1;	
        string nominationForm;	}

    mapping(uint256 => EmployeePrimary) public employeeIdToEmployeePrimary;
    mapping(uint256 => EmployeePersonal) public employeeIdToEmployeePersonal;
    mapping(uint256 => EmployeeSecondary) public employeeIdToEmployeeSecondary;
    mapping(uint256 => EmployeeJoining) public employeeIdToEmployeeJoining;
    mapping(uint256 => EmployeeBank) public employeeIdToEmployeeBank;
    mapping(uint256 => EmployeeWorking) public employeeIdToEmployeeWorking;
    mapping(uint256 => EmployeeDocs) public employeeIdToEmployeeDocs;


    mapping(uint256 => uint256) public employeeAadharToId;
     constructor () {
         employeeCount = 0;
     }
    function addEmployee(string memory _name, uint256  _dob, string memory _fatherName, uint256  _aadhar) public {
        require(employeeAadharToId[_aadhar] == 0, "Employee already exists");
        employeeCount = employeeCount + 1;
        employeeIdToEmployeePrimary[employeeCount].name = _name;
        employeeIdToEmployeePrimary[employeeCount].dob = _dob;
        employeeIdToEmployeePrimary[employeeCount].aadhar = _aadhar;
        employeeIdToEmployeePrimary[employeeCount].fatherName = _fatherName;
        employeeAadharToId[_aadhar] = employeeCount;  
    } 

    function modifyPrimaryData(uint256  _aadhar, string memory _name, uint256  _dob, string memory _fatherName) public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeePrimary[employeeId].dob = _dob;        
        employeeIdToEmployeePrimary[employeeCount].name = _name;        
        employeeIdToEmployeePrimary[employeeId].fatherName = _fatherName;    }

    function personalDetails(uint256 _aadhar, string memory _currentaddress, uint256  _phone, string memory _gender, string memory _photo, string  memory _aadharFile)  public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeePersonal[employeeId].currentaddress = _currentaddress;	 
        employeeIdToEmployeePersonal[employeeId].phone = _phone;			 
        employeeIdToEmployeePersonal[employeeId].gender = _gender;			 
        employeeIdToEmployeePersonal[employeeId].photo = _photo;			 
        employeeIdToEmployeePersonal[employeeId].aadharFile = _aadharFile;	     }	 
    function secondaryDetails(uint256 _aadhar, string memory _qualification, string memory _railwayId, string memory _category )  public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeeSecondary[employeeId].qualification = _qualification;	 
        employeeIdToEmployeeSecondary[employeeId].railwayId = _railwayId;		 
        employeeIdToEmployeeSecondary[employeeId].category = _category;	     }	 
    function joiningDetails(uint256 _aadhar, uint256  _doj, string memory _designation, uint256  _offeredSalary, uint256  _hra )  public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeeJoining[employeeId].doj = _doj;				 
        employeeIdToEmployeeJoining[employeeId].designation = _designation;		 
        employeeIdToEmployeeJoining[employeeId].offeredSalary = _offeredSalary;	 
        employeeIdToEmployeeJoining[employeeId].hra = _hra;			     }	 
    function bankDetails(uint256 _aadhar, string memory _accNumber, string memory _bankName, string memory _ifsc, string memory _passbookFile )  public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeeBank[employeeId].accNumber = _accNumber;			 
        employeeIdToEmployeeBank[employeeId].bankName = _bankName;			 
        employeeIdToEmployeeBank[employeeId].ifsc = _ifsc;				 
        employeeIdToEmployeeBank[employeeId].passbookFile = _passbookFile;	     }	 
    function workingDetails(uint256 _aadhar, string memory _siteName, string memory _depot, string memory _workStatus )  public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeeWorking[employeeId].siteName = _siteName;			 
        employeeIdToEmployeeWorking[employeeId].depot = _depot;			 
        employeeIdToEmployeeWorking[employeeId].workStatus = _workStatus;	     }	 
    function docsDetails(uint256 _aadhar, string memory _form11, string  memory _form2, string memory _form1, string memory _nominationForm )  public {
        require(employeeAadharToId[_aadhar] > 0, 'Employee does not exist');
        uint256 employeeId = employeeAadharToId[_aadhar];
        employeeIdToEmployeeDocs[employeeId].form11 = _form11;				 
        employeeIdToEmployeeDocs[employeeId].form2 = _form2;				 
        employeeIdToEmployeeDocs[employeeId].form1 = _form1;				 
        employeeIdToEmployeeDocs[employeeId].nominationForm = _nominationForm;	     }	 
     
}