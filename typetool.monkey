Strict

Public

#Rem
	DESCRIPTION:
		* The following module is used for future-proofing/potentially optimizing programs.
		
		The types in this module are not usually unique, and you should only
		expect exact compatibility between obviously compatible aliases.
		
		For example, you should not expect a distinction between integer types (Without proper preprocessor-flags checks).
		However, you should generally expect automatic conversion (No matter the implementation).
	
	NOTES:
		* ATTENTION: Please read the 'README' file before adopting this module yourself.
		
		* This module was developed with the knowledge these types
		do not have integrity, and are aliases under normal situations (With default Monkey at least).
		
		* Overloads should not expect differences between aliases.
		These types are expected to boil down to a 'core-type'.
		
		* Use this module at your own risk, types should not be expected to be
		binary-compatible with what are normally realistic expectations.
		
		* These types are meant to future-proof code which could run more optimally in the event Monkey adopts other types.
		Assuming the names are the same as this module, the usual implementations here (Aliases) will be removed or commented out.
		
		In the event of naming differences, this module will resolve such issues as needed.
		
		* Current (And potentially future) uses of 'Int' arrays should probably stay as such.
		
		That being said, in situations where no optimization is done with regard to bit shifting, these situations are far more feasible.
		Also realize that if a version of Monkey adds support for arrays of what are currently non-standard integers, compatibility may be an issue.
		
		As a bit of a relevant side note (With regard to 'mojo'): In situations where you're using a container for frames of an 'Image' ("Tile-maps" for example),
		using the 'Unsigned_Short' type is usually ideal (Or one of its aliases, such as 'UShort'). (Unless further data is stored within these integers; collision information for example)
		
		* Integer types should be assumed to not have the effects of what they're trying to represent.
		
		For example: The 'Octet' alias does not necessarily apply 'ApplyOctetBounds' to everything, it's meant to be used for potential memory optimization.
		
		* If you were to adopt this module, the best course of action tends to be implementing functions via generics/template using classes.
		Of course, this is the most ideal situation, not the most realistic one. If you're able to off-load functions to a generic class,
		go right ahead, but stay away from overloading with these types. If you're going to have a single version of a function,
		use 'Long' or stick to the usual 'Int' (And maybe 'UInt' and/or 'ULong', but those can be problematic at times).
		
		If you're expecting conflicts to be resolved without the proper extensions enabled, you're adopting this improperly.
		On the other hand, if you wish to go the route of supporting these types as alternate overloads, implement multiple versions of the function,
		then encapsulate those versions with a check for the proper type-extensions. This can also be done with generic/template classes for the sake of code reuse.
		
		If a version of Monkey comes along with template/generic functions (Or other functionality), feel free to use those at your own risk.
		
		* Only use the "bounds" commands if you absolutely need them. They're only really there as a last resort.
		Functionality for those commands can be configured with the preprocessor (Be wary of other modules using these commands while configuring them).
	CORE TYPES:
		* This module defines 'core-types' as the base types within Monkey.
		
		These types are currently as follows:
			* 'Int' (%)
			* 'Float' (#)
			* 'String' ($)
			* 'Bool' (?)
		
		Normally these would be defined as "primitive types", however, the addition of 'String' makes this term inaccurate.
#End

' Preprocessor related:
#TYPETOOL_IMPLEMENTED = True
#TYPETOOL_SIMULATE_SIGNED_TYPES = True
#TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED = False
#TYPETOOL_SIMULATE_PROPER_BOUNDS = True
#TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER = True

#Rem
	As specified in the 'NOTES' section, these will be managed as
	Monkey (Or Monkey based languages) add(s) support for these extensions.
	
	These extension variables (Unless someone wants to support these particular variables)
	will be managed by myself / anyone else maintaining this module.
	
	If an extension variable's value is 'True', then this module's local implementation will not be used.
#End

' Integer extensions:
#MONKEYLANG_EXTENSION_UNSIGNED_TYPES = False

' Check for unsigned types:
#If MONKEYLANG_EXTENSION_UNSIGNED_TYPES
	#If MONKEYLANG_EXTENSION_TYPE_OCTET
		#MONKEYLANG_EXTENSION_TYPE_UNISGNED_OCTET = True
	#End
	
	#If MONKEYLANG_EXTENSION_TYPE_SHORT
		#MONKEYLANG_EXTENSION_TYPE_UNISGNED_SHORT = True
	#End
	
	#MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT = True
	
	#If MONKEYLANG_EXTENSION_TYPE_LONG
		#MONKEYLANG_EXTENSION_TYPE_UNISGNED_LONG = True
	#End
#End

#If MONKEYLANG_EXTENSION_TYPE_UNISGNED_OCTET
	#MONKEYLANG_EXTENSION_TYPE_BYTE = True
	#MONKEYLANG_EXTENSION_TYPE_UNISGNED_BYTE = True
#End

' Default integer extension settings:
#Rem
	#MONKEYLANG_EXTENSION_TYPE_OCTET = False
	#MONKEYLANG_EXTENSION_TYPE_SHORT = False
	#MONKEYLANG_EXTENSION_TYPE_LONG = False
#End

' Floating-point extensions:

' Default floating-point extension settings:
'#MONKEYLANG_EXTENSION_TYPE_DOUBLE = False

' Imports:

' Check if the 'util' module is used at all:
#If ((Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_OCTET Or Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_SHORT Or Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT) And Not TYPETOOL_SIMULATE_PROPER_BOUNDS) Or ((TYPETOOL_SIMULATE_SIGNED_TYPES Or TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED) And (Not MONKEYLANG_EXTENSION_TYPE_OCTET Or Not MONKEYLANG_EXTENSION_TYPE_SHORT) And (Not TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED And TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER))
	#TYPETOOL_IMPORT_UTIL = True
#End

#If TYPETOOL_IMPORT_UTIL
	Import util
#End

' Aliases:

' Integer types:
#If Not MONKEYLANG_EXTENSION_TYPE_OCTET
	Alias Octet = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_SHORT
	Alias Short = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_LONG
	Alias Long = Int
#End

#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_OCTET
	Alias Unsigned_Octet = Octet
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

' These are standard under this module's specifications, I recommend using them:
Alias UOctet = Unsigned_Octet
Alias UShort = Unsigned_Short
Alias UInt = Unsigned_Int
Alias ULong = Unsigned_Long

' These aliases are also meant for real-world use.
Alias Byte = UOctet
Alias SByte = Octet
Alias Signed_Byte = SByte
Alias UByte = Byte

' Floating-point types:
#If Not MONKEYLANG_EXTENSION_TYPE_DOUBLE
	Alias Double = Float
#End

' Macros:
Alias Long_Double = Double

' Other:
'Alias Char = UOctet

' Constant variable(s):

' Maximum bounds (As unsigned literals):
Const OCTET_MAX_POSITIVE_NUMBERS:UOctet = 128
Const UOCTET_MAX_POSITIVE_NUMBERS:UShort = 256

Const OCTET_MAX:Octet = OCTET_MAX_POSITIVE_NUMBERS-1
Const UOCTET_MAX:UOctet = UOCTET_MAX_POSITIVE_NUMBERS-1

Const SHORT_MAX_POSITIVE_NUMBERS:UShort = 32768
Const USHORT_MAX_POSITIVE_NUMBERS:UInt = 65536

Const SHORT_MAX:Short = SHORT_MAX_POSITIVE_NUMBERS-1
Const USHORT_MAX:UShort = USHORT_MAX_POSITIVE_NUMBERS-1

' The following fixes were done to deal with Monkey's default 'Int' type, as well as GCC/MinGW issues:
#If MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT
	Const INT_MAX_POSITIVE_NUMBERS:UInt = 2147483648
	Const INT_MAX:Int = INT_MAX_POSITIVE_NUMBERS-1
#Else
	Const INT_MAX_POSITIVE_NUMBERS:UInt = 2147483647
	Const INT_MAX:Int = INT_MAX_POSITIVE_NUMBERS
#End

#If MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT
	#If MONKEYLANG_EXTENSION_TYPE_UNISGNED_LONG
		Const UINT_MAXIMUM_POSITIVE_NUMBERS:ULong = 4294967296
		Const UINT_MAX:UInt = UINT_MAXIMUM_POSITIVE_NUMBERS-1
	#Else
		Const UINT_MAXIMUM_POSITIVE_NUMBERS:UInt = 4294967295
		Const UINT_MAX:UInt = UINT_MAXIMUM_POSITIVE_NUMBERS
	#End
#Else
	Const UINT_MAX_POSITIVE_NUMBERS:UInt = INT_MAX_POSITIVE_NUMBERS
	Const UINT_MAX:= INT_MAX
#End

' Type-bounds aliases:
Const BYTE_MAX_POSITIVE_NUMBERS:= UOCTET_MAX_POSITIVE_NUMBERS
Const SBYTE_MAX_POSITIVE_NUMBERS:= OCTET_MAX_POSITIVE_NUMBERS

Const BYTE_MAX:= UOCTET_MAX
Const SBYTE_MAX:= OCTET_MAX

' Functions:
Function ApplyByteBounds:Byte(B:Byte)
	Return Byte(ApplyUOctetBounds(UOctet(B)))
End

Function ApplySByteBounds:SByte(B:SByte)
	Return SByte(ApplyOctetBounds(Octet(B)))
End

Function ApplyOctetBounds:Octet(O:Octet)
	#If (TYPETOOL_SIMULATE_SIGNED_TYPES Or TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED) And Not MONKEYLANG_EXTENSION_TYPE_OCTET
		#If TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED
			Return Octet(ApplyUOctetBounds(UOctet(O)))
		#Else
			#If TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER
				Return Octet(SMod(O, OCTET_MAX_POSITIVE_NUMBERS))
			#Else
				Return (Int(O) | -UOCTET_MAX_POSITIVE_NUMBERS)
			#End
		#End
	#Else
		Return O
	#End
End

Function ApplyUOctetBounds:UOctet(O:UOctet)
	#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_OCTET
		#If TYPETOOL_SIMULATE_PROPER_BOUNDS
			#If TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER
				Return (Int(UOCTET_MAX_POSITIVE_NUMBERS+O) & UOCTET_MAX) ' Mod UOCTET_MAX_POSITIVE_NUMBERS
			#Else
				Return Abs(O) Mod UOCTET_MAX_POSITIVE_NUMBERS
			#End
		#Else
			Return SMod(O, UOCTET_MAX_POSITIVE_NUMBERS)
		#End
	#Else
		Return O
	#End
End

Function ApplyShortBounds:Short(S:Short)
	#If (TYPETOOL_SIMULATE_SIGNED_TYPES Or TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED) And Not MONKEYLANG_EXTENSION_TYPE_SHORT
		#If TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED
			Return Short(ApplyUShortBounds(UShort(S)))
		#Else
			#If TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER
				Return Short(SMod(S, SHORT_MAX_POSITIVE_NUMBERS))
			#Else
				Return Short(Int(S) | -USHORT_MAX_POSITIVE_NUMBERS)
			#End
		#End
	#Else
		Return S
	#End
End

Function ApplyUShortBounds:UShort(S:UShort)
	#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_SHORT
		#If TYPETOOL_SIMULATE_PROPER_BOUNDS
			#If TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER
				Return (Int(USHORT_MAX_POSITIVE_NUMBERS+S) & USHORT_MAX) ' Mod USHORT_MAX_POSITIVE_NUMBERS
			#Else
				Return Abs(S) Mod USHORT_MAX_POSITIVE_NUMBERS
			#End
		#Else
			Return SMod(S, USHORT_MAX_POSITIVE_NUMBERS)
		#End
	#Else
		Return S
	#End
End

' This is just a formality, there's no point to these commands right now:
Function ApplyIntBounds:Int(I:Int)
	#If MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT And TYPETOOL_SIMULATE_SIGNED_TYPES_AS_UNSIGNED
		Return Int(ApplyUIntBounds(UInt(I)))
	#Else
		Return I
	#End
End

Function ApplyUIntBounds:UInt(I:UInt)
	#If Not MONKEYLANG_EXTENSION_TYPE_UNISGNED_INT
		#If TYPETOOL_SIMULATE_PROPER_BOUNDS
			#If TYPETOOL_SIMULATE_PROPER_BOUNDS_ROLLOVER
				Return (UINT_MAX_POSITIVE_NUMBERS+I) Mod UINT_MAX_POSITIVE_NUMBERS
				'Return (Int(UINT_MAX_POSITIVE_NUMBERS+I) & UINT_MAX)
			#Else
				Return Abs(I) Mod UINT_MAX_POSITIVE_NUMBERS
			#End
		#Else
			Return SMod(I, UINT_MAX_POSITIVE_NUMBERS)
		#End
	#Else
		Return I
	#End
End