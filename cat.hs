import Data.List
import System.IO
import System.Directory
import System.Environment
import System.FilePath.Posix

main = do
    args <- getArgs
    processAll args

processAll args = do
    let hArg = head args
    let rArgs = tail args
    if rArgs == [] 
        then do return ()
        else do
            exists <- doesFileExist hArg
            if exists 
                then do putStrLn "File Found.  Processing..."; process hArg
                else do putStrLn "File Not Found.  Continuing..."
            processAll rArgs
	
process file = do
    contents <- readFile file
    putStrLn contents