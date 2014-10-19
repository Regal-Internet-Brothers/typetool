Strict

Public

#Rem
	DESCRIPTION:
		* The following module is used for future-proofing/potentially optimizing programs.
		
		The types in this module are not usually unique, and you should only
		expect exact compatibility between obviously compatible aliases.
		
		For example, you should not expect a distinction between integer types.
		However, you should generally expect automatic conversion (No matter the implementation).
	
	NOTES:
		* This module was developed with the knowledge these types
		do not have integrity, and are aliases under normal situations.
		
		* Overloads should not expect differences between aliases.
		These types are expected to boil down to a 'core-type'.
		
		* Use this module at your own risk, types should not be expected to be
		binary-compatible with what are normally realistic expectations.
		
		* These types are meant to future-proof code which could run more optimally in the event Monkey adapts other types.
		Assuming the names are the same as this module, the usual implementations here (Aliases) will be removed or commented out.
		
		In the event of naming differences, this module will resolve such issues as needed.
		
		* Current (And potentially future) uses of 'Int' arrays should probably stay as such.
		
		That being said, in situations where no optimization is done with regard to bit shifting, these situations are far more feasable.
		Also realize that if a version of Monkey adds support for arrays of what are currently non-standard integers, compatibility may be an issue.
		
		As a bit of a relevant side note (With regard to 'Mojo'): In situations where you're using a container for frames of an 'Image',
		using the 'Unsigned_Short' type is usually ideal. (Unless further data is stored within these integers; collision information for example)
		
		* Integer types should be assumed to not have the effects of what they're trying to represent.
		
		For example: The 'Byte' alias does not necessarily apply "Mod 256/128" to everything, it's meant to be used for potential memory optimization.
	CORE TYPES:
		* This module defines 'core-types' as the base types within Monkey.
		
		These types are currently as follows:
			* 'Int'
			* 'Float'
			* 'String'
			* 'Bool'
		
		Normally these would be defined as "primitive types", hower the addition of 'String' makes this term inaccurate.
#End

' Preprocessor related:
#TYPETOOL_IMPLEMENTED = True

#Rem
	As specified in the 'NOTES' section, these will be managed as
	Monkey (Or Monkey based languages) add(s) support for these extensions.
	
	These extension variables (Unless someone wants to support these particular variables)
	will be managed by myself / anyone else maintaining this module.
	
	If an extension variable's value is 'True', then this module's local implementation will not be used.
#End

' Integer extensions:
#MONKEYLANG_EXTENSION_TYPE_BYTE = False
#MONKEYLANG_EXTENSION_TYPE_SHORT = False
#MONKEYLANG_EXTENSION_TYPE_LONG = False

#MONKEYLANG_EXTENSION_UNSIGNED_TYPES = False

#If MONKEYLANG_EXTENSION_UNSIGNED_TYPES
	#If MONKEYLANG_EXTENSION_TYPE_BYTE
		#MONKEYLANG_EXTENSION_TYPE_UNISGNED_BYTE = True
	#End
	
	#If MONKEYLANG_EXTENSION_TYPE_SHORT
		#MONKEYLANG_EXTENSION_TYPE_UNISGNED_SHORT = True
	#End
	
	#MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT = True
	
	#If MONKEYLANG_EXTENSION_TYPE_LONG
		#MONKEYLANG_EXTENSION_TYPE_UNISGNED_LONG = True
	#End
#End

' Floating-point extensions:
#MONKEYLANG_EXTENSION_TYPE_DOUBLE = False

' Aliases:

' Integer types:
#If Not MONKEYLANG_EXTENSION_TYPE_BYTE
	Alias Byte = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_SHORT
	Alias Short = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_LONG
	Alias Long = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_BYTE
	Alias Unsigned_Byte = Byte
#End

#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_SHORT
	Alias Unsigned_Short = Short
#End

#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT
	Alias Unsigned_Int = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_LONG
	Alias Unsigned_Long = Long
#End

' Macros:
Alias UByte = Unsigned_Byte
Alias UShort = Unsigned_Short
Alias UInt = Unsigned_Int
Alias ULong = Unsigned_Long

' Floating-point types:
#If Not MONKEYLANG_EXTENSION_TYPE_DOUBLE
	Alias Double = Float
#End

' Macros:
Alias Long_Double = Double

' Other:
'Alias Char = Byte