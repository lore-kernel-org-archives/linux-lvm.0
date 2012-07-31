Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6V6wdJo031358
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 02:58:39 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6V6wb2G002182
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 02:58:38 -0400
Message-ID: <50178222.7030709@profihost.ag>
Date: Tue, 31 Jul 2012 08:58:42 +0200
From: Stefan Priebe <s.priebe@profihost.ag>
MIME-Version: 1.0
References: <5016DD33.3050000@profihost.ag>
	<alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
	<5016F258.9060206@profihost.ag> <501700E1.4040708@bmsi.com>
In-Reply-To: <501700E1.4040708@bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to online resize pv?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stuart D Gathman <stuart@bmsi.com>
Cc: linux-lvm@redhat.com

this does not work for me.

no partition table on vda:

# parted -l
Model: Linux device-mapper (linear) (dm)
Disk /dev/mapper/system-root: 21,5GB
Sector size (logical/physical): 512B/512B
Partition Table: loop

Number  Start  End     Size    File system  Flags
  1      0,00B  21,5GB  21,5GB  xfs


Model: Linux device-mapper (linear) (dm)
Disk /dev/mapper/system-boot: 210MB
Sector size (logical/physical): 512B/512B
Partition Table: loop

Number  Start  End    Size   File system  Flags
  1      0,00B  210MB  210MB  ext2


Error: /dev/vda: unrecognised disk label

# grub-install /dev/vda
/usr/sbin/grub-setup: error: unable to identify a filesystem in hd0; 
safety check can't be performed.

sure as there is no filesystem on sda.

Greets
Stefan

Am 30.07.2012 23:47, schrieb Stuart D Gathman:
> On 07/30/2012 04:45 PM, Stefan Priebe expounded in part:
>>
>>> Only when no partition is open.  That is one reason why LVM is an
>>> improvement over partition tables.  You don't have to use a partition
>>> table, just use the entire device as a PV.
>>
>>
>> that was my idea too but grub2 then refuses to install onto /dev/vda.
>> It says it cannot find a filesystem on hd0 which is /dev/vda.
> Grub2 supports LV boot partition now.  Most distro installers do not
> support this by default, however.  I set up my wife's laptop to boot
> from LV.  Here is an outline:
>
> http://forums.fedoraforum.org/showthread.php?t=264174
>
> The key line is adding GRUB_PRELOAD_MODULES=lvm so that grub can find
> the LV.  If your installer doesn't support it, you have to create the
> LVs, and copy filesystems from an installed system on another drive,
> then run grub2-install.
>
> I haven't tried Fedora 17 installer, to see if it can install grub2 with
> no partition table.
