Message-ID: <19990608155241.D2271@kotnet.org>
Date: Tue, 8 Jun 1999 15:52:41 +0200
From: Ulrik De Bie <winmute@kotnet.org>
Subject: Re: [linux-lvm] Re: root filesystem in lvm
References: <199906021129.HAA17118@tequila.cs.yale.edu>
Mime-Version: 1.0
In-Reply-To: <199906021129.HAA17118@tequila.cs.yale.edu>; from Stefan Monnier on Wed, Jun 02, 1999 at 06:43:23AM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Monnier <news+lists.linux.lvm@tequila.cs.yale.edu>, linux-lvm@msede.com

Hello, 

> How would LILO deal with a kernel image spread over several physical
> partitions (or even disks) (in case you not only want a root fs on LVM but
> a striped/mirrored/trucmuched one) ?
Mirrored would not be such a complex thing I guess, as it simplifies to an
image on one of the mirror partitions. Important is to realise that as far
as lilo is concerned, only the partition where the boot image resides is
important (mostly the partition where /boot resides or even the /boot 
partition).
Then it is up to the kernel to find the necessary code to mount the root
partition and start init.
 
Kind regards,
winmute
