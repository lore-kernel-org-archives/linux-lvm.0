From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM Problem, VGs vanished (??) Need urgent help!
Message-Id: <20020304110740.B10007@sistina.com>
References: <000a01c1c1dc$393ed6f0$0100a8c0@japanair>
MIME-Version: 1.0
In-Reply-To: <000a01c1c1dc$393ed6f0$0100a8c0@japanair>; from
    ileukens@t-online.de on Sat, Mar 02, 2002 at 12:20:13PM +0100
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
Date: Mon Mar  4 04:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ile,

pvscan seems to find PV dentifiers on /dev/hd[gh] rather than on
/dev/hd[gh]1 where you expect them even though lvmdiskscan sees the
LVM partitions correctly.
Very strange.

Plese send me the output of

for d in /dev/hd[gh] /dev/hd[gh]1
do
   dd if=$d of=$(basename $d).vgda bs=1k count=4k
done

attached in private email to mge@sistina.com for further investigation.

Regards,
Heinz    -- The LVM Guy --


On Sat, Mar 02, 2002 at 12:20:13PM +0100, ile wrote:
> Hi,
> i have a serious problem with my LVM (Suse 7.3).
> I used to have 2 VGs (ROOT and TAN) 
> ROOT consisted of /hda1 /hdf1
> TAN consisted of /hdh1 /hdg1
> 
> There was (hopefully still is) data on both VG.
> Now the problem: I put in a new HD yesterday. Reboot. No VGs found anymore. All xxscan commands doesnt find any proof of the VGs. Well, i thought just put the new HD out and everything is ok, but without the new HD the situation is still the same.
> The new HD was put alone on a cable. I didnt change anything in the system while the new HD was connected.
> The system doesnt find a partition on hda now, dunno why. But everything on VG TAN should work since there is no evidence of any failure happened to hdg1 or hdh1. The system worked perfect for the last 2 weeks.
> Now i dunno what to do anymore, since i dont want to loose any data on TAN (the root part is not that important). I would appreciate any help.
> 
> Regards
> Jim
> 
> 
> Situation now:
> >lvmdiskscan
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/sda1 [      23.50 MB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/sda2 [     133.35 MB] Primary  LINUX swap partition [0x82]
> lvmdiskscan -- /dev/sda3 [       1.86 GB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hdg1 [      57.25 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdh1 [      57.25 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hde1 [      76.34 GB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hdf1 [      74.53 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hda  [      76.34 GB] free whole disk
> lvmdiskscan -- 6 disks
> lvmdiskscan -- 1 whole disk
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 7 partitions
> lvmdiskscan -- 3 LVM physical volume partitions
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdg"  is in no VG  [8.00 GB]
> pvscan -- inactive PV "/dev/hdh"  is in no VG  [8.00 GB]
> pvscan -- inactive PV "/dev/hdf1" of VG "ROOT" [74.52 GB / 0 free]
> pvscan -- total: 3 [90.53 GB] / in use: 1 [74.53 GB] / in no VG: 2 [16.00 GB]
> 
> pvdisplay /dev/hdf1
> --- Physical volume ---
> PV Name               /dev/hdf1
> VG Name               ROOT
> PV Size               74.53 GB / NOT usable 7.05 MB [LVM: 198.00 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              19078
> Free PE               0
> Allocated PE          19078
> PV UUID               bmUZpk-p2Zd-GvxZ-IRfd-k0TA-B79z-iJKxGv
> 
> pvdisplay on all discs but hdf1 looks like this:
> pvdisplay -- no physical volume identifier on "/dev/hdh1"
> 
> Partition check:
>  hda:
>  hde: hde1
>  hdf: hdf1
>  hdg: hdg1
>  hdh: hdh1
> 
> If anyone needs more information i would be glad to give it to you.
> 
> 

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
