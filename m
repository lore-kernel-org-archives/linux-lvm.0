From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200008021755.e72Ht2D29237@webber.adilger.net>
Subject: Re: [linux-lvm] Generic resize tool
In-Reply-To: <20000802120457.E28254@pinguin.conetix.de> "from Jens Benecke at
 Aug 2, 2000 12:04:57 pm"
Date: Wed, 2 Aug 2000 11:55:02 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Benecke <jens@pinguin.conetix.de>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Jens writes:
> One suggestion, also for Heinz: PLEASE put a notice into "lvresize" that
> you might actually be better off with e2fsadm, if the lv is formatted ext2.
> So that you use
> 
> 	pvcreate
> 	vgextend
> 	e2fsadm
> 
> instead of
> 
> 	pvcreate
> 	vgextend
> 	lvextend
> 
> and then being stuck with not knowing how (and how much) to resize the FS
> within.

Actually, the resize tools for ext2 (resize2fs, ext2resize, ext2online) will
all figure out the size of the device, so if you are resizing to the
full device size (the most common case) then you don't need to specify
the device size at all.

> Another question: If I shrink a LV, how do I know what PVs in the VG get
> freed? i.e. I have  one big LV in VG00 = (hda1 hdb2 hdc1)  and I want to
> remove hdb2 out of the VG. 

They are always taken from the end of the LV.  There is no other way to do
it.  What you would need to do is shrink the lv(s) enough to have free
PEs equal to the number of PEs on hdb2.  Then migrate any in-use PEs on
hdb2 to the other PVs using pvmove.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
