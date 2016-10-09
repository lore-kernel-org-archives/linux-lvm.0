Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u99J10uV014106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 9 Oct 2016 15:01:00 -0400
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FAA231B322
	for <linux-lvm@redhat.com>; Sun,  9 Oct 2016 19:00:58 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x79so87474689lff.0
	for <linux-lvm@redhat.com>; Sun, 09 Oct 2016 12:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
In-Reply-To: <CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
From: Slava Prisivko <vprisivko@gmail.com>
Date: Sun, 09 Oct 2016 19:00:44 +0000
Message-ID: <CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7bacb0a6590525053e734353
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

--047d7bacb0a6590525053e734353
Content-Type: text/plain; charset=UTF-8

Hi!

On Wed, Oct 5, 2016 at 3:53 PM Giuliano Procida <giuliano.procida@gmail.com>
wrote:

> On 4 October 2016 at 23:14, Slava Prisivko <vprisivko@gmail.com> wrote:
> >> vgextend --restoremissing
> >
> > I didn't have to, because all the PVs are present:
> >
> > # pvs
> >   PV         VG Fmt  Attr PSize   PFree
> >   /dev/sda2  vg lvm2 a--    1.82t   1.10t
> >   /dev/sdb2  vg lvm2 a--    3.64t   1.42t
> >   /dev/sdc2  vg lvm2 a--  931.51g 195.18g
>
> Double-check in the metadata for MISSING. This is what I was hoping
> might be in your /etc/lvm/backup file.
>
> >> Actually, always run LVM commands with -v -t before really running them.
> >
> > Thanks! I had backed up the rmeta* and rimage*, so I didn't feel the need
> > for using -t. Am I wrong?
>
> Well, some nasty surprises may be avoidable (particularly if also using
> -f).
>
> > Yes, I've noticed it. The problem was a faulty SATA cable (as I learned
> > later), so when I switched the computer on for the first time, /dev/sda
> was
> > missing (in the current device allocation). I switched off the computer,
> > swapped the /dev/sda and /dev/sdb SATA cable (without thinking about the
> > consequences) and switched it on. This time the /dev/sdb was missing. I
> > replaced the faulty cable with a new one and switched the machine back
> on.
> > This time sda, sdb and sdc were all present, but the RAID went
> out-of-sync.
>
> In swapping the cables, you may have changed the sd{a,b,c} enumeration
> but this will have no impact on the UUIDs that LVM uses to identify
> the PVs.
>
That's right, but the images went out-of-sync because during the first boot
only sdb and sdc were present (so the content of sda should have been
implied), during the second boot only sda and sdc were present (so the
content of sdb should have been implied), but when I replaced the cable
there was a conflict between these three.

>
> > I'm pretty sure there were very few (if any) writing operations during
> the
> > degraded operating mode, so the I could recover by rebuilding the old
> mirror
> > (sda) using the more recent ones (sdb and sdc).
>
> Agreed, based on your check below.
>
> > Thanks, I used your raid5_parity_check.cc utility with the default stripe
> > size (64 * 1024), but it actually doesn't matter since you're just
> > calculating the total xor and the stripe size acts as a buffer size for
> > that.
>
> [I was little surprised to discover that RAID 6 works as a byte erasure
> code.]
>
> The stripe size and layout matters once if you want to adapt the code
> to extract or repair the data.
>
> > I get three unsynced stripes out of 512 (32 mib / 64 kib), but I would
> like
> > to try to reconstruct the test_rimage_1 using h the other two. Just in
> case,
> > here are the bad stripe numbers: 16, 48, 49.
>
> I've updated the utility (this is for raid5 = raid5_ls). Warning: not
> tested on out-of-sync data.
>
> https://drive.google.com/open?id=0B8dHrWSoVcaDYXlUWXEtZEMwX0E


>
> # Assume the first sub LV has the out-of-date data and dump the
> correct(ed) LV content.
> ./foo stripe $((64*1024)) repair 0 /dev/${lv}_rimage_* | cmp - /dev/${lv}
>
Thanks!

I tried to reassemble the array using 3 different pairs of correct LV
images, but it doesn't work (I am sure because I cannot luksOpen a LUKS
image which is in the LV, which is almost surely uncorrectable).

>
> >> > The output of various commands is provided below.
> >> >
> >> >     # lvs -a -o +devices
> >> >
> >> >     test                           vg   rwi---r---  64.00m
> >> > test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)
> >> >     [test_rimage_0]                vg   Iwi-a-r-r-  32.00m
> /dev/sdc2(1)
> >> >     [test_rimage_1]                vg   Iwi-a-r-r-  32.00m
> >> > /dev/sda2(238244)
> >> >     [test_rimage_2]                vg   Iwi-a-r-r-  32.00m
> >> > /dev/sdb2(148612)
> >> >     [test_rmeta_0]                 vg   ewi-a-r-r-   4.00m
> /dev/sdc2(0)
> >> >     [test_rmeta_1]                 vg   ewi-a-r-r-   4.00m
> >> > /dev/sda2(238243)
> >> >     [test_rmeta_2]                 vg   ewi-a-r-r-   4.00m
> >> > /dev/sdb2(148611)
>
> The extra r(efresh) attributes suggest trying a resync operation which
> may not be possible on inactive LV.
> I missed that the RAID device is actually in the list.
>
> > After cleaning the dmsetup table of test_* and trying to lvchange -ay I
> get
> > practically the same:
> > # lvchange -ay vg/test -v
> [snip]
> >   device-mapper: reload ioctl on (253:87) failed: Invalid argument
> >     Removing vg-test (253:87)
> >
> > device-mapper: table: 253:87: raid: Cannot change device positions in
> RAID
> > array
> > device-mapper: ioctl: error adding target to table
>
> This error occurs when the sub LV metadata says "I am device X in this
> array" but dmsetup is being asked to put the sub LV at different
> position Y (alas, neither are logged). With lots of -v and -d flags
> you can get lvchange to include the dm table entries in the
> diagnostics.
>
This is as useful as it gets (-vvvv -dddd):
    Loading vg-test_rmeta_0 table (253:35)
        Adding target to (253:35): 0 8192 linear 8:34 2048
        dm table   (253:35) [ opencount flush ]   [16384] (*1)
    Suppressed vg-test_rmeta_0 (253:35) identical table reload.
    Loading vg-test_rimage_0 table (253:36)
        Adding target to (253:36): 0 65536 linear 8:34 10240
        dm table   (253:36) [ opencount flush ]   [16384] (*1)
    Suppressed vg-test_rimage_0 (253:36) identical table reload.
    Loading vg-test_rmeta_1 table (253:37)
        Adding target to (253:37): 0 8192 linear 8:2 1951688704
        dm table   (253:37) [ opencount flush ]   [16384] (*1)
    Suppressed vg-test_rmeta_1 (253:37) identical table reload.
    Loading vg-test_rimage_1 table (253:38)
        Adding target to (253:38): 0 65536 linear 8:2 1951696896
        dm table   (253:38) [ opencount flush ]   [16384] (*1)
    Suppressed vg-test_rimage_1 (253:38) identical table reload.
    Loading vg-test_rmeta_2 table (253:39)
        Adding target to (253:39): 0 8192 linear 8:18 1217423360
        dm table   (253:39) [ opencount flush ]   [16384] (*1)
    Suppressed vg-test_rmeta_2 (253:39) identical table reload.
    Loading vg-test_rimage_2 table (253:40)
        Adding target to (253:40): 0 65536 linear 8:18 1217431552
        dm table   (253:40) [ opencount flush ]   [16384] (*1)
    Suppressed vg-test_rimage_2 (253:40) identical table reload.
    Creating vg-test
        dm create vg-test
LVM-Pgjp5f2PRJipxvoNdsYmq0olg9iWwY5pJjiPmiesfxvdeF5zMvTsJC6vFfqNgNnZ [
noopencount flush ]   [16384] (*1)
    Loading vg-test table (253:84)
        Adding target to (253:84): 0 131072 raid raid5_ls 3 128 region_size
1024 3 253:35 253:36 253:37 253:38 253:39 253:40
        dm table   (253:84) [ opencount flush ]   [16384] (*1)
        dm reload   (253:84) [ noopencount flush ]   [16384] (*1)
  device-mapper: reload ioctl on (253:84) failed: Invalid argument

I don't see any problems here.

>
> You can check the rmeta superblocks with
> https://drive.google.com/open?id=0B8dHrWSoVcaDUk0wbHQzSEY3LTg

Thanks, it's very useful!

/dev/mapper/vg-test_rmeta_0
found RAID superblock at offset 0
 magic=1683123524
 features=0
 num_devices=3
 array_position=0
 events=56
 failed_devices=0
 disk_recovery_offset=18446744073709551615
 array_resync_offset=18446744073709551615
 level=5
 layout=2
 stripe_sectors=128
found bitmap file superblock at offset 4096:
         magic: 6d746962
       version: 4
          uuid: 00000000.00000000.00000000.00000000
        events: 56
events cleared: 33
         state: 00000000
     chunksize: 524288 B
  daemon sleep: 5s
     sync size: 32768 KB
max write behind: 0

/dev/mapper/vg-test_rmeta_1
found RAID superblock at offset 0
 magic=1683123524
 features=0
 num_devices=3
 array_position=4294967295
 events=62
 failed_devices=1
 disk_recovery_offset=0
 array_resync_offset=18446744073709551615
 level=5
 layout=2
 stripe_sectors=128
found bitmap file superblock at offset 4096:
         magic: 6d746962
       version: 4
          uuid: 00000000.00000000.00000000.00000000
        events: 60
events cleared: 33
         state: 00000000
     chunksize: 524288 B
  daemon sleep: 5s
     sync size: 32768 KB
max write behind: 0

/dev/mapper/vg-test_rmeta_2
found RAID superblock at offset 0
 magic=1683123524
 features=0
 num_devices=3
 array_position=2
 events=62
 failed_devices=1
 disk_recovery_offset=18446744073709551615
 array_resync_offset=18446744073709551615
 level=5
 layout=2
 stripe_sectors=128
found bitmap file superblock at offset 4096:
         magic: 6d746962
       version: 4
          uuid: 00000000.00000000.00000000.00000000
        events: 62
events cleared: 33
         state: 00000000
     chunksize: 524288 B
  daemon sleep: 5s
     sync size: 32768 KB
max write behind: 0

The problem I see here is that events count is different for the three
rmetas.

>
>
> > Here is the relevant /etc/lvm/archive (archive is more recent that
> backup)
>
> That looks sane, but you omitted the physical volumes section so there
> is no way to cross-check UUIDs and devices or see if there are MISSING
> flags.
>
The ids are the same and there are no MISSING flags.

>
> If you use
> https://drive.google.com/open?id=0B8dHrWSoVcaDQkU5NG1sLWc5cjg
> directly, you can get metadata that LVM is reading off the PVs and
> double-check for discrepancies.


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--047d7bacb0a6590525053e734353
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Wed, Oct 5, 2016 at 3:53 PM Giuliano Procida &lt;<a href=3D"mailto:giuliano=
.procida@gmail.com">giuliano.procida@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On 4 October 2016 at 23:14, Slava Prisivko &lt;<=
a href=3D"mailto:vprisivko@gmail.com" class=3D"gmail_msg" target=3D"_blank"=
>vprisivko@gmail.com</a>&gt; wrote:<br class=3D"gmail_msg">
&gt;&gt; vgextend --restoremissing<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I didn&#39;t have to, because all the PVs are present:<br class=3D"gma=
il_msg">
&gt;<br class=3D"gmail_msg">
&gt; # pvs<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG Fmt=C2=A0 Attr PSiz=
e=C2=A0 =C2=A0PFree<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0/dev/sda2=C2=A0 vg lvm2 a--=C2=A0 =C2=A0 1.82t=C2=A0 =C2=
=A01.10t<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0/dev/sdb2=C2=A0 vg lvm2 a--=C2=A0 =C2=A0 3.64t=C2=A0 =C2=
=A01.42t<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0/dev/sdc2=C2=A0 vg lvm2 a--=C2=A0 931.51g 195.18g<br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
Double-check in the metadata for MISSING. This is what I was hoping<br clas=
s=3D"gmail_msg">
might be in your /etc/lvm/backup file.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt;&gt; Actually, always run LVM commands with -v -t before really running=
 them.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Thanks! I had backed up the rmeta* and rimage*, so I didn&#39;t feel t=
he need<br class=3D"gmail_msg">
&gt; for using -t. Am I wrong?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Well, some nasty surprises may be avoidable (particularly if also using -f)=
.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; Yes, I&#39;ve noticed it. The problem was a faulty SATA cable (as I le=
arned<br class=3D"gmail_msg">
&gt; later), so when I switched the computer on for the first time, /dev/sd=
a was<br class=3D"gmail_msg">
&gt; missing (in the current device allocation). I switched off the compute=
r,<br class=3D"gmail_msg">
&gt; swapped the /dev/sda and /dev/sdb SATA cable (without thinking about t=
he<br class=3D"gmail_msg">
&gt; consequences) and switched it on. This time the /dev/sdb was missing. =
I<br class=3D"gmail_msg">
&gt; replaced the faulty cable with a new one and switched the machine back=
 on.<br class=3D"gmail_msg">
&gt; This time sda, sdb and sdc were all present, but the RAID went out-of-=
sync.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
In swapping the cables, you may have changed the sd{a,b,c} enumeration<br c=
lass=3D"gmail_msg">
but this will have no impact on the UUIDs that LVM uses to identify<br clas=
s=3D"gmail_msg">
the PVs.<br class=3D"gmail_msg"></blockquote><div>That&#39;s right, but the=
 images went out-of-sync because during the first boot only sdb and sdc wer=
e present (so the content of sda should have been implied), during the seco=
nd boot only sda and sdc were present (so the content of sdb should have be=
en implied), but when I replaced the cable there was a conflict between the=
se three.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
&gt; I&#39;m pretty sure there were very few (if any) writing operations du=
ring the<br class=3D"gmail_msg">
&gt; degraded operating mode, so the I could recover by rebuilding the old =
mirror<br class=3D"gmail_msg">
&gt; (sda) using the more recent ones (sdb and sdc).<br class=3D"gmail_msg"=
>
<br class=3D"gmail_msg">
Agreed, based on your check below.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; Thanks, I used your raid5_parity_check.cc utility with the default str=
ipe<br class=3D"gmail_msg">
&gt; size (64 * 1024), but it actually doesn&#39;t matter since you&#39;re =
just<br class=3D"gmail_msg">
&gt; calculating the total xor and the stripe size acts as a buffer size fo=
r<br class=3D"gmail_msg">
&gt; that.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
[I was little surprised to discover that RAID 6 works as a byte erasure cod=
e.]<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
The stripe size and layout matters once if you want to adapt the code<br cl=
ass=3D"gmail_msg">
to extract or repair the data.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; I get three unsynced stripes out of 512 (32 mib / 64 kib), but I would=
 like<br class=3D"gmail_msg">
&gt; to try to reconstruct the test_rimage_1 using h the other two. Just in=
 case,<br class=3D"gmail_msg">
&gt; here are the bad stripe numbers: 16, 48, 49.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
I&#39;ve updated the utility (this is for raid5 =3D raid5_ls). Warning: not=
<br class=3D"gmail_msg">
tested on out-of-sync data.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<a href=3D"https://drive.google.com/open?id=3D0B8dHrWSoVcaDYXlUWXEtZEMwX0E"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://drive.goo=
gle.com/open?id=3D0B8dHrWSoVcaDYXlUWXEtZEMwX0E</a></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
# Assume the first sub LV has the out-of-date data and dump the<br class=3D=
"gmail_msg">
correct(ed) LV content.<br class=3D"gmail_msg">
./foo stripe $((64*1024)) repair 0 /dev/${lv}_rimage_* | cmp - /dev/${lv}<b=
r class=3D"gmail_msg"></blockquote><div>Thanks!</div><div><br></div><div>I =
tried to reassemble the array using 3 different pairs of correct LV images,=
 but it doesn&#39;t work (I am sure because I cannot luksOpen a LUKS image =
which is in the LV, which is almost surely uncorrectable).<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br class=3D"gmail_msg">
&gt;&gt; &gt; The output of various commands is provided below.<br class=3D=
"gmail_msg">
&gt;&gt; &gt;<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0# lvs -a -o +devices<br class=3D"gmail_msg=
">
&gt;&gt; &gt;<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0r=
wi---r---=C2=A0 64.00m<br class=3D"gmail_msg">
&gt;&gt; &gt; test_rimage_0(0),test_rimage_1(0),test_rimage_2(0)<br class=
=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[test_rimage_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg=C2=A0 =C2=A0Iwi-a-r-r-=C2=A0 32.00m /dev/sd=
c2(1)<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[test_rimage_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg=C2=A0 =C2=A0Iwi-a-r-r-=C2=A0 32.00m<br clas=
s=3D"gmail_msg">
&gt;&gt; &gt; /dev/sda2(238244)<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[test_rimage_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vg=C2=A0 =C2=A0Iwi-a-r-r-=C2=A0 32.00m<br clas=
s=3D"gmail_msg">
&gt;&gt; &gt; /dev/sdb2(148612)<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[test_rmeta_0]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.0=
0m /dev/sdc2(0)<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[test_rmeta_1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.0=
0m<br class=3D"gmail_msg">
&gt;&gt; &gt; /dev/sda2(238243)<br class=3D"gmail_msg">
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[test_rmeta_2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vg=C2=A0 =C2=A0ewi-a-r-r-=C2=A0 =C2=A04.0=
0m<br class=3D"gmail_msg">
&gt;&gt; &gt; /dev/sdb2(148611)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
The extra r(efresh) attributes suggest trying a resync operation which<br c=
lass=3D"gmail_msg">
may not be possible on inactive LV.<br class=3D"gmail_msg">
I missed that the RAID device is actually in the list.<br class=3D"gmail_ms=
g">
<br class=3D"gmail_msg">
&gt; After cleaning the dmsetup table of test_* and trying to lvchange -ay =
I get<br class=3D"gmail_msg">
&gt; practically the same:<br class=3D"gmail_msg">
&gt; # lvchange -ay vg/test -v<br class=3D"gmail_msg">
[snip]<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0device-mapper: reload ioctl on (253:87) failed: Invalid ar=
gument<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0Removing vg-test (253:87)<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; device-mapper: table: 253:87: raid: Cannot change device positions in =
RAID<br class=3D"gmail_msg">
&gt; array<br class=3D"gmail_msg">
&gt; device-mapper: ioctl: error adding target to table<br class=3D"gmail_m=
sg">
<br class=3D"gmail_msg">
This error occurs when the sub LV metadata says &quot;I am device X in this=
<br class=3D"gmail_msg">
array&quot; but dmsetup is being asked to put the sub LV at different<br cl=
ass=3D"gmail_msg">
position Y (alas, neither are logged). With lots of -v and -d flags<br clas=
s=3D"gmail_msg">
you can get lvchange to include the dm table entries in the<br class=3D"gma=
il_msg">
diagnostics.<br class=3D"gmail_msg"></blockquote><div>This is as useful as =
it gets (-vvvv -dddd):</div><div><div>=C2=A0 =C2=A0 Loading vg-test_rmeta_0=
 table (253:35)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adding target to (253=
:35): 0 8192 linear 8:34 2048</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm tabl=
e =C2=A0 (253:35) [ opencount flush ] =C2=A0 [16384] (*1)</div><div>=C2=A0 =
=C2=A0 Suppressed vg-test_rmeta_0 (253:35) identical table reload.</div><di=
v>=C2=A0 =C2=A0 Loading vg-test_rimage_0 table (253:36)</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Adding target to (253:36): 0 65536 linear 8:34 10240</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm table =C2=A0 (253:36) [ opencount f=
lush ] =C2=A0 [16384] (*1)</div><div>=C2=A0 =C2=A0 Suppressed vg-test_rimag=
e_0 (253:36) identical table reload.</div><div>=C2=A0 =C2=A0 Loading vg-tes=
t_rmeta_1 table (253:37)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adding targe=
t to (253:37): 0 8192 linear 8:2 1951688704</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dm table =C2=A0 (253:37) [ opencount flush ] =C2=A0 [16384] (*1)</di=
v><div>=C2=A0 =C2=A0 Suppressed vg-test_rmeta_1 (253:37) identical table re=
load.</div><div>=C2=A0 =C2=A0 Loading vg-test_rimage_1 table (253:38)</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adding target to (253:38): 0 65536 linear =
8:2 1951696896</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm table =C2=A0 (253:3=
8) [ opencount flush ] =C2=A0 [16384] (*1)</div><div>=C2=A0 =C2=A0 Suppress=
ed vg-test_rimage_1 (253:38) identical table reload.</div><div>=C2=A0 =C2=
=A0 Loading vg-test_rmeta_2 table (253:39)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Adding target to (253:39): 0 8192 linear 8:18 1217423360</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm table =C2=A0 (253:39) [ opencount flush ] =
=C2=A0 [16384] (*1)</div><div>=C2=A0 =C2=A0 Suppressed vg-test_rmeta_2 (253=
:39) identical table reload.</div><div>=C2=A0 =C2=A0 Loading vg-test_rimage=
_2 table (253:40)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adding target to (2=
53:40): 0 65536 linear 8:18 1217431552</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dm table =C2=A0 (253:40) [ opencount flush ] =C2=A0 [16384] (*1)</div><=
div>=C2=A0 =C2=A0 Suppressed vg-test_rimage_2 (253:40) identical table relo=
ad.</div><div>=C2=A0 =C2=A0 Creating vg-test</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dm create vg-test LVM-Pgjp5f2PRJipxvoNdsYmq0olg9iWwY5pJjiPmiesfxvde=
F5zMvTsJC6vFfqNgNnZ [ noopencount flush ] =C2=A0 [16384] (*1)</div><div>=C2=
=A0 =C2=A0 Loading vg-test table (253:84)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Adding target to (253:84): 0 131072 raid raid5_ls 3 128 region_size =
1024 3 253:35 253:36 253:37 253:38 253:39 253:40</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dm table =C2=A0 (253:84) [ opencount flush ] =C2=A0 [16384] (=
*1)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm reload =C2=A0 (253:84) [ noope=
ncount flush ] =C2=A0 [16384] (*1)</div><div>=C2=A0 device-mapper: reload i=
octl on (253:84) failed: Invalid argument</div></div><div><br></div><div>I =
don&#39;t see any problems here.</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
You can check the rmeta superblocks with<br class=3D"gmail_msg">
<a href=3D"https://drive.google.com/open?id=3D0B8dHrWSoVcaDUk0wbHQzSEY3LTg"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://drive.goo=
gle.com/open?id=3D0B8dHrWSoVcaDUk0wbHQzSEY3LTg</a></blockquote><div>Thanks,=
 it&#39;s very useful!</div><div><br></div><div>/dev/mapper/vg-test_rmeta_0=
</div><div>found RAID superblock at offset 0</div><div>=C2=A0magic=3D168312=
3524</div><div>=C2=A0features=3D0</div><div>=C2=A0num_devices=3D3</div><div=
>=C2=A0array_position=3D0</div><div>=C2=A0events=3D56</div><div>=C2=A0faile=
d_devices=3D0</div><div>=C2=A0disk_recovery_offset=3D18446744073709551615</=
div><div>=C2=A0array_resync_offset=3D18446744073709551615</div><div>=C2=A0l=
evel=3D5</div><div>=C2=A0layout=3D2</div><div>=C2=A0stripe_sectors=3D128</d=
iv><div>found bitmap file superblock at offset 4096:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0magic: 6d746962</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0version: 4</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid: 00000000.0=
0000000.00000000.00000000</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 events: 56<=
/div><div>events cleared: 33</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ate: 00000000</div><div>=C2=A0 =C2=A0 =C2=A0chunksize: 524288 B</div><div>=
=C2=A0 daemon sleep: 5s</div><div>=C2=A0 =C2=A0 =C2=A0sync size: 32768 KB</=
div><div>max write behind: 0</div><div><br></div><div>/dev/mapper/vg-test_r=
meta_1</div><div>found RAID superblock at offset 0</div><div>=C2=A0magic=3D=
1683123524</div><div>=C2=A0features=3D0</div><div>=C2=A0num_devices=3D3</di=
v><div>=C2=A0array_position=3D4294967295</div><div>=C2=A0events=3D62</div><=
div>=C2=A0failed_devices=3D1</div><div>=C2=A0disk_recovery_offset=3D0</div>=
<div>=C2=A0array_resync_offset=3D18446744073709551615</div><div>=C2=A0level=
=3D5</div><div>=C2=A0layout=3D2</div><div>=C2=A0stripe_sectors=3D128</div><=
div>found bitmap file superblock at offset 4096:</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0magic: 6d746962</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0ve=
rsion: 4</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid: 00000000.000000=
00.00000000.00000000</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 events: 60</div>=
<div>events cleared: 33</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state: =
00000000</div><div>=C2=A0 =C2=A0 =C2=A0chunksize: 524288 B</div><div>=C2=A0=
 daemon sleep: 5s</div><div>=C2=A0 =C2=A0 =C2=A0sync size: 32768 KB</div><d=
iv>max write behind: 0</div><div><br></div><div>/dev/mapper/vg-test_rmeta_2=
</div><div>found RAID superblock at offset 0</div><div>=C2=A0magic=3D168312=
3524</div><div>=C2=A0features=3D0</div><div>=C2=A0num_devices=3D3</div><div=
>=C2=A0array_position=3D2</div><div>=C2=A0events=3D62</div><div>=C2=A0faile=
d_devices=3D1</div><div>=C2=A0disk_recovery_offset=3D18446744073709551615</=
div><div>=C2=A0array_resync_offset=3D18446744073709551615</div><div>=C2=A0l=
evel=3D5</div><div>=C2=A0layout=3D2</div><div>=C2=A0stripe_sectors=3D128</d=
iv><div>found bitmap file superblock at offset 4096:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0magic: 6d746962</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0version: 4</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid: 00000000.0=
0000000.00000000.00000000</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 events: 62<=
/div><div>events cleared: 33</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ate: 00000000</div><div>=C2=A0 =C2=A0 =C2=A0chunksize: 524288 B</div><div>=
=C2=A0 daemon sleep: 5s</div><div>=C2=A0 =C2=A0 =C2=A0sync size: 32768 KB</=
div><div>max write behind: 0=C2=A0</div><div><br></div><div>The problem I s=
ee here is that events count is different for the three rmetas.</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; Here is the relevant /etc/lvm/archive (archive is more recent that bac=
kup)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
That looks sane, but you omitted the physical volumes section so there<br c=
lass=3D"gmail_msg">
is no way to cross-check UUIDs and devices or see if there are MISSING<br c=
lass=3D"gmail_msg">
flags.<br class=3D"gmail_msg"></blockquote><div>The ids are the same and th=
ere are no MISSING flags.=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br class=3D"gmail_msg">
If you use<br class=3D"gmail_msg">
<a href=3D"https://drive.google.com/open?id=3D0B8dHrWSoVcaDQkU5NG1sLWc5cjg"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://drive.goo=
gle.com/open?id=3D0B8dHrWSoVcaDQkU5NG1sLWc5cjg</a><br class=3D"gmail_msg">
directly, you can get metadata that LVM is reading off the PVs and<br class=
=3D"gmail_msg">
double-check for discrepancies.=C2=A0</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
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
</blockquote></div></div>

--047d7bacb0a6590525053e734353--
