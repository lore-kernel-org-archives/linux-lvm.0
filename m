From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 12 Sep 2001 17:26:12 -0600
Subject: Re: [linux-lvm] LVM
Message-ID: <20010912172612.C1541@turbolinux.com>
References: <3B9F66BE.DFE69112@carolina.rr.com> <NBBBJHKIOKPKOGOEPEDPCEEADNAA.stuart@bh90210.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBJHKIOKPKOGOEPEDPCEEADNAA.stuart@bh90210.net>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sep 12, 2001  15:47 -0700, IT3 Stuart B. Tener, USNR-R wrote:
> Prior to using LVM, it did not matter that my single Linux partition
> (the root "/") was located beyond the 1024 cylinder. Why does LVM
> move me backwards in making it requisite to again have this limitation
> present? Perhaps I ought to wait until LVM becomes more mature then.

I doubt that this is necessary.  LILO doesn't understand anything but
BIOS-accessible disk blocks, whether it is LVM + ext2/ext3/reiserfs/other.
If you can use your partition beyond cylinder 1024 before, you can continue
to do so later.

That said, there are reasons for NOT putting all of your eggs in one
basket (e.g. LVM).  If there is any problem with LVM, you will not be
able to boot your system.  On my systems I have /boot in a regular
partition (about 70MB) which has my kernels/initrd in it, along with
enough tools from /bin and /sbin, and libs from /lib in order to have
a rescue boot partition in case of trouble.  Once I have tested the
booting from that partition, I don't touch it anymore (it has a
separate "rescue" kernel, modules, etc).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
