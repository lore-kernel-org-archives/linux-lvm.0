Message-Id: <3.0.6.32.20011018204234.0094e290@mail.doorpi.net>
Date: Thu, 18 Oct 2001 20:42:34 -0500
From: Brent Harding <bharding@doorpi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] redhat 7.1 and lvm
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

	I found an rpm file in the ftp site of sistina.com for lvm. Do I still
need the sources for the kernel patch? I suppose if so, why have any rpm at
all, if I have the source, can just compile it, shrink my root partition,
migrate the system on to it, and make an initrd on the boot partition that
won't be in the lvm setup, since my system only uses boot and root, going
to dump the swap some how as I have 256 megs of ram, and don't need to
waste space on the six gig drive I'm using, before I use fips on my bigger
drive and add it in a volume group. I would just as well use lvm now while
I don't have much stuff to transfer rather than let the partition fill up
and then I can't do it.
