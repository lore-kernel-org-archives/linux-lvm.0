Message-ID: <4CEA4D87.7050600@redhat.com>
Date: Mon, 22 Nov 2010 11:01:27 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4CE7CC41.9060401@arial-concept.com>
In-Reply-To: <4CE7CC41.9060401@arial-concept.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Corrupted physical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Sam Przyswa <samp@arial-concept.com>

On 11/20/2010 01:25 PM, Sam Przyswa wrote:
> Hi,
> 
> For the first time I have a problem after remove a physical volume with 
> the command "pvremove". the partition was /dev/sdb4 and after the 
> "pvremove /dev/sdb4" command I got an error and the pvdisplay give me:
> 
> -------------------------------------------------------
> Couldn't find device with uuid '2KFcH6-vX6o-2olV-CuAN-iSbQ-HwOz-SKlkoe'.
>    --- Physical volume ---
>    PV Name               unknown device
>    VG Name               Disk1
>    PV Size               127,63 GiB / not usable 874,50 KiB
>    Allocatable           yes
>    PE Size               4,00 MiB
>    Total PE              32673
>    Free PE               32673
>    Allocated PE          0
>    PV UUID               2KFcH6-vX6o-2olV-CuAN-iSbQ-HwOz-SKlkoe
> 
> -------------------------------------------------------
> 
> How to fix it ?
> 
> It seems I have an other PV corrupted, is it a way to restore/fix a LVM 
> with a tool as fsck for filesystems ?

It looks like you ran pvremove while the PV was in a volume group:

>    VG Name               Disk1

So the PV is still known to the system (as the UUID is still listed in the
metadata contained on the other devices) but it can no longer be found since the
label was erased with pvremove.

Normally the tools will refuse to do that unless you specify the "force" and
"yes" flags on the command line, e.g.:

# pvremove /dev/loop1
  Can't pvremove physical volume "/dev/loop1" of volume group "tvg0" without -ff

Even then you have to confirm it:

# pvremove -ff /dev/loop1
Really WIPE LABELS from physical volume "/dev/loop1" of volume group "tvg0" [y/n]? y
  WARNING: Wiping physical volume label from /dev/loop1 of volume group "tvg0"
  Labels on physical volume "/dev/loop1" successfully wiped

# pvdisplay
  Couldn't find device with uuid xR7FMN-Ps9T-39mE-rq7h-ijek-PxmR-3emALh.
  --- Physical volume ---
  PV Name               unknown device
  VG Name               tvg0
  PV Size               64.00 MiB / not usable 4.00 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              15
  Free PE               15
  Allocated PE          0
  PV UUID               xR7FMN-Ps9T-39mE-rq7h-ijek-PxmR-3emALh

You can recover the VG easily though. Run pvcreate on the device giving it the
UUID of the missing disk (just make sure you run it on the correct device!).
You'll also want to find the most recent backup of the VG in the
/etc/lvm/archive directory.

First re-create the device, e.g.:

pvcreate --uuid=xR7FMN-Ps9T-39mE-rq7h-ijek-PxmR-3emALh /dev/loop1
--restorefile=/etc/lvm/archive/tvg0_00002.vg

The "--restorefile" is important to make sure the new PV is suitable for
restoring the metadata backup to.

Then restore the VG metadata:

vgcfgrestore -f /etc/lvm/archive/tvg0_00002.vg tvg0

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/loop1
  VG Name               tvg0
  PV Size               64.00 MiB / not usable 4.00 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              15
  Free PE               15
  Allocated PE          0
  PV UUID               xR7FMN-Ps9T-39mE-rq7h-ijek-PxmR-3emALh

Regards,
Bryn.
