

data Devices = Devices {dispositivos :: [Device]} deriving (Show)

data Device = Device {id1 :: String
					  ,user :: String
					  ,fallback ::String
					  ,grupo :: [Group] 
					  } deriving (Show)
					  
data Group = Group {id2 :: String
				    ,capacidad :: [Capability]
					} deriving (Show)

data Capability = Capability { nombre :: String
							  ,valor :: String
							  } deriving (Show)  					