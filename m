Message-ID: <OF812C20AD.43539AFD-ON48256BC9.0028280B@legend.com.cn>
MIME-Version: 1.0
From: lilha@legend.com.cn
Subject: [linux-lvm] Re: md and lvm
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
Date: Thu May 30 03:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: bluca@comedia.it







On Thu, May 30, 2002 at 09:44:27AM +0800, lilha@legend.com.cn wrote:
> i try extend a LV with md, but failed,why?
> Can a LV of md extend ?
> follow is my VG information.

> [root@snap /root]# cat /proc/mdstat
> Personalities : [linear] [raid0] [raid1] [raid5] [multipath]
> read_ahead 1024 sectors
> md1 : active raid1 hda9[1]
>       272960 blocks [2/1] [_U]
is this a bad disk???


yes. md1 is bad, but I have delete the inforamtion about md1 in the file
(/etc/raidtab)
and change the partition type to 83.
after reboot the machine, i change the partion type to FD, and reboot
again.
I dont't know why the md1 still can be find and how to delete it.


> md2 : active raid5 hda12[2] hda11[1] hda10[0]
>       1638400 blocks level 5, 32k chunk, algorithm 0 [3/3] [UUU]
>
> md4 : active raid5 hdc7[2] hdc6[1] hdc5[0]
>       1023872 blocks level 5, 32k chunk, algorithm 0 [3/3] [UUU]
raid 5 on the same disk (cool!)

i just want to test whether a LV with MD can be extend or not, so i don't c
are the performance

> and now is the error information(i didn't use lvextend before):
>
> [root@snap /root]# e2fsadm -L+1G /dev/raid-lvm/lv_raid
> e2fsck 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
> The filesystem size (according to the superblock) is 338944 blocks
> The physical size of the device is 236544 blocks
> Either the superblock or the partition table is likely to be corrupt!
> Abort<y>? no
seems you have some problem with the filesystem in /dev/raid-lvm/lv_raid
did you play at reducing it before?


yes, i use lvextend to extend it and then use lvreduce to reduce it, at
last i use
e2fsadm -L+1G /dev/raid-lvm/lv_raid

i think the lvextend and lvreduce are no effect for e2fsadm
thougt e2fsadm = lvextend then resize2fs if extending or resize2fs then
lvreduce if shrinking
Is it right? i don't know why it can't work.

And now I mkfs the lv and use "e2fsadm -L+1G /dev/raid-lvm/lv_raid"
it works well.

thanks for your help,but i still puzzled why it can't work. Can you help
me?
