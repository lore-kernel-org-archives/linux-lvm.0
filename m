Return-Path: <alec@korn.ch>
Message-ID: <3B1BD4B8.A2C1E9A2@korn.ch>
Date: Mon, 04 Jun 2001 19:34:32 +0100
From: Alec Thomas <alec@korn.ch>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem with pvmove
References: <Pine.LNX.4.33.0106041511030.21223-100000@dell.bas-net.by>
Content-Transfer-Encoding: 7bit
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

I see this same behaviour on my system. 

It's only the last block that appears to cause problems.

Intel, linux-2.4.5 + reiserfs-knfsd + reiserfs-quota
LVM-0.9.1-beta7

root@dell.bas-net.by wrote:
> 
> Hi
> 
> Error was discovered.
> pvmove says 'Error reading physical drive' while 'dd if=DEVICE
> of=/dev/null' works fine.
> 
> Intel linux-2.4.4
> LVM-0.9.1-beta7
> 
> --------------- pvdisplay
> PV Name               /dev/ide/host0/bus0/target0/lun0/part8
> VG Name               spool1
> PV Size               3.91 GB / NOT usable 3.98 MB [LVM: 124 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              999
> Free PE               998
> Allocated PE          1
> PV UUID               6kNzfK-NAjH-pLEQ-ObKD-FwZl-H6HR-EDJk4a
>    --- Distribution of physical volume ---
>    LV Name                   LE of LV  PE for LV
>    /dev/spool1/articles      1840      1
> 
>    --- Physical extents ---
>    PE    LV                        LE      Disk sector
>    00000 free
>    .....
>    00997 free
>    00998 /dev/spool1/articles      00873   8183761
> 
> -----------
> 
> pvmove -fdv /dev/ide/host0/bus0/target0/lun0/part8
> 
> <1> lvm_get_col_numbers -- CALLED
> <1> lvm_get_col_numbers -- LEAVING
> <1> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part8"
> <22> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <1> pv_check_name -- LEAVING with ret: 0
----------- output cut ------------
> pvmove -- reading data of source physical volume from "/dev/ide/host0/bus0/target0/lun0/part8"
> pvmove -- checking volume group existence
> pvmove -- reading data of volume group "spool1" from lvmtab
> pvmove -- checking volume group consistency of "spool1"
> pvmove -- searching for source physical volume "/dev/ide/host0/bus0/target0/lun0/part8" in volume group "spool1"
> pvmove -- building list of possible destination physical volumes
> pvmove -- checking volume group activity
> pvmove -- moving physical extents in active volume group "spool1"
> pvmove -- starting to move extents away from physical volume "/dev/ide/host0/bus0/target0/lun0/part8"
> pvmove -- checking for enough free physical extents in "spool1"
> pvmove -- /dev/ide/host0/bus0/target0/lun0/part8 [PE 998 [articles [LE 873]] -> /dev/scsi/host0/bus0/target1/lun0/disc [PE 583] [1/1]
> -------------------
> 
> another bug is when I move to nearly full PV, last PE of destination is
> 'BAD' (error wriing)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
