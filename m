From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009200724.e8K7OOR18297@webber.adilger.net>
Subject: Re: [linux-lvm] LVM + online resizing e2fs patches
In-Reply-To: <01C02275.614677A0.smdenton@bellsouth.net> "from S. Michael Denton
 at Sep 19, 2000 08:08:29 pm"
Date: Wed, 20 Sep 2000 01:24:24 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Scott Denton writes:
> Has anyone used the kernel patches for LVM 0.8i with the online
> resizing patch for e2fs successfully?  I cannot seem to get them to
> reconcile properly, complains about bad hunks (usually where LVM has
> changed block IO code).

Actually, I don't _think_ the ext2online and LVM patches should conflict
at all.  The ext2online patch only changes files in fs/ext2, while LVM
changes files in drivers/block.  I have both working on my systems
(using my LVM 0.8final patch, and my own ext2online patch), so if you
want these instead, let me know...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
