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

next :: [a] -> a
next (x:y:_) = y

buscar :: String -> String
buscar xs = takeWhile (/= '>') (snd(splitAt 7 xs))   
			
delete' :: String -> String
delete' [] = "vacio"
delete' st = filter (/='"') (show st)
			
			
lectura ::  String -> String
lectura [] = "vacio"
lectura (x:xs) 
		| x <= '<' = buscar xs
		|otherwise = "error"
		 
getvalue :: [String] -> [String, String, String]
getvalue xs = [takeWhile (/= ',') xs, takeWhile (/= ',') (dropWhile (/=',') xs), takeWhile (/= ',') (dropWhile (/=',') (dropWhile (/=',') xs))]		
		
guardarDev :: [String, String, String]  -> Device	
guardarDev [] = "vacia"
guardarDev (a,b,c) = Device { id1 = a, user = b, fallback = c}

split :: Eq a => [a] -> [a] -> [[a]]
split _ [] = []
split delim str =
    let (firstline, remainder) = breakList (startswith delim) str
        in 
        firstline : case remainder of
                                   [] -> []
                                   x -> if x == delim
                                        then [] : []
                                        else split delim 
                                                 (drop (length delim) x)