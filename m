From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010270313.e9R3DGU27627@webber.adilger.net>
Subject: Re: [linux-lvm] Size limits and kernel versions
In-Reply-To: <OLEAJMNOEMOMMNEIMMINEEEBCBAA.pswartz@digitalrom.com>
 "from Patrick Swartz at Oct 26, 2000 02:04:39 pm"
Date: Thu, 26 Oct 2000 21:13:16 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Swartz <pswartz@digitalrom.com>
Cc: linux-lvm@msede.com

Patrick Swartz writes:
> I am just getting start with LVM and have a few questions.  First let me
> describe my situation. I have 2 RH7.0 servers each with an ICP-Vortex RAID
> controller that is attached to a chassis with 11 50GB drives in a raid5 +
> hot spare.  This gives me about 450GB of usable data space.  I would like to
> combine these controllers in a single server and use LVM to create one large
> logical volume.
> 
> Is this possible?

Yes, it should be.  There is an in-kernel limit of 1TB per device (and an
LV is considered a single device even if it is spread across multiple disks).
This limit is also in 2.4 and will not be fixed until 2.5.

> Will I loose the data that is on both? just one?

If you are already using LVM on both systems, then there should be little
problem moving them to a single system (watch out for VG name conflicts).
If they are not using LVM, then there is a big problem to move them to LVM.

> If so, what kernel patch do I use for RedHat 7.0?

You can probably use my 2.2 patch at ftp://ftp.stelias.com/pub/adilger/
but I haven't tried it on Red Hat.  I have heard some strange things
about RH 7.0 headers and such, so it may take a bit of work.  It may
even be that RH 7.0 has LVM in it already, I don't know.

> Or, should I install the latest kernel (2.4.0-test9)?
> If that is the case what do I need to do to get the user tools to compile?

Check out the above site for patched user tools.  They will work for both
2.4 and 2.2 (with my patch) because they are both 0.8final.  There are
other 2.2 LVM patches out there (0.8i and such) that will need different
user tools.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
