{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Raaz.Hash.Blake2bSpec where

import           Prelude hiding (replicate)

import           Common
import qualified Common.Hash as CH

{--
hashesTo :: ByteString -> BLAKE2b -> Spec
hashesTo = CH.hashesTo

hmacsTo  :: ByteString -> HMAC BLAKE2b -> Key (HMAC BLAKE2b) -> Spec
hmacsTo  = CH.hmacsTo
--}

spec :: Spec
spec =  do

  basicEndianSpecs (undefined :: BLAKE2b)

  {-
  --
  -- Some unit tests
  --
  "" `hashesTo`
    "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"

  "abc" `hashesTo`
    "ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f"

  "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu" `hashesTo`
    "8e959b75dae313da8cf4f72814fc143f8f7779c6eb9f7fa17299aeadb6889018501d289e4900f7e4331b99dec4b5433ac7d329eeb6dd26545e96e55b874be909"

  "The quick brown fox jumps over the lazy dog" `hashesTo`
    "07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6"

  "The quick brown fox jumps over the lazy cog" `hashesTo`
    "3eeee1d0e11733ef152a6c29503b3ae20c4f1f3cda4cb26f1bc1a41f91c7fe4ab3bd86494049e201c4bd5155f31ecb7a3c8606843c4cc8dfcab7da11c8ae5045"

  "The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog" `hashesTo`
    "e489dcc2e8867d0bbeb0a35e6b94951a11affd7041ef39fa21719eb01800c29a2c3522924443939a7848fde58fb1dbd9698fece092c0c2b412c51a47602cfd38"

  -- Some hmac specs
  hmacSpec


hmacSpec :: Spec
hmacSpec = do
  with ("0b" `repeated` 20) $ "Hi There" `hmacsTo`
    "87aa7cdea5ef619d4ff0b4241a1d6cb02379f4e2ce4ec2787ad0b30545e17cdedaa833b7d6b8a702038b274eaea3f4e4be9d914eeb61f1702e696c203a126854"

  with ("aa" `repeated` 20) $ (replicate (50 :: BYTES Int) 0xdd) `hmacsTo`
    "fa73b0089d56a284efb0f0756c890be9b1b5dbdd8ee81a3655f83e33b2279d39bf3e848279a722c806b485a47e67c807b946a337bee8942674278859e13292fb"

  with ("aa" `repeated` 131) $ "Test Using Larger Than Block-Size Key - Hash Key First" `hmacsTo`
    "80b24263c7c1a3ebb71493c1dd7be8b49b46d1f41b4aeec1121b013783f8f3526b56d037e05f2598bd0fd2215d6a1e5295e64f73f63f0aec8b915a985d786598"

  with ("aa" `repeated` 131) $
    "This is a test using a larger than block-size key and a larger than block-size data. The key needs to be hashed before being used by the HMAC algorithm." `hmacsTo`
    "e37b6a775dc87dbaa4dfa9f96e5e3ffddebd71f8867289865df5a32d20cdc944b6022cac3c4982b10d5eeb55c3e4de15134676fb6de0446065c97440fa8c6a58"

  let key = fromString $ (show  :: Base16 -> String) $ encodeByteString "Jefe"
      in with key  $ "what do ya want for nothing?" `hmacsTo`
           "164b7a7bfcf819e2e395fbe73b56e0a387bd64222e831fd610270cd7ea2505549758bf75c05a994a6d034f65f8f0e6fdcaeab1a34d4a6b4b636e070a38bce737"

-}
