{-# LANGUAGE ForeignFunctionInterface   #-}
-- | The portable C-implementation of SHA256.
module Raaz.Hash.Sha256.Implementation.CPortable
       ( implementation, cPortable
       ) where

import Foreign.Ptr               ( Ptr )
import Raaz.Core
import Raaz.Hash.Internal
import Raaz.Hash.Sha.Util
import Raaz.Hash.Sha256.Internal

-- | The portable C implementation of SHA256.
implementation :: Implementation SHA256
implementation =  SomeHashI cPortable

-- | The Hash implementation, i.e. `HashI` associated with the
-- portable C implementation for the hash SHA256. This can be used to
-- define an implementation of truncated hashes like SHA224.
cPortable :: HashI SHA256 (HashMemory SHA256)
cPortable = shaImplementation
            "sha256-cportable"
            "Sha256 Implementation using portable C and Haskell FFI"
            c_sha256_compress length64Write


foreign import ccall unsafe
  "raaz/hash/sha256/portable.h raazHashSha256PortableCompress"
  c_sha256_compress  :: Pointer -> Int -> Ptr SHA256 -> IO ()
