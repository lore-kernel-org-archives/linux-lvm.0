Message-ID: <390FFA06.F5EBA4F0@twc.de>
Date: Wed, 03 May 2000 12:05:58 +0200
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SuSE/LVM boot problem
References: <20000502052139.AAA12301@quartz.nbnet.nb.ca@Lxxxx.nbtel.nb.ca> <200005020951.LAA07870@e35.marxmeier.com> <20000502114113.C1608@archimedes.suse.com> <20000502232221.A20803@gondor.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com

Jan Niehusmann wrote:
> I can imagine two ways to make lilo work with lvm:
> 
> 1) at install time (when you run /sbin/lilo), lilo maps the logical (lvm)
> locations to physical locations and writes these to the boot block. The boot
> code doesn't need to be changed.
>
> 2) lilo writes logical locations to the boot block (trivial). The boot
> code needs to understand lvm.

While waiting for either 1 or 2 you could use 3:

3) Make /boot and / contiguous and remember not to move them until lvm
has a non-moveable flag. Calculate the physical start and the length in
sectors of /boot and /, fake them into your partition table and use
these "partition aliases" to boot and use these filesystems...
...and don�t forget to give lilo an append="..." line defining the real
geometry of your drive as linux�s geometry guessing will give strange
results with such aliases not starting on cylinder boundaries...
This hack works fine for me since end of november 1999.
Better explanations are at http://www.freenet.de/y.e.t.i./
