-- | This sets up the recommended implementation of various AES cipher
-- modes.

{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE FlexibleInstances    #-}
--
-- The orphan instance declaration separates the implementation and
-- setting the recommended instances. Therefore, we ignore the warning.
--

module Raaz.Cipher.AES.Recommendation where

import           Raaz.Core
import           Raaz.Cipher.Internal
import           Raaz.Cipher.AES.Internal
import qualified Raaz.Cipher.AES.CBC.Implementation.CPortable as CPCBC

-- | Recommended implementation of AES-128 cbc
instance Recommendation (AES 128 'CBC) where
         recommended _ = CPCBC.aes128cbcI

-- | Recommended implementation of AES-192 cbc
instance Recommendation (AES 192 'CBC) where
         recommended _ = CPCBC.aes192cbcI

-- | Recommended implementation of AES-256 cbc
instance Recommendation (AES 256 'CBC) where
         recommended _ = CPCBC.aes256cbcI
