From: richard turner <rturner@san.rr.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1041879412.1048.11.camel@rich-laptop>
Mime-Version: 1.0
Subject: [linux-lvm] pvcreate error
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
Date: Mon Jan  6 12:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

i am trying to create a physical volume on /dev/hdb using:
pvcreate -ff -y /dev/hdb

the following error is generated:
pvcreate -- device "/dev/hdb" has a partition table

my understanding is that pvcreate looks in /proc/partitions for
partition information. currently /proc/partitions does not show any
partitions for hdb (target1). i have tried:
dd if=/dev/zero of=/dev/hdb bs=1k count=1
blockdev --rereadpt /dev/hdb

nothing indicates that there is a partition table on /dev/hdb, however
pvcreate is still detecting one.

i am using lvm 1.0.1. is this a known issue with version 1.0.1? is there
something i am missing that pvcreate is detecting?
