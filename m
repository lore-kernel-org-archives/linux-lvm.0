Date: Wed, 7 Jun 2000 18:14:47 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607181447.A26520@gruyere.muc.suse.de>
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de> <20000607140043.B5442@colombina.comedia.it> <20000607145954.A22712@gruyere.muc.suse.de> <20000607173420.C5442@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20000607173420.C5442@colombina.comedia.it>; from bluca@comedia.it on Wed, Jun 07, 2000 at 05:34:20PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Jun 07, 2000 at 05:34:20PM +0200, Luca Berra wrote:
> On Wed, Jun 07, 2000 at 02:59:54PM +0200, Andi Kleen wrote:
> > In RAID5 that is very bad (e.g. when the parity block is not uptodate
> > and another block is unreadable) you get silent data corruption. In
> > RAID1 with a slave device you at worst get oudated data (may cause
> I thought the event counter in the raid superblock was used for this
> purpose.

That would require adding a generation counter to every raid stripe
(=losing at least one block/stripe) 
and also writing of the superblock before every write.


-Andi
