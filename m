Subject: Re: [linux-lvm] not enough free/allocatable physical extents to e xtend logical vo lume
Mime-Version: 1.0 (Apple Message framework v552)
From: AJ Lewis <lewis@sistina.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <C6B0A1AF05B7A04E9D8E784173AE3D20163010@ausx2kmpc104.aus.amer.dell.com>
Message-Id: <8436ABA1-C294-11D7-B5B8-000393DC1896@sistina.com>
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
Date: Wed Jul 30 08:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

You cannot extend striped volumes past the end of the physical volumes 
they were originally created on in LVM1.  See
http://tldp.org/HOWTO/LVM-HOWTO/x140.html  - this limitation is 
addressed in LVM2.

On Wednesday, Jul 30, 2003, at 00:31 US/Central, 
Taylor_Carpenter@Dell.com wrote:

> [root]# lvextend -L +10G /dev/Scratch/Scratch /dev/sde1
> lvextend -- rounding size to stripe boundary size
> lvextend -- extending logical volume "/dev/Scratch/Scratch" to 111.02 
> GB
> lvextend -- not enough free/allocatable physical extents to extend 
> logical
> volume "/dev/Scratch/Scratch"
>
>
> I will try -l now.  Here is a disk already in the group.  It is an 
> identical
> disk.
>
>
> [root]# pvdisplay /dev/sdd1
> --- Physical volume ---
> PV Name               /dev/sdd1
> VG Name               Scratch
> PV Size               33.91 GB [71119692 secs] / NOT usable 4.19 MB 
> [LVM:
> 161 KB]
> PV#                   3
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              8680
> Free PE               60
> Allocated PE          8620
> PV UUID               S02n1R-lmdI-CU75-hMVp-gwxl-PAwk-dQiNP5
>
>
> I will use its allocated extent size for the new one
>
> lvextend -l +8620 /dev/Scratch/Scratch /dev/sde1
> lvextend -- rounding size to stripe boundary size
> lvextend -- extending logical volume "/dev/Scratch/Scratch" to 134.70 
> GB
> lvextend -- not enough free/allocatable physical extents to extend 
> logical
> volume "/dev/Scratch/Scratch"
>
> [root]# pvdisplay /dev/sde1
> --- Physical volume ---
> PV Name               /dev/sde1
> VG Name               Scratch
> PV Size               33.91 GB [71119692 secs] / NOT usable 4.19 MB 
> [LVM:
> 161 KB]
> PV#                   4
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              8680
> Free PE               8680
> Allocated PE          0
> PV UUID               x4xXPp-UXDb-fBfO-tnpb-E4HT-q8qJ-p5X6HT
>
> [root]# lvextend -l +7000 /dev/Scratch/Scratch /dev/sde1
> lvextend -- rounding size to stripe boundary size
> lvextend -- extending logical volume "/dev/Scratch/Scratch" to 128.37 
> GB
> lvextend -- not enough free/allocatable physical extents to extend 
> logical
> volume "/dev/Scratch/Scratch"
>
> The volume is using striping.  Is there some issue with that?  Do I 
> have to
> do some other steps to add the new disk so it is available?
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: 
lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint = D638 9C01 D08F 29A4 5D50  D064 F6A6 0ED6 E386 
E6EB
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...

665.9238429876 - Number of the Pentium Beast
