From: richard turner <rturner@san.rr.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1042568232.1081.42.camel@rich-laptop>
Mime-Version: 1.0
Subject: [linux-lvm] LVM and devfs, bug?
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
Date: Tue Jan 14 12:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm not sure if this is a bug but I suspect there needs to be some
clarification in regards to how LVM behaves with devfs.

I will describe my situation first. I am booting to a 2.4.19-16 kernel
(mandrake 9.0) with devfs enabled. I am using LVM version 1.0.3.

I boot to this kernel WITHOUT mounting or enabling devfs. I attempt to
create physical volume with the following command:
pvcreate -ff -y /dev/hdb

It returns the error:
pvcreate -- device "/dev/hdb" has a partition table

Here is my /proc/partitions:
22   0      15972   hdc
 3   0   20066251   ide/host0/bus0/target0/lun0/disc
 3   1     313267   ide/host0/bus0/target0/lun0/part1
 3   2     265072   ide/host0/bus0/target0/lun0/part2
 3   3          1   ide/host0/bus0/target0/lun0/part3
 3   5    3076416   ide/host0/bus0/target0/lun0/part5
 3  64   20066251   ide/host0/bus0/target1/lun0/disc

I then try to write zero's MBR:
dd if=/dev/zero of=/dev/hdb bs=512 count=1
blockdev --rereadpt /dev/hdb

It returns the same error:
pvcreate -- device "/dev/hdb" has a partition table

The bug, I believe, is that pvcreate is incorrectly stating that there
is a partition table on /dev/hdb. What I believe the error should return
is some sort of "file/device not found", because pvcreate will create
the physical volume if I create the
/dev/ide/host0/bus0/target1/lun0/disc file according to devfs naming.
The only way I am able to create a physical volume is into a partition,
not an entire disk.

There are other problems I am running into relating to LVM and devfs but
I am not currently able to clearly state what they are. Perhaps, a fix
of what I mentioned above will solve those issues also. Any help is
greatly appreciated.

Rich Turner
