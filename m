Message-ID: <010901c2ba33$d3e5daf0$0f00a8c0@COMPAQ>
From: "Sean Oh" <oh@storageone.co.kr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [Q] LVM snapshot volume extendable?
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
Date: Sun Jan 12 06:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

I am using LVM 1.0.6, kernel 2.4.20 and XFS (from linux-2.4-xfs CVS).

My question is that is the snapshot volume extendable?

My environment is as follows:

/dev/vg01/lv01 ---> XFS, 2G
/dev/vg01/lv01_snap --> 256M, snapshot for /dev/vg01/lv01, mounted under
/snap with ro,nouuid,usrquota,grpquota,noatime

Now I have wrote a small shell scripts that if lv01_snap is more than 50%
full, automatically increase the lv01_snap. But it seems to me that it does
not work well..

What I did in the shell scripts are 'lvextend -L+256M /dev/vg01/lv01_snap'
with/without 'xfs_growfs /snap'.

After umounting the /snap and trying to remount /snap, it complaints as
below

XFS: recovery required required on read-only device
XFS: write access unavailabe, cannot proceed
XFS: log mount/recovery failed
XFS: log mount failed
mount: wrong fs type, bad option, bad superblock on /dev/vg01/lv01,
       or too many mounted file systems
       (aren't you trying to mount an extended partition,
       instead of some logical partition inside?)

BTW, extending the original lv01 works fine with lvextend and xfs_growfs.

Could someone please help?

Thanks in advance
