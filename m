From: Rich Turner <rich@storix.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1042575714.1983.27.camel@rich.storix.com>
Mime-Version: 1.0
Subject: [linux-lvm] LVM bug
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
Date: Tue Jan 14 14:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

The following is a situation where LVM fails.

Previously, I installed a system and created a physical volume on an
entire disk. I am now re-installing the system and have created a
physical volume on a partition on the same disk. The partition was
created with sfdisk. I am able to create volume groups and logical
volumes with no problem.

The problem arises after a reboot of the system. vgscan fails to find
any volume groups. pvscan finds physical volumes on both the disk and
the partition. It appears LVM fails when creating a physical volume on a
partition of a disk when there was previously a physical volume on the
same entire disk.

Using LVM 1.0.1

Rich Turner
Storix Software
