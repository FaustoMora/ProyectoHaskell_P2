import System.IO.Unsafe 


--Lectura del archivo y obteniendo su contendido en un dato
info = unsafePerformIO . readFile $ "file.txt"
--info tiene toda la informacion del archivo

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