Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u95Cn6ca020775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 5 Oct 2016 08:49:06 -0400
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79724A0A49
	for <linux-lvm@redhat.com>; Wed,  5 Oct 2016 12:49:05 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id t7so217664346qkh.2
	for <linux-lvm@redhat.com>; Wed, 05 Oct 2016 05:49:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Wed, 5 Oct 2016 13:48:44 +0100
Message-ID: <CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
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

On 4 October 2016 at 23:14, Slava Prisivko <vprisivko@gmail.com> wrote:
>> vgextend --restoremissing
>
> I didn't have to, because all the PVs are present:
>
> # pvs
>   PV         VG Fmt  Attr PSize   PFree
>   /dev/sda2  vg lvm2 a--    1.82t   1.10t
>   /dev/sdb2  vg lvm2 a--    3.64t   1.42t
>   /dev/sdc2  vg lvm2 a--  931.51g 195.18g

Double-check in the metadata for MISSING. This is what I was hoping
might be in your /etc/lvm/backup file.

>> Actually, always run LVM commands with -v -t before really running them.
>
> Thanks! I had backed up the rmeta* and rimage*, so I didn't feel the need
> for using -t. Am I wrong?

Well, some nasty surprises may be avoidable (particularly if also using -f).

> Yes, I've noticed it. The problem was a faulty SATA cable (as I learned
> later), so when I switched the computer on for the first time, /dev/sda was
> missing (in the current device allocation). I switched off the computer,
> swapped the /dev/sda and /dev/sdb SATA cable (without thinking about the
> consequences) and switched it on. This time the /dev/sdb was missing. I
> replaced the faulty cable with a new one and switched the machine back on.
> This time sda, sdb and sdc were all present, but the RAID went out-of-sync.

In swapping the cables, you may have changed the sd{a,b,c} enumeration
but this will have no impact on the UUIDs that LVM uses to identify
the PVs.

> I'm pretty sure there were very few (if any) writing operations during the
> degraded operating mode, so the I could recover by rebuilding the old mirror
> (sda) using the more recent ones (sdb and sdc).

Agreed, based on your check below.

> Thanks, I used your raid5_parity_check.cc utility with the default stripe
> size (64 * 1024), but it actually doesn't matter since you're just
> calculating the total xor and the stripe size acts as a buffer size for
> that.

[I was little surprised to discover that RAID 6 works as a byte erasure code.]

The stripe size and layout matters once if you want to adapt the code
to extract or repair the data.

> I get three unsynced stripes out of 512 (32 mib / 64 kib), but I would like
> to try to reconstruct the test_rimage_1 using h the other two. Just in case,
> here are the bad stripe numbers: 16, 48, 49.

I've updated the utility (this is for raid5 = raid5_ls). Warning: not
tested on out-of-sync data.

https://drive.google.com/open?id=0B8dHrWSoVcaDYXlUWXEtZEMwX0E

# Assume the first sub LV has the out-of-date data and dump the
correct(ed) LV content.
./foo stripe $((64*1024)) repair 0 /dev/${lv}_rimage_* | cmp - /dev/${lv}

>> > The output of various commands is provided below.
>> >
>> >     # lvs -a -o +devices
>> >
>> >     test                           vg   rwi---r---  64.00m
>> > test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)
>> >     [test_rimage_0]                vg   Iwi-a-r-r-  32.00m /dev/sdc2(1)
>> >     [test_rimage_1]                vg   Iwi-a-r-r-  32.00m
>> > /dev/sda2(238244)
>> >     [test_rimage_2]                vg   Iwi-a-r-r-  32.00m
>> > /dev/sdb2(148612)
>> >     [test_rmeta_0]                 vg   ewi-a-r-r-   4.00m /dev/sdc2(0)
>> >     [test_rmeta_1]                 vg   ewi-a-r-r-   4.00m
>> > /dev/sda2(238243)
>> >     [test_rmeta_2]                 vg   ewi-a-r-r-   4.00m
>> > /dev/sdb2(148611)

The extra r(efresh) attributes suggest trying a resync operation which
may not be possible on inactive LV.
I missed that the RAID device is actually in the list.

> After cleaning the dmsetup table of test_* and trying to lvchange -ay I get
> practically the same:
> # lvchange -ay vg/test -v
[snip]
>   device-mapper: reload ioctl on (253:87) failed: Invalid argument
>     Removing vg-test (253:87)
>
> device-mapper: table: 253:87: raid: Cannot change device positions in RAID
> array
> device-mapper: ioctl: error adding target to table

This error occurs when the sub LV metadata says "I am device X in this
array" but dmsetup is being asked to put the sub LV at different
position Y (alas, neither are logged). With lots of -v and -d flags
you can get lvchange to include the dm table entries in the
diagnostics.

You can check the rmeta superblocks with
https://drive.google.com/open?id=0B8dHrWSoVcaDUk0wbHQzSEY3LTg

> Here is the relevant /etc/lvm/archive (archive is more recent that backup)

That looks sane, but you omitted the physical volumes section so there
is no way to cross-check UUIDs and devices or see if there are MISSING
flags.

If you use
https://drive.google.com/open?id=0B8dHrWSoVcaDQkU5NG1sLWc5cjg
directly, you can get metadata that LVM is reading off the PVs and
double-check for discrepancies.
