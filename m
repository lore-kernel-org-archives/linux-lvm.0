From: bscott@ntisys.com
Subject: Re: [linux-lvm] LVM newbie question.
In-Reply-To: <Pine.OSF.4.33.0207231638100.7125-100000@newt.phys.unsw.edu.au>
Message-ID: <Pine.LNX.4.44.0207231011280.24962-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Tue Jul 23 09:49:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 23 Jul 2002, at 4:49pm, Melinda Taylor wrote:
> When I do a pvcreate on say /dev/sda1 does that destroy all the existing
> data on that partition?

  Yes.

> Is there any advantage over [creating a PV on a partition vs a whole
> disk]?

  Not really.  Do whatever makes the most sense for your situation.

> One part of the how-to said converting a root system to LVM is not
> recommended.  SHould your OS directories /var / /boot etc all not be
> included in the LVM?

  Basically, to keep things simple, it is recommended that the boot and root
partition(s) not be placed on LVM.  This is because many boot/rescue/install
environments do not support LVM, making recovery from a boot failure
difficult to impossible.

  By placing / and /boot outside of LVM, you can repair them from just about
any boot/rescue/install set, and/or boot without LVM working.  Once you're
booted from the HDD in single-user mode, you can use the LVM utilities (in
/sbin) to get the rest of the system (on LVM) working.

> That was the main idea behind me implementing LVM so that specific
> partitions (say var) could be resized at a later date if needed.

  The system will typically boot with / mounted read-only.  Nothing else is
mounted, so if /var or /tmp or /usr or whatever are separate filesystem(s),
that is fine.  The system boot scripts (e.g., rc.sysinit) should start the
LVM and mount any needed filesystems.

> Will I have any trouble restoring my system (which I backed up using dd
> with a BS of 1024k)

  Using "dd" for backups is a bad idea.  Use a backup tool, such as "dump",
"cpio", or GNU "tar".

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
