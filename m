Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u94MEmU6031469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 4 Oct 2016 18:14:48 -0400
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70C49D713A
	for <linux-lvm@redhat.com>; Tue,  4 Oct 2016 22:14:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f193so17122136wmg.2
	for <linux-lvm@redhat.com>; Tue, 04 Oct 2016 15:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
In-Reply-To: <CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
From: Slava Prisivko <vprisivko@gmail.com>
Date: Tue, 04 Oct 2016 22:14:33 +0000
Message-ID: <CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e014940044558cd053e116388
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--089e014940044558cd053e116388
Content-Type: text/plain; charset=UTF-8

Thanks!

On Tue, Oct 4, 2016 at 12:49 PM Giuliano Procida <giuliano.procida@gmail.com>
wrote:

Before anything else, I would have suggested backing up the image and
meta sub LVs, but it looks like you are just testing.

Already did. I'm not testing, I just renamed the LVs to "test_*" because
the previous name doesn't matter.

There is nothing particularly important there, but I would like to
understand whether I would be able to recover should something alike happen
in the future.


Clear down any odd state with dmsetup remove /dev/vg/... and then run:

vgextend --restoremissing

I didn't have to, because all the PVs are present:

# pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  vg lvm2 a--    1.82t   1.10t
  /dev/sdb2  vg lvm2 a--    3.64t   1.42t
  /dev/sdc2  vg lvm2 a--  931.51g 195.18g


Actually, always run LVM commands with -v -t before really running them.

Thanks! I had backed up the rmeta* and rimage*, so I didn't feel the need
for using -t. Am I wrong?


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

Yeah, I tried, but in vain:
# lvchange --rebuild /dev/sda2 vg/test -v
    Archiving volume group "vg" metadata (seqno 518).
Do you really want to rebuild 1 PVs of logical volume vg/test [y/n]: y
    Accepted input: [y]
  vg/test must be active to perform this operation.

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

Yes, I've noticed it. The problem was a faulty SATA cable (as I learned
later), so when I switched the computer on for the first time, /dev/sda was
missing (in the current device allocation). I switched off the computer,
swapped the /dev/sda and /dev/sdb SATA cable (without thinking about the
consequences) and switched it on. This time the /dev/sdb was missing. I
replaced the faulty cable with a new one and switched the machine back on.
This time sda, sdb and sdc were all present, but the RAID went out-of-sync.

I'm pretty sure there were very few (if any) writing operations during the
degraded operating mode, so the I could recover by rebuilding the old
mirror (sda) using the more recent ones (sdb and sdc).


>> I re-attached the disk, and removed a second. Stayed
>> running (this is raid6). Re-attached, still no indication from lvs. I ran
>> lvconvert --repair on the volume, it told me it was OK. Then I pulled a
>> third disk... and the machine died. Re-inserted it, rebooted, and am now
>> unsure how to fix.

So this is RAID6 rather than RAID5?
And you killed 3 disks in a RAID 6 array?

Although I have RAID5, not the RAID6, but the principle is the same (as I
explained in the previous paragraph).


> If I had been using mdadm, I could have probably recovered the data using
> `mdadm --force --assemble`, but I was not able to achieve the same using
the
> LVM tools.

LVM is very different. :-(

> I have tried to concatenate rmeta and rimage for each mirror and put them
on
> three linear devices in order to feed them to the mdadm (because LVM
> leverages MD), but without success (`mdadm --examine` does not recognize
the
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

Thanks, I used your raid5_parity_check.cc utility with the default stripe
size (64 * 1024), but it actually doesn't matter since you're just
calculating the total xor and the stripe size acts as a buffer size for
that.

I get three unsynced stripes out of 512 (32 mib / 64 kib), but I would like
to try to reconstruct the test_rimage_1 using h the other two. Just in
case, here are the bad stripe numbers: 16, 48, 49.


> I tried to understand how device-mapper RAID leverages MD, but was unable
to
> find any documentation while the kernel code is quite complicated.
>
> I also tried to rebuild the mirror directly by using `dmsetup`, but it
can't
> rebuild if metadata is out of sync.
>
> Overall, almost the only useful information I could find is RAIDing with
LVM
> vs MDRAID - pros and cons? question on Unix & Linux SE.

Well, I would read through this as well (versions 6 and 7 also available):
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7-Beta/html/Logical_Volume_Manager_Administration/index.html

 Thanks, but nothing particular relevant for my case there.

> The output of various commands is provided below.
>
>     # lvs -a -o +devices
>
>     test                           vg   rwi---r---  64.00m
> test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)
>     [test_rimage_0]                vg   Iwi-a-r-r-  32.00m /dev/sdc2(1)
>     [test_rimage_1]                vg   Iwi-a-r-r-  32.00m
/dev/sda2(238244)
>     [test_rimage_2]                vg   Iwi-a-r-r-  32.00m
/dev/sdb2(148612)
>     [test_rmeta_0]                 vg   ewi-a-r-r-   4.00m /dev/sdc2(0)
>     [test_rmeta_1]                 vg   ewi-a-r-r-   4.00m
/dev/sda2(238243)
>     [test_rmeta_2]                 vg   ewi-a-r-r-   4.00m
/dev/sdb2(148611)
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

After cleaning the dmsetup table of test_* and trying to lvchange -ay I get
practically the same:
# lvchange -ay vg/test -v
    Activating logical volume vg/test exclusively.
    activation/volume_list configuration setting not defined: Checking only
host tags for vg/test.
    Creating vg-test_rmeta_0
    Loading vg-test_rmeta_0 table (253:35)
    Resuming vg-test_rmeta_0 (253:35)
    Creating vg-test_rimage_0
    Loading vg-test_rimage_0 table (253:36)
    Resuming vg-test_rimage_0 (253:36)
    Creating vg-test_rmeta_1
    Loading vg-test_rmeta_1 table (253:37)
    Resuming vg-test_rmeta_1 (253:37)
    Creating vg-test_rimage_1
    Loading vg-test_rimage_1 table (253:38)
    Resuming vg-test_rimage_1 (253:38)
    Creating vg-test_rmeta_2
    Loading vg-test_rmeta_2 table (253:39)
    Resuming vg-test_rmeta_2 (253:39)
    Creating vg-test_rimage_2
    Loading vg-test_rimage_2 table (253:40)
    Resuming vg-test_rimage_2 (253:40)
    Creating vg-test
    Loading vg-test table (253:87)
  device-mapper: reload ioctl on (253:87) failed: Invalid argument
    Removing vg-test (253:87)

device-mapper: table: 253:87: raid: Cannot change device positions in RAID
array
device-mapper: ioctl: error adding target to table


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

I've updated to the 2.02.166 (the latest version):

# lvm version
  LVM version:     2.02.166(2) (2016-09-26)
  Library version: 1.02.135 (2016-09-26)
  Driver version:  4.34.0


> And the following kernel version:
>
>     Linux server 4.4.8-hardened-r1-1 #1 SMP

More useful would be the contents of /etc/lvm/backup/vg and the output
of vgs and pvs.

# pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  vg lvm2 a--    1.82t   1.10t
  /dev/sdb2  vg lvm2 a--    3.64t   1.42t
  /dev/sdc2  vg lvm2 a--  931.51g 195.18g

# vgs
  VG #PV #LV #SN Attr   VSize VFree
  vg   3  18   0 wz--n- 6.37t 2.71t

Here is the relevant /etc/lvm/archive (archive is more recent that
backup) content:
test {

id = "JjiPmi-esfx-vdeF-5zMv-TsJC-6vFf-qNgNnZ" status = ["READ", "WRITE",
"VISIBLE"] flags = [] creation_time = 18446744073709551615 # 1970-01-01
02:59:59 +0300 creation_host = "server" segment_count = 1 segment1 {
start_extent = 0 extent_count = 16 # 64 Megabytes type = "raid5"
device_count = 3 stripe_size = 128 region_size = 1024 raids = [
"test_rmeta_0", "test_rimage_0", "test_rmeta_1", "test_rimage_1",
"test_rmeta_2", "test_rimage_2" ] } }

        test_rmeta_0 {
            id = "WE3CUg-ayo8-lp1Y-9S2v-zRGi-mV1s-DWYoST"
            status = ["READ", "WRITE", "VISIBLE"]
            flags = []
            creation_time = 18446744073709551615    # 1970-01-01 02:59:59 +0300
            creation_host = "server"
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 1    # 4 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv0", 0
                ]
            }
        }
		
		test_rmeta_1 {
            id = "Apk3mc-zy4q-c05I-hiIO-1Kae-9yB6-Cl5lfJ"
            status = ["READ", "WRITE", "VISIBLE"]
            flags = []
            creation_time = 18446744073709551615    # 1970-01-01 02:59:59 +0300
            creation_host = "server"
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 1    # 4 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv1", 238243
                ]
            }
        }
		
		test_rmeta_2 {
            id = "j2Waf3-A77y-pvfd-foGK-Hq7B-rHe8-YKzQY0"
            status = ["READ", "WRITE", "VISIBLE"]
            flags = []
            creation_time = 18446744073709551615    # 1970-01-01 02:59:59 +0300
            creation_host = "server"
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 1    # 4 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv2", 148611
                ]
            }
        }
		
		        test_rimage_0 {
            id = "zaGgJx-YSIl-o2oq-UN9l-02Q8-IS5u-sz4RhQ"
            status = ["READ", "WRITE"]
            flags = []
            creation_time = 18446744073709551615    # 1970-01-01 02:59:59 +0300
            creation_host = "server"
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 8    # 32 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv0", 1
                ]
            }
        }

        test_rimage_1 {
            id = "0mD5AL-GKj3-siFz-xQmO-ZtQo-L3MM-Ro2SG2"
            status = ["READ", "WRITE"]
            flags = []
            creation_time = 18446744073709551615    # 1970-01-01 02:59:59 +0300
            creation_host = "server"
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 8    # 32 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv1", 238244
                ]
            }
        }
		
		test_rimage_2 {
            id = "4FxiHV-j637-ENml-Okm3-uL1p-fuZ0-y9dE8Y"
            status = ["READ", "WRITE"]
            flags = []
            creation_time = 18446744073709551615    # 1970-01-01 02:59:59 +0300
            creation_host = "server"
            segment_count = 1

            segment1 {
                start_extent = 0
                extent_count = 8    # 32 Megabytes

                type = "striped"
                stripe_count = 1    # linear

                stripes = [
                    "pv2", 148612
                ]
            }
        }

--
Best regards,
Slava Prisivko.



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--089e014940044558cd053e116388
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_msg">Thanks!<br><div class=
=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg"><div =
class=3D"gmail_quote gmail_msg"></div></div></div><div dir=3D"ltr" class=3D=
"gmail_msg"><div class=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><=
div dir=3D"ltr" class=3D"gmail_msg">On Tue, Oct 4, 2016 at 12:49 PM Giulian=
o Procida &lt;<a href=3D"mailto:giuliano.procida@gmail.com" class=3D"gmail_=
msg" target=3D"_blank">giuliano.procida@gmail.com</a>&gt; wrote:<br class=
=3D"gmail_msg"></div><blockquote class=3D"gmail_quote gmail_msg" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Before anythi=
ng else, I would have suggested backing up the image and<br class=3D"gmail_=
msg">
meta sub LVs, but it looks like you are just testing.<br class=3D"gmail_msg=
"></blockquote></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div =
class=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><div class=3D"gmai=
l_msg">Already did. I&#39;m not testing, I just renamed the LVs to &quot;te=
st_*&quot; because the previous name doesn&#39;t matter.=C2=A0</div><div cl=
ass=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg">Th=
ere is nothing particularly important there, but I would like to understand=
 whether I would be able to recover should something alike happen in the fu=
ture.</div></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div clas=
s=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><blockquote class=3D"g=
mail_quote gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br class=3D"gmail_msg">
Clear down any odd state with dmsetup remove /dev/vg/... and then run:<br c=
lass=3D"gmail_msg">
<br class=3D"gmail_msg">
vgextend --restoremissing<br class=3D"gmail_msg"></blockquote></div></div><=
/div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_msg"><div cla=
ss=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg">I didn&#39;t have to,=
 because all the PVs are present:</div><div class=3D"gmail_msg"><pre class=
=3D"gmail_msg"># pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  vg lvm2 a--    1.82t   1.10t
  /dev/sdb2  vg lvm2 a--    3.64t   1.42t
  /dev/sdc2  vg lvm2 a--  931.51g 195.18g</pre></div></div></div></div><div=
 dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_msg"><div class=3D"gma=
il_quote gmail_msg"><blockquote class=3D"gmail_quote gmail_msg" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
Actually, always run LVM commands with -v -t before really running them.<br=
 class=3D"gmail_msg"></blockquote></div></div></div><div dir=3D"ltr" class=
=3D"gmail_msg"><div class=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg=
"><div class=3D"gmail_msg">Thanks! I had backed up the rmeta* and rimage*, =
so I didn&#39;t feel the need for using -t. Am I wrong?</div></div></div></=
div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_msg"><div clas=
s=3D"gmail_quote gmail_msg"><blockquote class=3D"gmail_quote gmail_msg" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
On 4 October 2016 at 00:49, Slava Prisivko &lt;<a href=3D"mailto:vprisivko@=
gmail.com" class=3D"gmail_msg" target=3D"_blank">vprisivko@gmail.com</a>&gt=
; wrote:<br class=3D"gmail_msg">
&gt; In order to mitigate cross-posting, here&#39;s the original question o=
n<br class=3D"gmail_msg">
&gt; Serverfault.SE: LVM RAID5 out-of-sync recovery, but feel free to answe=
r<br class=3D"gmail_msg">
&gt; wherever you deem appropriate.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; How can one recover from an LVM RAID5 out-of-sync?<br class=3D"gmail_m=
sg">
<br class=3D"gmail_msg">
I suppose it&#39;s supposed to recover mostly automatically.<br class=3D"gm=
ail_msg">
*If* your array is assembled (or whatever the LVM-equivalent<br class=3D"gm=
ail_msg">
termiology is) then you can force a given subset of PVs to be<br class=3D"g=
mail_msg">
resynced.<br class=3D"gmail_msg">
<a href=3D"http://man7.org/linux/man-pages/man8/lvchange.8.html" rel=3D"nor=
eferrer" class=3D"gmail_msg" target=3D"_blank">http://man7.org/linux/man-pa=
ges/man8/lvchange.8.html</a> - look for rebuild<br class=3D"gmail_msg">
However, this does not seem to be your problem.<br class=3D"gmail_msg"></bl=
ockquote></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=
=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg=
">Yeah, I tried, but in vain:</div><div class=3D"gmail_msg"><div class=3D"g=
mail_msg"># lvchange --rebuild /dev/sda2 vg/test -v</div><div class=3D"gmai=
l_msg">=C2=A0 =C2=A0 Archiving volume group &quot;vg&quot; metadata (seqno =
518).</div><div class=3D"gmail_msg">Do you really want to rebuild 1 PVs of =
logical volume vg/test [y/n]: y</div><div class=3D"gmail_msg">=C2=A0 =C2=A0=
 Accepted input: [y]</div></div></div></div></div><div dir=3D"ltr" class=3D=
"gmail_msg"><div class=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><=
div class=3D"gmail_msg"><div class=3D"gmail_msg">=C2=A0 vg/test must be act=
ive to perform this operation.</div></div></div></div></div><div dir=3D"ltr=
" class=3D"gmail_msg"><div class=3D"gmail_msg"><div class=3D"gmail_quote gm=
ail_msg"><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; I have an LVM RAID5 configuration (RAID5 using the LVM tools).<br clas=
s=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; However, because of a technical problem mirrors went out of sync. You =
can<br class=3D"gmail_msg">
&gt; reproduce this as explained in this Unix &amp; Linux question:<br clas=
s=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;&gt; Playing with my Jessie VM, I disconnected (virtually) one disk. Th=
at<br class=3D"gmail_msg">
&gt;&gt; worked, the machine stayed running. lvs, though, gave no indicatio=
n the<br class=3D"gmail_msg">
&gt;&gt; arrays were degraded.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
You should have noticed something in the kernel logs. Also, lvs should<br c=
lass=3D"gmail_msg">
have reported that the array was now (p)artial.<br class=3D"gmail_msg"></bl=
ockquote></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=
=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg"><blockquote class=3D"gm=
ail_quote gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"></blockquote><div class=3D"gmail_msg">Yes, I&#39;ve notic=
ed it. The problem was a faulty SATA cable (as I learned later), so when I =
switched the computer on for the first time, /dev/sda was missing (in the c=
urrent device allocation). I switched off the computer, swapped the /dev/sd=
a and /dev/sdb SATA cable (without thinking about the consequences) and swi=
tched it on. This time the /dev/sdb was missing. I replaced the faulty cabl=
e with a new one and switched the machine back on. This time sda, sdb and s=
dc were all present, but the RAID went out-of-sync.</div><div class=3D"gmai=
l_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg">I&#39;m prett=
y sure there were very few (if any) writing operations during the degraded =
operating mode, so the I could recover by rebuilding the old mirror (sda) u=
sing the more recent ones (sdb and sdc).</div></div></div></div><div dir=3D=
"ltr" class=3D"gmail_msg"><div class=3D"gmail_msg"><div class=3D"gmail_quot=
e gmail_msg"><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
&gt;&gt; I re-attached the disk, and removed a second. Stayed<br class=3D"g=
mail_msg">
&gt;&gt; running (this is raid6). Re-attached, still no indication from lvs=
. I ran<br class=3D"gmail_msg">
&gt;&gt; lvconvert --repair on the volume, it told me it was OK. Then I pul=
led a<br class=3D"gmail_msg">
&gt;&gt; third disk... and the machine died. Re-inserted it, rebooted, and =
am now<br class=3D"gmail_msg">
&gt;&gt; unsure how to fix.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
So this is RAID6 rather than RAID5?<br class=3D"gmail_msg">
And you killed 3 disks in a RAID 6 array?<br class=3D"gmail_msg"></blockquo=
te></div></div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gma=
il_msg"><div class=3D"gmail_quote gmail_msg"><div class=3D"gmail_msg">Altho=
ugh I have RAID5, not the RAID6, but the principle is the same (as I explai=
ned in the previous paragraph).=C2=A0<br class=3D"gmail_msg"></div></div></=
div></div><div dir=3D"ltr" class=3D"gmail_msg"><div class=3D"gmail_msg"><di=
v class=3D"gmail_quote gmail_msg"><blockquote class=3D"gmail_quote gmail_ms=
g" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
&gt; If I had been using mdadm, I could have probably recovered the data us=
ing<br class=3D"gmail_msg">
&gt; `mdadm --force --assemble`, but I was not able to achieve the same usi=
ng the<br class=3D"gmail_msg">
&gt; LVM tools.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
LVM is very different. :-(<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; I have tried to concatenate rmeta and rimage for each mirror and put t=
hem on<br class=3D"gmail_msg">
&gt; three linear devices in order to feed them to the mdadm (because LVM<b=
r class=3D"gmail_msg">
&gt; leverages MD), but without success (`mdadm --examine` does not recogni=
ze the<br class=3D"gmail_msg">
&gt; superblock), because it appears that the mdadm superblock format diffe=
rs<br class=3D"gmail_msg">
&gt; from the dm_raid superblock format (search for the &quot;dm_raid_super=
block&quot;).<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Not only that, but (as far as I can tell), LVM RAID 6 parity (well,<br clas=
s=3D"gmail_msg">
syndrome) is calculated in a different manner to the older mdadm RAID;<br c=
lass=3D"gmail_msg">
it uses an industry-standard layout instead of the (more obvious?) md<br cl=
ass=3D"gmail_msg">
layout.<br class=3D"gmail_msg">
I wrote a utility to parity-check the default LVM RAID6 layout with<br clas=
s=3D"gmail_msg">
the usual stripe size (easily adjusted) here:<br class=3D"gmail_msg">
<a href=3D"https://drive.google.com/open?id=3D0B8dHrWSoVcaDbkY3WmkxSmpfSVE"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://drive.goo=
gle.com/open?id=3D0B8dHrWSoVcaDbkY3WmkxSmpfSVE</a><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
You can use this to see to what degree the data in the image LVs are<br cla=
ss=3D"gmail_msg">
in fact in/out of sync. I&#39;ve not attempted to add sync functionality<br=
 class=3D"gmail_msg">
to this.<br class=3D"gmail_msg"></blockquote><div>Thanks, I used your raid5=
_parity_check.cc utility with the default stripe size (64 * 1024), but it a=
ctually doesn&#39;t matter since you&#39;re just calculating the total xor =
and the stripe size acts as a buffer size for that.</div><div><br></div><di=
v>I get three unsynced stripes out of 512 (32 mib / 64 kib), but I would li=
ke to try to reconstruct the test_rimage_1 using h the other two. Just in c=
ase, here are the bad stripe numbers: 16, 48, 49.</div><blockquote class=3D=
"gmail_quote gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br class=3D"gmail_msg">
&gt; I tried to understand how device-mapper RAID leverages MD, but was una=
ble to<br class=3D"gmail_msg">
&gt; find any documentation while the kernel code is quite complicated.<br =
class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I also tried to rebuild the mirror directly by using `dmsetup`, but it=
 can&#39;t<br class=3D"gmail_msg">
&gt; rebuild if metadata is out of sync.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Overall, almost the only useful information I could find is RAIDing wi=
th LVM<br class=3D"gmail_msg">
&gt; vs MDRAID - pros and cons? question on Unix &amp; Linux SE.<br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
Well, I would read through this as well (versions 6 and 7 also available):<=
br class=3D"gmail_msg">
<a href=3D"https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise=
_Linux/7-Beta/html/Logical_Volume_Manager_Administration/index.html" rel=3D=
"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://access.redhat.co=
m/documentation/en-US/Red_Hat_Enterprise_Linux/7-Beta/html/Logical_Volume_M=
anager_Administration/index.html</a><br class=3D"gmail_msg">
<br class=3D"gmail_msg"></blockquote><div>=C2=A0Thanks, but nothing particu=
lar relevant for my case there.</div><blockquote class=3D"gmail_quote gmail=
_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
&gt; The output of various commands is provided below.<br class=3D"gmail_ms=
g">
&gt;<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0# lvs -a -o +devices<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0rwi---r-=
--=C2=A0 64.00m<br class=3D"gmail_msg">
&gt; test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)<br class=3D"gmail_m=
sg">
&gt;=C2=A0 =C2=A0 =C2=A0[test_rimage_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vg=C2=A0 =C2=A0Iwi-a-r-r-=C2=A0 32.00m /dev/sdc2(1)<br=
 class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0[test_rimage_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vg=C2=A0 =C2=A0Iwi-a-r-r-=C2=A0 32.00m /dev/sda2(23824=
4)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0[test_rimage_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vg=C2=A0 =C2=A0Iwi-a-r-r-=C2=A0 32.00m /dev/sdb2(14861=
2)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0[test_rmeta_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m /dev=
/sdc2(0)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0[test_rmeta_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m /dev=
/sda2(238243)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0[test_rmeta_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.00m /dev=
/sdb2(148611)<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I cannot activate the LV:<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0# lvchange -ay vg/test -v<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Activating logical volume &quot;test&=
quot; exclusively.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0activation/volume_list configuration =
setting not defined: Checking<br class=3D"gmail_msg">
&gt; only host tags for vg/test.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test_rmeta_0 table (253:35=
)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rmeta_0 (253:35) i=
dentical table reload.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test_rimage_0 table (253:3=
6)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rimage_0 (253:36) =
identical table reload.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test_rmeta_1 table (253:37=
)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rmeta_1 (253:37) i=
dentical table reload.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test_rimage_1 table (253:3=
8)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rimage_1 (253:38) =
identical table reload.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test_rmeta_2 table (253:39=
)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rmeta_2 (253:39) i=
dentical table reload.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test_rimage_2 table (253:4=
0)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rimage_2 (253:40) =
identical table reload.<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Creating vg-test<br class=3D"gmail_ms=
g">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Loading vg-test table (253:87)<br cla=
ss=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0device-mapper: reload ioctl on (253:87) fail=
ed: Invalid argument<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Removing vg-test (253:87)<br class=3D=
"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; While trying to activate I&#39;m getting the following in the dmesg:<b=
r class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0device-mapper: table: 253:87: raid: Cannot change d=
evice positions in<br class=3D"gmail_msg">
&gt; RAID array<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0device-mapper: ioctl: error adding target to table<=
br class=3D"gmail_msg">
<br class=3D"gmail_msg">
That&#39;s a new error message to me. I would try clearing out the dm<br cl=
ass=3D"gmail_msg">
table (dmsetup remove /dev/vg/test_*) before trying again (-v -t,<br class=
=3D"gmail_msg">
first).<br class=3D"gmail_msg"></blockquote><div>After cleaning the dmsetup=
 table of test_* and trying to lvchange -ay I get practically the same:</di=
v><div># lvchange -ay vg/test -v=C2=A0</div><div>=C2=A0 =C2=A0 Activating l=
ogical volume vg/test exclusively.</div><div>=C2=A0 =C2=A0 activation/volum=
e_list configuration setting not defined: Checking only host tags for vg/te=
st.</div><div>=C2=A0 =C2=A0 Creating vg-test_rmeta_0</div><div>=C2=A0 =C2=
=A0 Loading vg-test_rmeta_0 table (253:35)</div><div>=C2=A0 =C2=A0 Resuming=
 vg-test_rmeta_0 (253:35)</div><div>=C2=A0 =C2=A0 Creating vg-test_rimage_0=
</div><div>=C2=A0 =C2=A0 Loading vg-test_rimage_0 table (253:36)</div><div>=
=C2=A0 =C2=A0 Resuming vg-test_rimage_0 (253:36)</div><div>=C2=A0 =C2=A0 Cr=
eating vg-test_rmeta_1</div><div>=C2=A0 =C2=A0 Loading vg-test_rmeta_1 tabl=
e (253:37)</div><div>=C2=A0 =C2=A0 Resuming vg-test_rmeta_1 (253:37)</div><=
div>=C2=A0 =C2=A0 Creating vg-test_rimage_1</div><div>=C2=A0 =C2=A0 Loading=
 vg-test_rimage_1 table (253:38)</div><div>=C2=A0 =C2=A0 Resuming vg-test_r=
image_1 (253:38)</div><div>=C2=A0 =C2=A0 Creating vg-test_rmeta_2</div><div=
>=C2=A0 =C2=A0 Loading vg-test_rmeta_2 table (253:39)</div><div>=C2=A0 =C2=
=A0 Resuming vg-test_rmeta_2 (253:39)</div><div>=C2=A0 =C2=A0 Creating vg-t=
est_rimage_2</div><div>=C2=A0 =C2=A0 Loading vg-test_rimage_2 table (253:40=
)</div><div>=C2=A0 =C2=A0 Resuming vg-test_rimage_2 (253:40)</div><div>=C2=
=A0 =C2=A0 Creating vg-test</div><div>=C2=A0 =C2=A0 Loading vg-test table (=
253:87)</div><div>=C2=A0 device-mapper: reload ioctl on (253:87) failed: In=
valid argument</div><div>=C2=A0 =C2=A0 Removing vg-test (253:87)=C2=A0<br><=
/div><div><br></div><div><div>device-mapper: table: 253:87: raid: Cannot ch=
ange device positions in RAID array</div><div>device-mapper: ioctl: error a=
dding target to table</div></div><blockquote class=3D"gmail_quote gmail_msg=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
&gt; lvconvert only works on active LVs:<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0# lvconvert --repair vg/test<br class=3D"gmail_msg"=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vg/test must be active to perform this opera=
tion.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
And it requires new PVs (&quot;replacement drives&quot;) to put the subLVs =
on.<br class=3D"gmail_msg">
It&#39;s probably not what you want.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; I have the following LVM version:<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0# lvm version<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LVM version:=C2=A0 =C2=A0 =C2=A02.02.145(2) =
(2016-03-04)<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Library version: 1.02.119 (2016-03-04)<br cl=
ass=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Driver version:=C2=A0 4.34.0<br class=3D"gma=
il_msg">
<br class=3D"gmail_msg">
I would update LVM to whatever is in Debian testing as there has been<br cl=
ass=3D"gmail_msg">
a fair bit of change this year.<br class=3D"gmail_msg"></blockquote><div>I&=
#39;ve updated to the 2.02.166 (the latest version):</div><div><pre style=
=3D"top: -99px;"># lvm version
  LVM version:     2.02.166(2) (2016-09-26)
  Library version: 1.02.135 (2016-09-26)
  Driver version:  4.34.0</pre></div><blockquote class=3D"gmail_quote gmail=
_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br class=3D"gmail_msg">
&gt; And the following kernel version:<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0Linux server 4.4.8-hardened-r1-1 #1 SMP<br class=3D=
"gmail_msg">
<br class=3D"gmail_msg">
More useful would be the contents of /etc/lvm/backup/vg and the output<br c=
lass=3D"gmail_msg">
of vgs and pvs.<br class=3D"gmail_msg"></blockquote><div><pre style=3D"top:=
 -99px;"># pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  vg lvm2 a--    1.82t   1.10t
  /dev/sdb2  vg lvm2 a--    3.64t   1.42t
  /dev/sdc2  vg lvm2 a--  931.51g 195.18g</pre><pre style=3D"top: -99px;"><=
pre style=3D"top: -99px;"># vgs
  VG #PV #LV #SN Attr   VSize VFree
  vg   3  18   0 wz--n- 6.37t 2.71t</pre><pre style=3D"top: -99px;">Here is=
 the relevant /etc/lvm/archive (archive is more recent that backup) content=
:<br><span style=3D"font-family:sans-serif">test {</span><br></pre>        =
    id =3D &quot;JjiPmi-esfx-vdeF-5zMv-TsJC-6vFf-qNgNnZ&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;VISIBLE&=
quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 16   # 64 Megabytes

                type =3D &quot;raid5&quot;
                device_count =3D 3
                stripe_size =3D 128
                region_size =3D 1024

                raids =3D [
                    &quot;test_rmeta_0&quot;, &quot;test_rimage_0&quot;,
                    &quot;test_rmeta_1&quot;, &quot;test_rimage_1&quot;,
                    &quot;test_rmeta_2&quot;, &quot;test_rimage_2&quot;
                ]
            }
        }
</pre><pre style=3D"top: -99px;">        test_rmeta_0 {
            id =3D &quot;WE3CUg-ayo8-lp1Y-9S2v-zRGi-mV1s-DWYoST&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;VISIBLE&=
quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 1    # 4 Megabytes

                type =3D &quot;striped&quot;
                stripe_count =3D 1    # linear

                stripes =3D [
                    &quot;pv0&quot;, 0
                ]
            }
        }
	=09
		test_rmeta_1 {
            id =3D &quot;Apk3mc-zy4q-c05I-hiIO-1Kae-9yB6-Cl5lfJ&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;VISIBLE&=
quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 1    # 4 Megabytes

                type =3D &quot;striped&quot;
                stripe_count =3D 1    # linear

                stripes =3D [
                    &quot;pv1&quot;, 238243
                ]
            }
        }
	=09
		test_rmeta_2 {
            id =3D &quot;j2Waf3-A77y-pvfd-foGK-Hq7B-rHe8-YKzQY0&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;VISIBLE&=
quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 1    # 4 Megabytes

                type =3D &quot;striped&quot;
                stripe_count =3D 1    # linear

                stripes =3D [
                    &quot;pv2&quot;, 148611
                ]
            }
        }
	=09
		        test_rimage_0 {
            id =3D &quot;zaGgJx-YSIl-o2oq-UN9l-02Q8-IS5u-sz4RhQ&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 8    # 32 Megabytes

                type =3D &quot;striped&quot;
                stripe_count =3D 1    # linear

                stripes =3D [
                    &quot;pv0&quot;, 1
                ]
            }
        }

        test_rimage_1 {
            id =3D &quot;0mD5AL-GKj3-siFz-xQmO-ZtQo-L3MM-Ro2SG2&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 8    # 32 Megabytes

                type =3D &quot;striped&quot;
                stripe_count =3D 1    # linear

                stripes =3D [
                    &quot;pv1&quot;, 238244
                ]
            }
        }
	=09
		test_rimage_2 {
            id =3D &quot;4FxiHV-j637-ENml-Okm3-uL1p-fuZ0-y9dE8Y&quot;
            status =3D [&quot;READ&quot;, &quot;WRITE&quot;]
            flags =3D []
            creation_time =3D 18446744073709551615    # 1970-01-01 02:59:59=
 +0300
            creation_host =3D &quot;server&quot;
            segment_count =3D 1

            segment1 {
                start_extent =3D 0
                extent_count =3D 8    # 32 Megabytes

                type =3D &quot;striped&quot;
                stripe_count =3D 1    # linear

                stripes =3D [
                    &quot;pv2&quot;, 148612
                ]
            }
        }<br></pre>--<br>Best regards,<br>Slava Prisivko.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
linux-lvm mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:linux-lvm@redhat.com" class=3D"gmail_msg" target=3D"_blan=
k">linux-lvm@redhat.com</a><br class=3D"gmail_msg">
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" class=3D"gmail_msg" target=3D"_blank">https://www.redhat.com/mailman/=
listinfo/linux-lvm</a><br class=3D"gmail_msg">
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" class=3D"gmail_msg" target=3D"_blank">http://tldp.org/HOWTO/LVM=
-HOWTO/</a><br class=3D"gmail_msg">
</blockquote></div></div></div></div>

--089e014940044558cd053e116388--
