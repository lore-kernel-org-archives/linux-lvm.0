Message-ID: <3BF19929.959A3055@phor.com>
From: Darin Perusich <Darin.Perusich@cognigencorp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 1.0.1-rc4 and kernel 2.4.14
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
Date: Tue Nov 13 16:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hello all,

i'm setting up LVM on a redhat 7.1 system with kernel 2.4.14. i'm able
to use pvcreate to setup either disks, /dev/sdb /dev/sdc or partitions,
/dev/sdb1 /dev/sdc1. vgcreate successfully creates the group and
activetes the volumes. when i do just about anything else it dumps core.
i'm running the command "lvcreate -L5G -ntestlv test", or "vgextend test
/dev/sdd" core dump. any of the *display, or vgremove commands run
without problem.

i've pretty much been following the how-to as i test LVM. i've compiled
lvm into the kernel, i'm not running it as a module. moving to a older
version of the kernel is not a problem, i just grap 2.4.14 since it's
the latest and the versions above 2.4.9 do not need
linux-2.4.*-VFS-lock.patch, all the filesystems on this machine are
reiserfs, except /boot. the box itself is an hp lp2000r, 2x933mhz chips,
2Gb ram, 4x18gb sca disks.

any pointers. 

-- 
Darin Perusich
Unix Systems Administrator
Cognigen Corp.
darinper@cognigencorp.com
