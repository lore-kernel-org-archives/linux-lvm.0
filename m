From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcfgrestore error !
Message-ID: <20011119125632.A12388@sistina.com>
References: <3BF8E5DE.ABAEB618@LTUtech.com>
Mime-Version: 1.0
In-Reply-To: <3BF8E5DE.ABAEB618@LTUtech.com>; from Igor.Dumaire@LTUtech.com on Mon, Nov 19, 2001 at 11:58:38AM +0100
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
Date: Mon Nov 19 06:02:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Igor,

you need to figure out, which Physical Volumes (PVs) belong to your VG lvm1
by running 'vgcfgrestore -ll -n lvm1'. Please check for the PV list at
the end of the output.

Then restore the LVM metadata by running 'vgcfgrestore -n lvm1 /dev/hdWhatever`
on every of those.
Afterwards run 'vgscan;vgchange -ay lvm1', which should revive lvm1.

What error happend in the first place causing lvm1 to disapear?
Do you use recent LVM software?

Regards,
Heinz    -- The LVM Guy --


On Mon, Nov 19, 2001 at 11:58:38AM +0100, Igor Dumaire wrote:
> Hi,
> 
> After a reboot I have lost a volume (/dev/lvm1) but not an other (/dev/lvm2)
> (vgscan doesn't see lvm1 !)
> 
> I am trying to restore it, using vgcfgrestore, but I have the message below :
> 
> # vgcfgrestore -n lvm1 /dev/lvm1
> vgcfgrestore -- can't restore part of active volume group "lvm1"
> vgcfgrestore [-d|--debug] [-f|--file VGConfPath] [-l[l]|--list [--list]]
>         [-n|--name VolumeGroupName] [-h|--help]
>         [-o|--oldpath OldPhysicalVolumePath] [-t|--test] [-v|--verbose]
>         [--version] [PhysicalVolumePath]
> 
> # vgcfgrestore -n lvm1 /dev/lvmOLD
> vgcfgrestore -- invalid physical volume "/dev/lvmOLD"
> vgcfgrestore [-d|--debug] [-f|--file VGConfPath] [-l[l]|--list [--list]]
>         [-n|--name VolumeGroupName] [-h|--help]
>         [-o|--oldpath OldPhysicalVolumePath] [-t|--test] [-v|--verbose]
>         [--version] [PhysicalVolumePath]
> 
> WHY this message !
> What do I do ?
> 
> # lvmdiskscan
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/hda1 [      70.57 MB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda2 [      19.07 GB] DOS extended partition [0x05]
> lvmdiskscan -- /dev/hda5 [       2.01 GB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda6 [       1.00 GB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda7 [       1.00 GB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda8 [     517.69 MB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda9 [      14.55 GB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hdc1 [      57.27 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdd1 [      57.27 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hde1 [      57.27 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdf1 [      57.27 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdg1 [      57.27 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdh1 [      57.27 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- 7 disks
> lvmdiskscan -- 0 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 13 partitions
> lvmdiskscan -- 6 LVM physical volume partitions
> 
> # vgdisplay
> --- Volume group ---
> VG Name               lvm2
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                255
> Cur LV                1
> Open LV               1
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                3
> Act PV                3
> VG Size               171.79 GB
> PE Size               4.00 MB
> Total PE              43977
> Alloc PE / Size       43776 / 171.00 GB
> Free  PE / Size       201 / 804.00 MB
> VG UUID               Jp3gDv-ib7D-p5te-FFLZ-lNjI-5brK-fzjEM6
>  
> # vgdisplay lvm1
> vgdisplay -- volume group "lvm1" not found
> 
> 
> Thanks for your help.
> 
> -- 
> Igor Dumaire
> 
> www.LTUtech.com - Making Sense of Visual Content
> ------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
