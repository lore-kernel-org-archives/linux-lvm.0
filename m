Date: Thu, 14 Oct 1999 14:20:18 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] which kernel for lvm + devfs
Message-ID: <19991014142018.A2878@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <m11bW8j-0000YPC@duffy1.franken.de>
Mime-Version: 1.0
In-Reply-To: <m11bW8j-0000YPC@duffy1.franken.de>; from rjakob@duffy1.franken.de on Wed, Oct 13, 1999 at 10:40:52PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Jakob <rjakob@duffy1.franken.de>
Cc: linux-lvm@msede.com

Rolf Jakob (rjakob@duffy1.franken.de) wrote :

> which kernel is suitable for lvm + devfs ?
> Currently I use 2.2.11 w/ devfs w/o lvm, I used to have a 2.2.9 w/ lvm but
> had problems with the aha7xxx (spurious t/o and resets).
> Patching 2.2.11 for devfs was an adventure, I do not really want to repeat
> that for 2.2.12. The lvm patch had - of course - several problems with the
> changed kernel.
> 
> What kernel versions and patches do you use ? Nobody out there using devfs
> and lvm and Adaptec ? I would very appreciate some hints.

I'm using adaptec 2940uw and aha152x with LVM and devfs, with no problems. kernel version 2.2.12, devfs 0.99.5 and LVM 0.7. you have to apply LVM at first, then devfs patch, the problems are lessened. there is only one rejected file, which is quite okay I assume (when you patch it by hand)
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
