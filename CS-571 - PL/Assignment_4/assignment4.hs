maxlist :: [Int] -> Int
maxlist[] = error"no input"
maxlist[x] = x
maxlist(x:xs)
  | x>maxlist(xs) = x
  | otherwise = maxlist(xs)

-- The above haskell code works for question 1

delete :: Int -> [a] -> [a]
delete n xs
  | n < 0         = error"cannot delete negative index elements"
  | length xs < n = xs
  | otherwise     = take (n-1) xs ++ delete n (drop n xs)

-- The above haskell code works for question 2


inst :: Ord a =>a-> [a] -> [a]
inst x [] = [x]
inst x (y:xs)
 | (x<=y)      = x:y:xs
 | otherwise   = y:inst x xs

isort :: Ord a=>[a] -> [a]
isort [] = []
isort (x:xs) = inst x (isort xs)

-- The above haskell code works for question 3


rotate :: Int -> [a] -> [a]
rotate _ [] = []
rotate 0 x = x
rotate y x
  | y > 0 = rotate (y-1) (last x : init x)

-- The above haskell code works for question 4


single::[int]->[[int]]
single[] = []
single[x] = [[x]]
single (x:xs)
  |otherwise = [x]:single(xs)

-- The above haskell code works for question 5


double::[Int] -> [Int]
double[] = []
double[x] = [2*x]
double(x:y:xs)
  |otherwise = (2*x):y:(double xs)

-- The above haskell code works for question 6