From: "Ben Holness" <ben@bens-house.org.uk>
Message-Id: <000201c18c33$1ee48cc0$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate problems - can't find partition
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
Date: Sun Dec 23 22:23:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I am in the process of trying to set up LVM on my machine and I am having
some difficulty. I have had a look in the mailing list archives and in
Google groups, but haven't had any luck (although there is one foreign
language post in Google that looks to be the right question and an answer,
but I can't read that language!!!)

I have a 60Gb Hard disk, partitioned as follows:

Note: I am a little worried about the fact that fdisk shows 240/63/7753,
when on my hard disk label it says 16/63/16383, but the sizes look right.
The machine is a Compaq Deskpro.

[root@firewall root]# fdisk -l

Disk /dev/ide/host0/bus0/target0/lun0/disc: 240 heads, 63 sectors, 7753
cylinders
Units = cylinders of 15120 * 512 bytes

                                Device Boot    Start       End    Blocks
Id  System
				/dev/ide/host0/bus0/target0/lun0/part1   *         1         2
15088+  83  Linux
				/dev/ide/host0/bus0/target0/lun0/part2             3       371   2789640
5  Extended
				/dev/ide/host0/bus0/target0/lun0/part4           372      7753  55807920
8e  Linux LVM
				/dev/ide/host0/bus0/target0/lun0/part5             3        35
249448+  82  Linux swap
				/dev/ide/host0/bus0/target0/lun0/part6            36       371
2540128+  83  Linux

hda1 (part1) mounts to /boot and hda6 (part 6) mounts to /
I have created hda4 (part4) to be the partition that is managed as a logical
volume, but when I try to pvcreate, I get:

[root@firewall root]# pvcreate -v /dev/hda4
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/hda4"
pvcreate -- getting physical volume size
pvcreate -- device "/dev/hda4" doesn't exist

I have tried this when the partition is unformatted and after a mke2fs and I
get the same results.

Running Mandrake 8.1 and lvm-0.9-2mdk (rpm from the Mandrake disc)

Please can anyone tell me what I am missing? I have followed the mini-howto
from linuxdocs and then I had a look at the howto on the sistina site, but
have had no luck...

Cheers,

Ben

Other things of relevance (?):

[root@firewall root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

[root@firewall root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volumes
