# ECB art

It is well known among cryptographers that ECB mode is insecure. The most famous
demonstration of this is the [ECB
penguin](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Electronic_codebook_(ECB)).
This is a simple script to produce your own ECB art using a .ppm image and a key
of your choosing. Note: it only works well with images with repeating patterns
such as simple digital images without a rich colour palette.

## Usage:

```
./encrypt.sh Tux.ppm my_secret_key
open ecb_encrypted_art_Tux.ppm
```
