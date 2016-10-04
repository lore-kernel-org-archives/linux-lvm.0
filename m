Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u949jbgO022327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 4 Oct 2016 05:45:37 -0400
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D15EB66CBB
	for <linux-lvm@redhat.com>; Tue,  4 Oct 2016 09:45:35 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o68so45873517qkf.3
	for <linux-lvm@redhat.com>; Tue, 04 Oct 2016 02:45:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Tue, 4 Oct 2016 10:45:14 +0100
Message-ID: <CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
Subject: Re: [linux-lvm] LVM RAID5 out-of-sync recovery
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Before anything else, I would have suggested backing up the image and
meta sub LVs, but it looks like you are just testing.

Clear down any odd state with dmsetup remove /dev/vg/... and then run:

vgextend --restoremissing

Actually, always run LVM commands with -v -t before really running them.

On 4 October 2016 at 00:49, Slava Prisivko <vprisivko@gmail.com> wrote:
> In order to mitigate cross-posting, here's the original question on
> Serverfault.SE: LVM RAID5 out-of-sync recovery, but feel free to answer
> wherever you deem appropriate.
>
> How can one recover from an LVM RAID5 out-of-sync?

I suppose it's supposed to recover mostly automatically.
*If* your array is assembled (or whatever the LVM-equivalent
termiology is) then you can force a given subset of PVs to be
resynced.
http://man7.org/linux/man-pages/man8/lvchange.8.html - look for rebuild
However, this does not seem to be your problem.

> I have an LVM RAID5 configuration (RAID5 using the LVM tools).
>
> However, because of a technical problem mirrors went out of sync. You can
> reproduce this as explained in this Unix & Linux question:
>
>> Playing with my Jessie VM, I disconnected (virtually) one disk. That
>> worked, the machine stayed running. lvs, though, gave no indication the
>> arrays were degraded.

You should have noticed something in the kernel logs. Also, lvs should
have reported that the array was now (p)artial.

>> I re-attached the disk, and removed a second. Stayed
>> running (this is raid6). Re-attached, still no indication from lvs. I ran
>> lvconvert --repair on the volume, it told me it was OK. Then I pulled a
>> third disk... and the machine died. Re-inserted it, rebooted, and am now
>> unsure how to fix.

So this is RAID6 rather than RAID5?
And you killed 3 disks in a RAID 6 array?

> If I had been using mdadm, I could have probably recovered the data using
> `mdadm --force --assemble`, but I was not able to achieve the same using the
> LVM tools.

LVM is very different. :-(

> I have tried to concatenate rmeta and rimage for each mirror and put them on
> three linear devices in order to feed them to the mdadm (because LVM
> leverages MD), but without success (`mdadm --examine` does not recognize the
> superblock), because it appears that the mdadm superblock format differs
> from the dm_raid superblock format (search for the "dm_raid_superblock").

Not only that, but (as far as I can tell), LVM RAID 6 parity (well,
syndrome) is calculated in a different manner to the older mdadm RAID;
it uses an industry-standard layout instead of the (more obvious?) md
layout.
I wrote a utility to parity-check the default LVM RAID6 layout with
the usual stripe size (easily adjusted) here:
https://drive.google.com/open?id=0B8dHrWSoVcaDbkY3WmkxSmpfSVE

You can use this to see to what degree the data in the image LVs are
in fact in/out of sync. I've not attempted to add sync functionality
to this.

> I tried to understand how device-mapper RAID leverages MD, but was unable to
> find any documentation while the kernel code is quite complicated.
>
> I also tried to rebuild the mirror directly by using `dmsetup`, but it can't
> rebuild if metadata is out of sync.
>
> Overall, almost the only useful information I could find is RAIDing with LVM
> vs MDRAID - pros and cons? question on Unix & Linux SE.

Well, I would read through this as well (versions 6 and 7 also available):
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7-Beta/html/Logical_Volume_Manager_Administration/index.html

> The output of various commands is provided below.
>
>     # lvs -a -o +devices
>
>     test                           vg   rwi---r---  64.00m
> test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)
>     [test_rimage_0]                vg   Iwi-a-r-r-  32.00m /dev/sdc2(1)
>     [test_rimage_1]                vg   Iwi-a-r-r-  32.00m /dev/sda2(238244)
>     [test_rimage_2]                vg   Iwi-a-r-r-  32.00m /dev/sdb2(148612)
>     [test_rmeta_0]                 vg   ewi-a-r-r-   4.00m /dev/sdc2(0)
>     [test_rmeta_1]                 vg   ewi-a-r-r-   4.00m /dev/sda2(238243)
>     [test_rmeta_2]                 vg   ewi-a-r-r-   4.00m /dev/sdb2(148611)
>
> I cannot activate the LV:
>
>     # lvchange -ay vg/test -v
>         Activating logical volume "test" exclusively.
>         activation/volume_list configuration setting not defined: Checking
> only host tags for vg/test.
>         Loading vg-test_rmeta_0 table (253:35)
>         Suppressed vg-test_rmeta_0 (253:35) identical table reload.
>         Loading vg-test_rimage_0 table (253:36)
>         Suppressed vg-test_rimage_0 (253:36) identical table reload.
>         Loading vg-test_rmeta_1 table (253:37)
>         Suppressed vg-test_rmeta_1 (253:37) identical table reload.
>         Loading vg-test_rimage_1 table (253:38)
>         Suppressed vg-test_rimage_1 (253:38) identical table reload.
>         Loading vg-test_rmeta_2 table (253:39)
>         Suppressed vg-test_rmeta_2 (253:39) identical table reload.
>         Loading vg-test_rimage_2 table (253:40)
>         Suppressed vg-test_rimage_2 (253:40) identical table reload.
>         Creating vg-test
>         Loading vg-test table (253:87)
>       device-mapper: reload ioctl on (253:87) failed: Invalid argument
>         Removing vg-test (253:87)
>
> While trying to activate I'm getting the following in the dmesg:
>
>     device-mapper: table: 253:87: raid: Cannot change device positions in
> RAID array
>     device-mapper: ioctl: error adding target to table

That's a new error message to me. I would try clearing out the dm
table (dmsetup remove /dev/vg/test_*) before trying again (-v -t,
first).

> lvconvert only works on active LVs:
>     # lvconvert --repair vg/test
>       vg/test must be active to perform this operation.

And it requires new PVs ("replacement drives") to put the subLVs on.
It's probably not what you want.

> I have the following LVM version:
>
>     # lvm version
>       LVM version:     2.02.145(2) (2016-03-04)
>       Library version: 1.02.119 (2016-03-04)
>       Driver version:  4.34.0

I would update LVM to whatever is in Debian testing as there has been
a fair bit of change this year.

> And the following kernel version:
>
>     Linux server 4.4.8-hardened-r1-1 #1 SMP

More useful would be the contents of /etc/lvm/backup/vg and the output
of vgs and pvs.
