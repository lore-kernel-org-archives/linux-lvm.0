Message-ID: <3BBC8B5B.1A484028@legis.state.ak.us>
Date: Thu, 04 Oct 2001 08:16:27 -0800
From: Bill Ellis <bill_ellis@legis.state.ak.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate fails on a software RAID metadisk
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm trying to set up lvm 1.01rc4 under a 2.4.10 kernel.  I'm getting an
error when I try to use pvcreate on a software RAID metadisk.  From the
'-v' output of pvcreate, it appears that pvcreate thinks my metadisk is
zero-length.

Here's an example:

root@tik-tok:~# pvcreate /dev/md7
pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md7"

root@tik-tok:~# pvcreate -v /dev/md7
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/md7"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/md7 with 0 sectors
pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md7"

root@tik-tok:~# pvcreate --version
pvcreate: Logical Volume Manager 1.0.1-rc4
Heinz Mauelshagen, Sistina Software  03/10/2001 (IOP 10)
root@tik-tok:~# cat /proc/mdstat | grep -A2 md7
md7 : active raid5 sde7[4] sdd7[3] sdc7[2] sdb7[1] sda7[0]
      24575488 blocks level 5, 128k chunk, algorithm 0 [5/5] [UUUUU]

root@tik-tok:~# grep md7 /proc/partitions
   9     7   24575488 md7

Any tips on what might be going on here would be appreciated...

Thanks,
Bill Ellis
