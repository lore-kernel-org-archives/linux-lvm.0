From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Can't rebuild LVM
Message-ID: <20021105150050.B27825@sistina.com>
References: <20021102184903.GA12075@sonsofthunder.yi.org>
Mime-Version: 1.0
In-Reply-To: <20021102184903.GA12075@sonsofthunder.yi.org>; from storm@tux.org on Sat, Nov 02, 2002 at 01:49:04PM -0500
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
Date: Tue Nov  5 08:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 02, 2002 at 01:49:04PM -0500, Bradley M Alexander wrote:
> Background: Norton utilities screwed up the partition table on one of my
> lvm drives. I tried a pvcreate -ff to recover but ended up losing the lvm
> partitions. I lost all of my partitions with the exception of /, /lib and
> /usr, so the system is still bootable and most of the system apps are still
> available. (I did lose /var, though the system has automagically recreated
> some of the directories). This is on a Debian/sid box running kernel 2.4.19
> and devfs.
> 
> The hardware allocated to pvs are /dev/hda3 (27GB), /dev/hdc (30GB) and
> /dev/hde (30GB).
> 
> I tried to create the pvs and got the following:
> 
> # pvcreate /dev/hda3
> modprobe: Can't locate module /dev/lvm
> modprobe: Can't locate module /dev/lvm
> modprobe: Can't locate module /dev/lvm
> modprobe: Can't locate module /dev/lvm
> modprobe: Can't locate module /dev/group
> pvcreate -- physical volume "/dev/hda3" successfully created
> 
> for subsequent creates (pvcreate /dev/hdc; pvcreate /dev/hde), I get a
> response of "modprobe: Can't locate module /dev/group"; both claim to be
> successfully created.

What does pvscan tell you after the successful pvcreate runs?

> 
> I then try to create the volume group:
> 
> # vgcreate vg00 /dev/ide/host0/bus0/target0/lun0/part3
> /dev/ide/host0/bus1/target0/lun0/disc /dev/ide/host2/bus0/target0/lun0/disc
> modprobe: Can't locate module /dev/vg00
> invalidate: Busy buffer
> vgcreate -- no valid physical volumes in command line
> 
> The other night, I attempted to rebuild and restore the system. It came up
> in single user, and after three hours of recreating volumes, partitions and
> restoring from backups, I tried to go to multiuser. It rebooted and the LVs
> disappeared.
> 
> LVM is compiled monilithically into the kernel rather than as modules.
> Since I have been running it for about a year, it is 1.0.1-rc4. I have the
> following questions:
> 
> 1. Why is modprobe getting these devices (/dev/vg00, /dev/lvm, etc) which
> it then cannot find?

/dev/lvm could be wrong.

Is it 
crw-r-----    1 root     root     109,   0 Nov  5 13:50 lvm
?

Are all filesystems you still have checked cleanly?

> 
> 2. Why is, after I rebuild the volume, it not persisting between reboots?
> 
> 3. What should I do to get these back permanently?

Could be caused by the above mentioned reasons.

> 
> 4. Would upgrading to 1.0.6 or even lvm2 help my situation?

Probably not, but you get other recent fixes with 1.0.6.
LVM2 supports LVM1 volume groups but misses pvmove so far.
You should definitely give it a try.

> 
> Can someone please help me get my system back to being operational?
> 
> Thanks,
> --Brad
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
