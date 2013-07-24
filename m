Date: Tue, 23 Jul 2013 22:32:06 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <alpine.LRH.2.02.1307232206450.6682@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] insufficient cleanin in lvcreate
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Alasdair G. Kergon" <agk@redhat.com>
Cc: linux-lvm@redhat.com

Hi

There is a bug in lvm, it clears the newly created logical volume 
insufficiently.


What actually happened to me:

I created a few linear logical volumes with lvcreate ("lvcreate -L 32m 
vg1"). The weird thing was that the volumes were open after creation, 
although I didn't run any command that would open them:
lvol0 vg1 -wi-ao--- 32,00m
lvol1 vg1 -wi-ao--- 32,00m
lvol2 vg1 -wi-ao--- 32,00m 
lvol3 vg1 -wi-ao--- 32,00m

I couldn't mount the volumes (it said that they are already mounted):
mount: /dev/mapper/vg1-lvol0 already mounted or /mnt/test busy

I couldn't delete the logical volumes (because they were open).

I rebooted the machine, on next reboot the bug occured again and the 
logical volumes were open again.

I tried to use fuser to find out what process keeps the logical volumes 
open, but there was none. I changed to single user mode and killed all 
daemons, but the logical volumes were still open.

I suspected a file handle leak in the kernel, I added stacktrace to the 
kernel to find out what kernel subsystem actually opened the logical 
volume - and found, it was md.


What really happened - lvm is supposed to clear filesystem superblocks and 
md superblocks when a logical volume is created, but it cleared the newly 
created logical volume insufficiently and left out a md superblock at 
sector 8. The md superblock was left out there in the unallocated part of 
the physical volume from some of my previous experiments. Some daemon in 
RHEL6 found that a newly created logical volume has a md superblock and 
activated it with mdadm.

This bug could have quite serious consequences, the administrator creates 
a logical volume with lvcreate, the volume is open, unmountable and 
undeletable, the administrator has no way to find out what keeps the 
volume open (fuser displays nothing). There is nothing that would suggest 
to the administrator that the volume is open by md.

I placed a script to reproduce this bug at 
http://people.redhat.com/~mpatocka/testcases/insufficient-cleaning/ - 
download both files, set "vg" variable in the script to some real volume 
group on the system and run the script. When the script finishes, the 
logical volume is open, unmountable and undeletable.

Mikulas
