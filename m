From: Tren Blackburn <tren@EOTnetworks.com>
Message-ID: <Pine.LNX.4.33.0110291101360.9045-100000@EOTnetworks.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problems compiling LVM 1.0.1rc4 and kernel 2.4.13-ac4
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
Date: Mon Oct 29 12:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi list;

Not sure if this has been asked/solved yet.  I searched through the lists
and found
http://lists.sistina.com/pipermail/linux-lvm/2001-October/009353.html
however, what was stated in this message thread didn't seem to solve this
problem.  I'm getting these errors when linking the kernel:

drivers/md/mddev.o: In function `lvm_init':
drivers/md/mddev.o(.text+0x8352): undefined reference to `gendisk_head'
drivers/md/mddev.o(.text+0x83c9): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `lvm_cleanup':
drivers/md/mddev.o(.text+0x8459): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `lvm_snapshot_alloc':
drivers/md/mddev.o(.text+0xd221): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xd262): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xd29a): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xd2ce): undefined reference to `free_kiovec'
drivers/md/mddev.o: In function `lvm_snapshot_release':
drivers/md/mddev.o(.text+0xd365): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xd39a): undefined reference to `free_kiovec'

Any ideas/recommendations of what to do?

Thanks,

Tren.

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
- Tren Blackburn - Owner                mailto:tren@eotnetworks.com  =
= EOT Networks                           http://www.eotnetworks.com  -
- Infinite Solutions for a Finite World              (403) 818-7658  =
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
