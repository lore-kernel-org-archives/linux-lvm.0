From: Rich Turner <rich@storix.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1049829705.2312.16.camel@rich>
Mime-Version: 1.0
Subject: [linux-lvm] lvm/devfs bug?
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
Date: Tue Apr  8 14:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

i am trying to create a physical volume using the entire disk /dev/sda1
and pvcreate is complaining that there is a partition table on the disk
when in fact there isnt.

# pvcreate -ff -v /dev/sda1
pvcreate --device "/dev/sda" has a partition table

i have tried many different things:
# dd if=/dev/zero of=/dev/sda bs=1024 count=10
# blockdev --rereadpt /dev/sda

# sfdisk -R /dev/sda1

i am able to confirm that /proc/partitions does not have a partition
entry for the disk but pvcreate still fails. i am using a devfs kernel
so i thought there might be some strange behavior between lvm and devfs.
is there a fix or known issues regarding lvm and devfs?
