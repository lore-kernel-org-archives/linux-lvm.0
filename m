Date: Mon, 21 Jun 1999 00:47:10 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
In-Reply-To: <m10vk14-0000YbC@duffy1.franken.de>
Message-ID: <Pine.LNX.4.10.9906210045580.24353-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Jakob <rjakob@duffy1.franken.de>
Cc: linux-lvm@msede.com

On Sun, 20 Jun 1999, Rolf Jakob wrote:

  > What about:
  > 
  > http://www.dsv.nl/~buytenh/ext2resize/
  > 
  > i've no idea whether it works or not.
  
  It works - hmm, sometimes :-)
  I managed to resize a mounted file system and several times it was possible
  to copy more files on it after the resize. But from time to time I got an
  error saying "no space left on device" while df shows the free space
  correctly.

on a mounted filesystem? i think you're only supposed to use it on
*unmounted* fs's. might explain the error messages.. :)

regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
The primary function of the design engineer is to make things
difficult for the fabricator and impossible for the serviceman.
