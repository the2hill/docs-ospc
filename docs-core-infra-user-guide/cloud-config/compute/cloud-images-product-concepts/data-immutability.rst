.. _data-immutability:

~~~~~~~~~~~~~~~~~
Data immutability
~~~~~~~~~~~~~~~~~
An important aspect of how Cloud Images treats images is that *image
data is immutable*. After the image data has been uploaded and the
checksum and location are set, the image data *cannot be modified*.
Thus you are guaranteed that whenever you boot a server from the image
with ID da455637-9ff1-43e9-bb81-0f9e5498a913, you will always receive
the exact same set of bits (and hence, the exact same operating system
kernal and configuration) every time.

Consider this immutablity if you plan to create your
own set of custom images. If you create an image and then discover, for
example, that it’s missing a security update so important that you don’t
want anyone to use the original image, you can’t simply swap out the
image data. Instead, you must delete the original image and create a new
one.

The new image will be assigned a different UUID. Thus,
if you are writing scripts to use an image that contains the SuperOS
operating system, it’s a good idea *not* to use the image UUID in your
script. Instead, you should use some custom image property to identify
an image as containing the SuperOS operating system, and then program
your script to use the filtering abilities of the Cloud Images API to
locate the image that you want.

.. include:: /_common/seealso-concepts-cloud-images.txt
