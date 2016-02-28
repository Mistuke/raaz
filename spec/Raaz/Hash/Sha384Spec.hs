
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Raaz.Hash.Sha384Spec where

import           Common
import qualified Common.Hash as CH

hashesTo :: ByteString -> SHA384 -> Spec
hashesTo = CH.hashesTo

spec :: Spec
spec =  do

  prop "store followed by load returns original value" $ \ (x :: SHA384) ->
    storeAndThenLoad x `shouldReturn` x

  --
  -- Some unit tests
  --
  "" `hashesTo` "38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b"

  "abc" `hashesTo` "cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a8b605a43ff5bed8086072ba1e7cc2358baeca134c825a7"

  "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu" `hashesTo`
    "09330c33f71147e83d192fc782cd1b4753111b173b3b05d22fa08086e3b0f712fcc7c71a557e2db966c3e9fa91746039"
  "The quick brown fox jumps over the lazy dog" `hashesTo`
    "ca737f1014a48f4c0b6dd43cb177b0afd9e5169367544c494011e3317dbf9a509cb1e5dc1e85a941bbee3d7f2afbc9b1"
  "The quick brown fox jumps over the lazy cog" `hashesTo`
    "098cea620b0978caa5f0befba6ddcf22764bea977e1c70b3483edfdf1de25f4b40d6cea3cadf00f809d422feb1f0161b"
  "The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog" `hashesTo`
    "ef06b4ee875361dd5b9737c835c5fbb1d47fc59edb3430fec50341c627c4296e7e3f80b3a7b1295a6aaf14f0ef2418a9"
