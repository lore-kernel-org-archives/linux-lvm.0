Message-ID: <01C022D8.286A2860.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Reply-To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] LVM + online resizing e2fs patches
Date: Wed, 20 Sep 2000 07:55:32 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

On Wednesday, 20 September 2000 03:24, Andreas Dilger [SMTP:adilger@turbolinux.com] wrote:
> Scott Denton writes:
> > Has anyone used the kernel patches for LVM 0.8i with the online
> > resizing patch for e2fs successfully?  I cannot seem to get them to
> > reconcile properly, complains about bad hunks (usually where LVM has
> > changed block IO code).
> 
> Actually, I don't _think_ the ext2online and LVM patches should conflict
> at all.  The ext2online patch only changes files in fs/ext2, while LVM
> changes files in drivers/block.  I have both working on my systems
> (using my LVM 0.8final patch, and my own ext2online patch), so if you
> want these instead, let me know...
> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

Would they work with 2.2.13?  Or would I have to upgrade my kernel?

Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng
