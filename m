Message-ID: <3FC5F552.A494A0AA@in.ibm.com>
From: Sachin Sant <sachinp@in.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvchange -r 256 lv-name does not work
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
Date: Thu Nov 27 07:48:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi , i came across a problem with lvchange command.

I have a VG with 3 pv and a lv created using command 

lvcreate -i3 -I32 -l98 -nmy_lv my_vg
lvdisplay shows 1024 as the value for Read Ahead Sectors.

When i use the command lvchange to change the value of read ahead
sector with value more that or equal to 256 i get following error..

linux# lvchange -r 340 /dev/my_vg/my_lv
lvchange -- ERROR "Invalid Argument" read ahead sector change
linux#
linux#

After debugging i found that in drivers/block/blkpg.c file blk_ioctl( )

Case BLKRASET :

	if (arg > 0xff )
		return -EINVAL;

Effectively this does not allow value greater that 255 for read ahead.
Is there a limitation that the read ahead sectors can't have value more
than 255 ? If yes then why lvdisplay shows 1024 as the default value for
read ahead sectors.

Thanks
-Sachin
