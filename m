From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011201160437.C16319@tiger.bigcats.invalid>
References: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org> <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com> <20011129190920.B23998@kluge.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011129190920.B23998@kluge.net>; from felicity@kluge.net on Thu, Nov 29, 2001 at 07:09:20PM -0500
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
Date: Sat Dec  1 10:30:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Theo!

Theo Van Dinter (felicity@kluge.net) wrote 60 lines:

> My rule of thumb for disk layout on a server is:
> 	/boot	- Small, usually 32-128MB, don't run out of space here.

You can also do a combined / and /boot.  Give it enough space
and move everything where non-related changes happen away
from it.  (128 to 256 MB should outlast your HD.)  Non-LVM.

> 	/	- I put /usr in here since there's no reason not to any

Personally I feel /usr really wants a separate partition.
You also may want partitions for /usr/src (if you have lots of
compiling/source code for the whole machine), and /usr/local
(if you use more than a few programs which are not on your
distribution).  Sub-partitions are possible, depending on usage.
Long live LVM.

> 	/var	- As someone's already stated, filling up /var can be a DoS.

If you have a news spool, put it on a separate partition --
it's just too different from size and lifetime compared to
/var.  Unless you have a non-file/hardlink-based news system.
And then still move it out of the way.

If you have a WWW cache, that one might want a separate
partition as well -- and usually there's no need to backup
that cache.


> 	/tmp	- Yet another possible DoS, don't allow user-writable areas
> 		  to live on /.  128-512M should be sufficient, it's
> 		  temporary space after all.

More -- especially with quotas.  Sometimes people have to
download CD-Rom Images (e.g. .iso) and might be unable to put
them into /home.

Speaking of it -- /home probably wants a partition, too; and
regular backups.

-Wolfgang
