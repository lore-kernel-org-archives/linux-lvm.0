From: Andreas Dilger <adilger@home.com>
Message-Id: <200002100714.AAA05415@webber.adilger.net>
Subject: Re: [linux-lvm] Configuring boot partition with LVM
Date: Thu, 10 Feb 2000 00:14:04 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Christopher Shaulis writes:
> I can't remember exactly how they explained it, but IBM has a good
> reason for not allowing mirrored dump devices. I think the idea is that
> in order to catch the system dumping in the LVM code itself, you have to
> write the dump without the aid of the LVM. I think the way that works is
> that it precomputes a list of offset:extent lists for the device when it
> is brought online.

I think that the issue isn't when the dump is written to a mirrored LV
(as the dump will only go to one or the other copy of the LV), but when
it is read back there is no way to determine which copy you will read
from (I/O load balancing causes reads to come from either PV), so you
may get intermittent garbage inside the dump...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
