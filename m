Date: Fri, 28 Sep 2001 16:33:20 +0200 (MEST)
From: Henk Birkholz <wahooka@Informatik.Uni-Bremen.DE>
Message-ID: <Pine.LNX.4.33.0109281622510.28332-100000@x02.informatik.uni-bremen.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvm-1.0-2.4.10.patch - Critical??
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Good evening,

i aplied the lvm-1.0-2.4.10.patch to my kernel (2.4.10) and tried to
compile. The result was :

/usr/src/linux-2.4.10/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `lvm_blk_ioctl':
drivers/md/mddev.o(.text+0xc27): undefined reference to
`get_hardblocksize'
drivers/md/mddev.o: In function `__update_hardsectsize':
drivers/md/mddev.o(.text+0x2701): undefined reference to
`get_hardblocksize'
drivers/md/mddev.o(.text+0x274d): undefined reference to
`get_hardblocksize'
make: *** [vmlinux] Error 1

i replaced the 3 get_hardblocksize() with get_hardsect_size()

So it compiles smoothly now. But was that the right solution?

The system is going to run in production enviroment with a large amount
of data, which i cannot backup whole. I habe only one try.

The current LVM was build with 2.4.9 and runs well.

But i have to switch to 2.4.10 because of the bad memory management of
2.4.9 as soon as possible.

I'll be glad for comments. Thanks

Henk Birkholz
