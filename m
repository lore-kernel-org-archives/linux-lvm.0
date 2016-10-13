Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9DKiJWx000526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2016 16:44:19 -0400
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 561AFC0567B5
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2016 20:44:17 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z190so7083632qkc.3
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2016 13:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANh6N61D51T9KjYSsh2WdKYPzjrPeVHOkv9JrL9_B4cRHw2USQ@mail.gmail.com>
	<CAE-HYsMjvbBXEoMHPF1gybwC-XVLequ4D7bzmzfmwJRjkGFhAA@mail.gmail.com>
	<CANh6N62PvwaTK4JXUpxmzfSbTY80Yc=f6c7JiKEfVhsXNL=9tw@mail.gmail.com>
	<CAE-HYsNiu1W8Wv9VH5KbPWq04OTyY9e1AkBg=-scb6R399sXrg@mail.gmail.com>
	<CANh6N62PTyFj5FmJz9iZF7f7dAx0CK=2HOovNk1bAWP9wZU4Mw@mail.gmail.com>
	<CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
In-Reply-To: <CAE-HYsPgRQiSQ_hMunSbJJgRkRGZLLEf1K5T2SA_zH8YhrfE8w@mail.gmail.com>
From: Slava Prisivko <vprisivko@gmail.com>
Message-ID: <CANh6N63xCnoFaX=njoaMF7_KGBNM3-_qdPjg6ErJxbVQ2K0KDg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7ba97312459c09053ec52ce9
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
Date: Thu, 13 Oct 2016 20:44:19 -0000
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--047d7ba97312459c09053ec52ce9
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2016 at 10:02 AM Giuliano Procida <
giuliano.procida@gmail.com> wrote:

> On 9 October 2016 at 20:00, Slava Prisivko <vprisivko@gmail.com> wrote:
>
> > I tried to reassemble the array using 3 different pairs of correct LV
>
> > images, but it doesn't work (I am sure because I cannot luksOpen a LUKS
>
> > image which is in the LV, which is almost surely uncorrectable).


>
>
> I would hope that a luks volume would at least be recognisable using
>
> file -s. If you extract the image data into a regular file you should
>
> be able to losetup that and then luksOpen the loop device.
>
Yes, it's recognizable. I can perform luksDump and luksOpen but for the
latter command the password just doesn't work. Well, cryptsetup works with
files just as well as with devices, so it doesn't help. But I tried just to
be sure and, quite naturally, it doesn't work either.

>
>
>
> > This is as useful as it gets (-vvvv -dddd):
>
> >     Loading vg-test_rmeta_0 table (253:35)
>
> >         Adding target to (253:35): 0 8192 linear 8:34 2048
>
> >         dm table   (253:35) [ opencount flush ]   [16384] (*1)
>
> >     Suppressed vg-test_rmeta_0 (253:35) identical table reload.
>
> >     Loading vg-test_rimage_0 table (253:36)
>
> >         Adding target to (253:36): 0 65536 linear 8:34 10240
>
> >         dm table   (253:36) [ opencount flush ]   [16384] (*1)
>
> >     Suppressed vg-test_rimage_0 (253:36) identical table reload.
>
> >     Loading vg-test_rmeta_1 table (253:37)
>
> >         Adding target to (253:37): 0 8192 linear 8:2 1951688704
>
> >         dm table   (253:37) [ opencount flush ]   [16384] (*1)
>
> >     Suppressed vg-test_rmeta_1 (253:37) identical table reload.
>
> >     Loading vg-test_rimage_1 table (253:38)
>
> >         Adding target to (253:38): 0 65536 linear 8:2 1951696896
>
> >         dm table   (253:38) [ opencount flush ]   [16384] (*1)
>
> >     Suppressed vg-test_rimage_1 (253:38) identical table reload.
>
> >     Loading vg-test_rmeta_2 table (253:39)
>
> >         Adding target to (253:39): 0 8192 linear 8:18 1217423360
>
> >         dm table   (253:39) [ opencount flush ]   [16384] (*1)
>
> >     Suppressed vg-test_rmeta_2 (253:39) identical table reload.
>
> >     Loading vg-test_rimage_2 table (253:40)
>
> >         Adding target to (253:40): 0 65536 linear 8:18 1217431552
>
> >         dm table   (253:40) [ opencount flush ]   [16384] (*1)
>
> >     Suppressed vg-test_rimage_2 (253:40) identical table reload.
>
> >     Creating vg-test
>
> >         dm create vg-test
>
> > LVM-Pgjp5f2PRJipxvoNdsYmq0olg9iWwY5pJjiPmiesfxvdeF5zMvTsJC6vFfqNgNnZ [
>
> > noopencount flush ]   [16384] (*1)
>
> >     Loading vg-test table (253:84)
>
> >         Adding target to (253:84): 0 131072 raid raid5_ls 3 128
> region_size
>
> > 1024 3 253:35 253:36 253:37 253:38 253:39 253:40
>
> >         dm table   (253:84) [ opencount flush ]   [16384] (*1)
>
> >         dm reload   (253:84) [ noopencount flush ]   [16384] (*1)
>
> >   device-mapper: reload ioctl on (253:84) failed: Invalid argument
>
> >
>
> > I don't see any problems here.
>
>
>
> In my case I got (for example, and Gmail is going to fold the lines,
> sorry):
>
>
>
> [...]
>
>     Loading vg0-photos table (254:45)
>
>         Adding target to (254:45): 0 1258291200 raid raid6_zr 3 128
>
> region_size 1024 5 254:73 254:74 254:37 254:38 254:39 254:40 254:41
>
> 254:42 254:43 254:44
>
>         dm table   (254:45) [ opencount flush ]   [16384] (*1)
>
>         dm reload   (254:45) [ noopencount flush ]   [16384] (*1)
>
>   device-mapper: reload ioctl on (254:45) failed: Invalid argument
>
>
>
> The actual errors are in the kernel logs:
>
>
>
> [...]
>
> [144855.931712] device-mapper: raid: New device injected into existing
>
> array without 'rebuild' parameter specified
>
> [144855.935523] device-mapper: table: 254:45: raid: Unable to assemble
>
> array: Invalid superblocks
>
> [144855.939290] device-mapper: ioctl: error adding target to table
>

I had the following the first time:
[   74.743051] device-mapper: raid: Failed to read superblock of device at
position 1
[   74.761094] md/raid:mdX: device dm-73 operational as raid disk 2
[   74.765707] md/raid:mdX: device dm-67 operational as raid disk 0
[   74.770911] md/raid:mdX: allocated 3219kB
[   74.773571] md/raid:mdX: raid level 5 active with 2 out of 3 devices,
algorithm 2
[   74.775964] RAID conf printout:
[   74.775968]  --- level:5 rd:3 wd:2
[   74.775971]  disk 0, o:1, dev:dm-67
[   74.775973]  disk 2, o:1, dev:dm-73
[   74.793120] created bitmap (1 pages) for device mdX
[   74.822333] mdX: bitmap initialized from disk: read 1 pages, set 2 of 64
bits

After that I had only the previously mentioned errors in the kernel log:

device-mapper: table: 253:84: raid: Cannot change device positions in RAID
array
device-mapper: ioctl: error adding target to table

>
>
>
> 128 means 128*512 so this is 64k as in your case. I was able to verify
>
> that my extracted images matched the RAID device. My problem was not
>
> assembling the array, it was that the array would be rebuilt on every
>
> subsequent use:
>
>
>
>     Loading vg0-var table (254:21)
>
>         Adding target to (254:21): 0 52428800 raid raid5_ls 5 128
>
> region_size 1024 rebuild 0 5 254:11 254:12 254:13 254:14 254:15 254:16
>
> 254:17 254:18 254:19 254:20
>
>         dm table   (254:21) [ opencount flush ]   [16384] (*1)
>
>         dm reload   (254:21) [ noopencount flush ]   [16384] (*1)
>
>         Table size changed from 0 to 52428800 for vg0-var (254:21).
>
>
>
> >> You can check the rmeta superblocks with
>
> >> https://drive.google.com/open?id=0B8dHrWSoVcaDUk0wbHQzSEY3LTg
>
> >
>
> > Thanks, it's very useful!
>
> >
>
> > /dev/mapper/vg-test_rmeta_0
>
> > found RAID superblock at offset 0
>
> >  magic=1683123524
>
> >  features=0
>
> >  num_devices=3
>
> >  array_position=0
>
> >  events=56
>
> >  failed_devices=0
>
> >  disk_recovery_offset=18446744073709551615
>
> >  array_resync_offset=18446744073709551615
>
> >  level=5
>
> >  layout=2
>
> >  stripe_sectors=128
>
> > found bitmap file superblock at offset 4096:
>
> >          magic: 6d746962
>
> >        version: 4
>
> >           uuid: 00000000.00000000.00000000.00000000
>
> >         events: 56
>
> > events cleared: 33
>
> >          state: 00000000
>
> >      chunksize: 524288 B
>
> >   daemon sleep: 5s
>
> >      sync size: 32768 KB
>
> > max write behind: 0
>
> >
>
> > /dev/mapper/vg-test_rmeta_1
>
> > found RAID superblock at offset 0
>
> >  magic=1683123524
>
> >  features=0
>
> >  num_devices=3
>
> >  array_position=4294967295
>
> >  events=62
>
> >  failed_devices=1
>
> >  disk_recovery_offset=0
>
> >  array_resync_offset=18446744073709551615
>
> >  level=5
>
> >  layout=2
>
> >  stripe_sectors=128
>
> > found bitmap file superblock at offset 4096:
>
> >          magic: 6d746962
>
> >        version: 4
>
> >           uuid: 00000000.00000000.00000000.00000000
>
> >         events: 60
>
> > events cleared: 33
>
> >          state: 00000000
>
> >      chunksize: 524288 B
>
> >   daemon sleep: 5s
>
> >      sync size: 32768 KB
>
> > max write behind: 0
>
> >
>
> > /dev/mapper/vg-test_rmeta_2
>
> > found RAID superblock at offset 0
>
> >  magic=1683123524
>
> >  features=0
>
> >  num_devices=3
>
> >  array_position=2
>
> >  events=62
>
> >  failed_devices=1
>
> >  disk_recovery_offset=18446744073709551615
>
> >  array_resync_offset=18446744073709551615
>
> >  level=5
>
> >  layout=2
>
> >  stripe_sectors=128
>
> > found bitmap file superblock at offset 4096:
>
> >          magic: 6d746962
>
> >        version: 4
>
> >           uuid: 00000000.00000000.00000000.00000000
>
> >         events: 62
>
> > events cleared: 33
>
> >          state: 00000000
>
> >      chunksize: 524288 B
>
> >   daemon sleep: 5s
>
> >      sync size: 32768 KB
>
> > max write behind: 0
>
> >
>
> > The problem I see here is that events count is different for the three
>
> > rmetas.
>
>
>
> The event counts relate to the intent bitmap (I believe).
>
>
>
> That looks OK, because failed devices is 1, meaning 0b0...01; i.e.,
>
> device 0 of the array is "failed". The real problem is device 1 which
>
> has
>
>
>
> >  array_position=4294967295
>
>
>
> This should be 1 instead. This is 32-bit unsigned 0xf...f. It may be
>
> that it has special significance in kernel or LVM code. I've not
>
> checked beyond noticing one test: role < 0.
>
>
>
> I recommend using diff3 or pairwise diff on the metadata dumps to
>
> ensure you have not missed any other differences.
>
>
>
> One possible way forward:
>
>
>
> (Optionally) adapt my resync code so it writes back to the original
>
> files instead instead of outputting corrected linear data.
>
>
>
> Modify the rmeta data to remove the failed flag and reset the bad
>
> position to the correct value. sync and power off (or otherwise
>
> prevent the device mapper from writing back bad data).
>
>
>
> It's possible the RAID volume will fail to sync due to bitmap
>
> inconsistencies. I don't know how to re-write the superblocks to say
>
> "trust me, all data are in sync".
>
Thanks for the tip! But could it help me if the manual data reassembly
using your code doesn't work? I don't understand what metadata could do to
fix that.

>
>
>
> _______________________________________________
>
> linux-lvm mailing list
>
> linux-lvm@redhat.com
>
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--047d7ba97312459c09053ec52ce9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 12=
, 2016 at 10:02 AM Giuliano Procida &lt;<a href=3D"mailto:giuliano.procida@=
gmail.com">giuliano.procida@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 9 October 2016 at 20:00, Slava Pris=
ivko &lt;<a href=3D"mailto:vprisivko@gmail.com" class=3D"gmail_msg" target=
=3D"_blank">vprisivko@gmail.com</a>&gt; wrote:<br class=3D"gmail_msg"><br>&=
gt; I tried to reassemble the array using 3 different pairs of correct LV<b=
r class=3D"gmail_msg"><br>&gt; images, but it doesn&#39;t work (I am sure b=
ecause I cannot luksOpen a LUKS<br class=3D"gmail_msg"><br>&gt; image which=
 is in the LV, which is almost surely uncorrectable).=C2=A0</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br><br class=3D"gmail_msg">=
<br>I would hope that a luks volume would at least be recognisable using<br=
 class=3D"gmail_msg"><br>file -s. If you extract the image data into a regu=
lar file you should<br class=3D"gmail_msg"><br>be able to losetup that and =
then luksOpen the loop device.<br class=3D"gmail_msg"></blockquote><div>Yes=
, it&#39;s recognizable. I can perform luksDump and luksOpen but for the la=
tter command the password just doesn&#39;t work. Well, cryptsetup works wit=
h files just as well as with devices, so it doesn&#39;t help. But I tried j=
ust to be sure and, quite naturally, it doesn&#39;t work either.</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br><br class=3D"gmail_msg"><b=
r>&gt; This is as useful as it gets (-vvvv -dddd):<br class=3D"gmail_msg"><=
br>&gt;=C2=A0 =C2=A0 =C2=A0Loading vg-test_rmeta_0 table (253:35)<br class=
=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Adding target to (=
253:35): 0 8192 linear 8:34 2048<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dm table=C2=A0 =C2=A0(253:35) [ opencount flush ]=
=C2=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=
=A0Suppressed vg-test_rmeta_0 (253:35) identical table reload.<br class=3D"=
gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0Loading vg-test_rimage_0 table (253:=
36)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Adding=
 target to (253:36): 0 65536 linear 8:34 10240<br class=3D"gmail_msg"><br>&=
gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm table=C2=A0 =C2=A0(253:36) [ openco=
unt flush ]=C2=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =
=C2=A0 =C2=A0Suppressed vg-test_rimage_0 (253:36) identical table reload.<b=
r class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0Loading vg-test_rmeta_1 t=
able (253:37)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Adding target to (253:37): 0 8192 linear 8:2 1951688704<br class=3D"g=
mail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm table=C2=A0 =C2=A0(2=
53:37) [ opencount flush ]=C2=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg">=
<br>&gt;=C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rmeta_1 (253:37) identical t=
able reload.<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0Loading vg-=
test_rimage_1 table (253:38)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Adding target to (253:38): 0 65536 linear 8:2 195169689=
6<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm table=
=C2=A0 =C2=A0(253:38) [ opencount flush ]=C2=A0 =C2=A0[16384] (*1)<br class=
=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0Suppressed vg-test_rimage_1 (253=
:38) identical table reload.<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =
=C2=A0Loading vg-test_rmeta_2 table (253:39)<br class=3D"gmail_msg"><br>&gt=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Adding target to (253:39): 0 8192 linear=
 8:18 1217423360<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dm table=C2=A0 =C2=A0(253:39) [ opencount flush ]=C2=A0 =C2=A0[16384=
] (*1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0Suppressed vg-tes=
t_rmeta_2 (253:39) identical table reload.<br class=3D"gmail_msg"><br>&gt;=
=C2=A0 =C2=A0 =C2=A0Loading vg-test_rimage_2 table (253:40)<br class=3D"gma=
il_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Adding target to (253:40)=
: 0 65536 linear 8:18 1217431552<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dm table=C2=A0 =C2=A0(253:40) [ opencount flush ]=
=C2=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=
=A0Suppressed vg-test_rimage_2 (253:40) identical table reload.<br class=3D=
"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0Creating vg-test<br class=3D"gmail_=
msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm create vg-test<br class=
=3D"gmail_msg"><br>&gt; LVM-Pgjp5f2PRJipxvoNdsYmq0olg9iWwY5pJjiPmiesfxvdeF5=
zMvTsJC6vFfqNgNnZ [<br class=3D"gmail_msg"><br>&gt; noopencount flush ]=C2=
=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0L=
oading vg-test table (253:84)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Adding target to (253:84): 0 131072 raid raid5_ls 3 128=
 region_size<br class=3D"gmail_msg"><br>&gt; 1024 3 253:35 253:36 253:37 25=
3:38 253:39 253:40<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dm table=C2=A0 =C2=A0(253:84) [ opencount flush ]=C2=A0 =C2=A0[16=
384] (*1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
dm reload=C2=A0 =C2=A0(253:84) [ noopencount flush ]=C2=A0 =C2=A0[16384] (*=
1)<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0device-mapper: reload ioctl =
on (253:84) failed: Invalid argument<br class=3D"gmail_msg"><br>&gt;<br cla=
ss=3D"gmail_msg"><br>&gt; I don&#39;t see any problems here.<br class=3D"gm=
ail_msg"><br><br class=3D"gmail_msg"><br>In my case I got (for example, and=
 Gmail is going to fold the lines, sorry):<br class=3D"gmail_msg"><br><br c=
lass=3D"gmail_msg"><br>[...]<br class=3D"gmail_msg"><br>=C2=A0 =C2=A0 Loadi=
ng vg0-photos table (254:45)<br class=3D"gmail_msg"><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Adding target to (254:45): 0 1258291200 raid raid6_zr 3 128<br c=
lass=3D"gmail_msg"><br>region_size 1024 5 254:73 254:74 254:37 254:38 254:3=
9 254:40 254:41<br class=3D"gmail_msg"><br>254:42 254:43 254:44<br class=3D=
"gmail_msg"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 dm table=C2=A0 =C2=A0(254:45) [=
 opencount flush ]=C2=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 dm reload=C2=A0 =C2=A0(254:45) [ noopencount flush=
 ]=C2=A0 =C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>=C2=A0 device-mapper=
: reload ioctl on (254:45) failed: Invalid argument<br class=3D"gmail_msg">=
<br><br class=3D"gmail_msg"><br>The actual errors are in the kernel logs:<b=
r class=3D"gmail_msg"><br><br class=3D"gmail_msg"><br>[...]<br class=3D"gma=
il_msg"><br>[144855.931712] device-mapper: raid: New device injected into e=
xisting<br class=3D"gmail_msg"><br>array without &#39;rebuild&#39; paramete=
r specified<br class=3D"gmail_msg"><br>[144855.935523] device-mapper: table=
: 254:45: raid: Unable to assemble<br class=3D"gmail_msg"><br>array: Invali=
d superblocks<br class=3D"gmail_msg"><br>[144855.939290] device-mapper: ioc=
tl: error adding target to table<br class=3D"gmail_msg"></blockquote><div><=
br></div><div>I had the following the first time:</div><div>[ =C2=A0 74.743=
051] device-mapper: raid: Failed to read superblock of device at position 1=
</div><div>[ =C2=A0 74.761094] md/raid:mdX: device dm-73 operational as rai=
d disk 2</div><div>[ =C2=A0 74.765707] md/raid:mdX: device dm-67 operationa=
l as raid disk 0</div><div>[ =C2=A0 74.770911] md/raid:mdX: allocated 3219k=
B</div><div>[ =C2=A0 74.773571] md/raid:mdX: raid level 5 active with 2 out=
 of 3 devices, algorithm 2</div><div>[ =C2=A0 74.775964] RAID conf printout=
:</div><div>[ =C2=A0 74.775968] =C2=A0--- level:5 rd:3 wd:2</div><div>[ =C2=
=A0 74.775971] =C2=A0disk 0, o:1, dev:dm-67</div><div>[ =C2=A0 74.775973] =
=C2=A0disk 2, o:1, dev:dm-73</div><div>[ =C2=A0 74.793120] created bitmap (=
1 pages) for device mdX</div><div>[ =C2=A0 74.822333] mdX: bitmap initializ=
ed from disk: read 1 pages, set 2 of 64 bits=C2=A0</div><div><br></div><div=
>After that I had only the previously mentioned errors in the kernel log:</=
div><div><br></div><div><div>device-mapper: table: 253:84: raid: Cannot cha=
nge device positions in RAID array</div><div>device-mapper: ioctl: error ad=
ding target to table</div></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br><br class=3D"gmail_msg"><br>128 means 128*512 so this is 64k as =
in your case. I was able to verify<br class=3D"gmail_msg"><br>that my extra=
cted images matched the RAID device. My problem was not<br class=3D"gmail_m=
sg"><br>assembling the array, it was that the array would be rebuilt on eve=
ry<br class=3D"gmail_msg"><br>subsequent use:<br class=3D"gmail_msg"><br><b=
r class=3D"gmail_msg"><br>=C2=A0 =C2=A0 Loading vg0-var table (254:21)<br c=
lass=3D"gmail_msg"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adding target to (254:21=
): 0 52428800 raid raid5_ls 5 128<br class=3D"gmail_msg"><br>region_size 10=
24 rebuild 0 5 254:11 254:12 254:13 254:14 254:15 254:16<br class=3D"gmail_=
msg"><br>254:17 254:18 254:19 254:20<br class=3D"gmail_msg"><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dm table=C2=A0 =C2=A0(254:21) [ opencount flush ]=C2=A0 =
=C2=A0[16384] (*1)<br class=3D"gmail_msg"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
m reload=C2=A0 =C2=A0(254:21) [ noopencount flush ]=C2=A0 =C2=A0[16384] (*1=
)<br class=3D"gmail_msg"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Table size changed=
 from 0 to 52428800 for vg0-var (254:21).<br class=3D"gmail_msg"><br><br cl=
ass=3D"gmail_msg"><br>&gt;&gt; You can check the rmeta superblocks with<br =
class=3D"gmail_msg"><br>&gt;&gt;<span class=3D"inbox-inbox-Apple-converted-=
space">=C2=A0</span><a href=3D"https://drive.google.com/open?id=3D0B8dHrWSo=
VcaDUk0wbHQzSEY3LTg" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blan=
k">https://drive.google.com/open?id=3D0B8dHrWSoVcaDUk0wbHQzSEY3LTg</a><br c=
lass=3D"gmail_msg"><br>&gt;<br class=3D"gmail_msg"><br>&gt; Thanks, it&#39;=
s very useful!<br class=3D"gmail_msg"><br>&gt;<br class=3D"gmail_msg"><br>&=
gt; /dev/mapper/vg-test_rmeta_0<br class=3D"gmail_msg"><br>&gt; found RAID =
superblock at offset 0<br class=3D"gmail_msg"><br>&gt;=C2=A0 magic=3D168312=
3524<br class=3D"gmail_msg"><br>&gt;=C2=A0 features=3D0<br class=3D"gmail_m=
sg"><br>&gt;=C2=A0 num_devices=3D3<br class=3D"gmail_msg"><br>&gt;=C2=A0 ar=
ray_position=3D0<br class=3D"gmail_msg"><br>&gt;=C2=A0 events=3D56<br class=
=3D"gmail_msg"><br>&gt;=C2=A0 failed_devices=3D0<br class=3D"gmail_msg"><br=
>&gt;=C2=A0 disk_recovery_offset=3D18446744073709551615<br class=3D"gmail_m=
sg"><br>&gt;=C2=A0 array_resync_offset=3D18446744073709551615<br class=3D"g=
mail_msg"><br>&gt;=C2=A0 level=3D5<br class=3D"gmail_msg"><br>&gt;=C2=A0 la=
yout=3D2<br class=3D"gmail_msg"><br>&gt;=C2=A0 stripe_sectors=3D128<br clas=
s=3D"gmail_msg"><br>&gt; found bitmap file superblock at offset 4096:<br cl=
ass=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 magic: 6d74696=
2<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 4<br =
class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid: =
00000000.00000000.00000000.00000000<br class=3D"gmail_msg"><br>&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0events: 56<br class=3D"gmail_msg"><br>&gt; event=
s cleared: 33<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 state: 00000000<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =
chunksize: 524288 B<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0daemon slee=
p: 5s<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 sync size: 32768 =
KB<br class=3D"gmail_msg"><br>&gt; max write behind: 0<br class=3D"gmail_ms=
g"><br>&gt;<br class=3D"gmail_msg"><br>&gt; /dev/mapper/vg-test_rmeta_1<br =
class=3D"gmail_msg"><br>&gt; found RAID superblock at offset 0<br class=3D"=
gmail_msg"><br>&gt;=C2=A0 magic=3D1683123524<br class=3D"gmail_msg"><br>&gt=
;=C2=A0 features=3D0<br class=3D"gmail_msg"><br>&gt;=C2=A0 num_devices=3D3<=
br class=3D"gmail_msg"><br>&gt;=C2=A0 array_position=3D4294967295<br class=
=3D"gmail_msg"><br>&gt;=C2=A0 events=3D62<br class=3D"gmail_msg"><br>&gt;=
=C2=A0 failed_devices=3D1<br class=3D"gmail_msg"><br>&gt;=C2=A0 disk_recove=
ry_offset=3D0<br class=3D"gmail_msg"><br>&gt;=C2=A0 array_resync_offset=3D1=
8446744073709551615<br class=3D"gmail_msg"><br>&gt;=C2=A0 level=3D5<br clas=
s=3D"gmail_msg"><br>&gt;=C2=A0 layout=3D2<br class=3D"gmail_msg"><br>&gt;=
=C2=A0 stripe_sectors=3D128<br class=3D"gmail_msg"><br>&gt; found bitmap fi=
le superblock at offset 4096:<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 magic: 6d746962<br class=3D"gmail_msg"><br>&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 version: 4<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid: 00000000.00000000.00000000.00000000<br=
 class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0events: 60<b=
r class=3D"gmail_msg"><br>&gt; events cleared: 33<br class=3D"gmail_msg"><b=
r>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state: 00000000<br class=3D"gmail_=
msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 chunksize: 524288 B<br class=3D"gmail_msg=
"><br>&gt;=C2=A0 =C2=A0daemon sleep: 5s<br class=3D"gmail_msg"><br>&gt;=C2=
=A0 =C2=A0 =C2=A0 sync size: 32768 KB<br class=3D"gmail_msg"><br>&gt; max w=
rite behind: 0<br class=3D"gmail_msg"><br>&gt;<br class=3D"gmail_msg"><br>&=
gt; /dev/mapper/vg-test_rmeta_2<br class=3D"gmail_msg"><br>&gt; found RAID =
superblock at offset 0<br class=3D"gmail_msg"><br>&gt;=C2=A0 magic=3D168312=
3524<br class=3D"gmail_msg"><br>&gt;=C2=A0 features=3D0<br class=3D"gmail_m=
sg"><br>&gt;=C2=A0 num_devices=3D3<br class=3D"gmail_msg"><br>&gt;=C2=A0 ar=
ray_position=3D2<br class=3D"gmail_msg"><br>&gt;=C2=A0 events=3D62<br class=
=3D"gmail_msg"><br>&gt;=C2=A0 failed_devices=3D1<br class=3D"gmail_msg"><br=
>&gt;=C2=A0 disk_recovery_offset=3D18446744073709551615<br class=3D"gmail_m=
sg"><br>&gt;=C2=A0 array_resync_offset=3D18446744073709551615<br class=3D"g=
mail_msg"><br>&gt;=C2=A0 level=3D5<br class=3D"gmail_msg"><br>&gt;=C2=A0 la=
yout=3D2<br class=3D"gmail_msg"><br>&gt;=C2=A0 stripe_sectors=3D128<br clas=
s=3D"gmail_msg"><br>&gt; found bitmap file superblock at offset 4096:<br cl=
ass=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 magic: 6d74696=
2<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: 4<br =
class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid: =
00000000.00000000.00000000.00000000<br class=3D"gmail_msg"><br>&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0events: 62<br class=3D"gmail_msg"><br>&gt; event=
s cleared: 33<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 state: 00000000<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 =
chunksize: 524288 B<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0daemon slee=
p: 5s<br class=3D"gmail_msg"><br>&gt;=C2=A0 =C2=A0 =C2=A0 sync size: 32768 =
KB<br class=3D"gmail_msg"><br>&gt; max write behind: 0<br class=3D"gmail_ms=
g"><br>&gt;<br class=3D"gmail_msg"><br>&gt; The problem I see here is that =
events count is different for the three<br class=3D"gmail_msg"><br>&gt; rme=
tas.<br class=3D"gmail_msg"><br><br class=3D"gmail_msg"><br>The event count=
s relate to the intent bitmap (I believe).<br class=3D"gmail_msg"><br><br c=
lass=3D"gmail_msg"><br>That looks OK, because failed devices is 1, meaning =
0b0...01; i.e.,<br class=3D"gmail_msg"><br>device 0 of the array is &quot;f=
ailed&quot;. The real problem is device 1 which<br class=3D"gmail_msg"><br>=
has<br class=3D"gmail_msg"><br><br class=3D"gmail_msg"><br>&gt;=C2=A0 array=
_position=3D4294967295<br class=3D"gmail_msg"><br><br class=3D"gmail_msg"><=
br>This should be 1 instead. This is 32-bit unsigned 0xf...f. It may be<br =
class=3D"gmail_msg"><br>that it has special significance in kernel or LVM c=
ode. I&#39;ve not<br class=3D"gmail_msg"><br>checked beyond noticing one te=
st: role &lt; 0.<br class=3D"gmail_msg"><br><br class=3D"gmail_msg"><br>I r=
ecommend using diff3 or pairwise diff on the metadata dumps to<br class=3D"=
gmail_msg"><br>ensure you have not missed any other differences.<br class=
=3D"gmail_msg"><br><br class=3D"gmail_msg"><br>One possible way forward:<br=
 class=3D"gmail_msg"><br><br class=3D"gmail_msg"><br>(Optionally) adapt my =
resync code so it writes back to the original<br class=3D"gmail_msg"><br>fi=
les instead instead of outputting corrected linear data.<br class=3D"gmail_=
msg"><br><br class=3D"gmail_msg"><br>Modify the rmeta data to remove the fa=
iled flag and reset the bad<br class=3D"gmail_msg"><br>position to the corr=
ect value. sync and power off (or otherwise<br class=3D"gmail_msg"><br>prev=
ent the device mapper from writing back bad data).<br class=3D"gmail_msg"><=
br><br class=3D"gmail_msg"><br>It&#39;s possible the RAID volume will fail =
to sync due to bitmap<br class=3D"gmail_msg"><br>inconsistencies. I don&#39=
;t know how to re-write the superblocks to say<br class=3D"gmail_msg"><br>&=
quot;trust me, all data are in sync&quot;.<br class=3D"gmail_msg"></blockqu=
ote><div>Thanks for the tip! But could it help me if the manual data reasse=
mbly using your code doesn&#39;t work? I don&#39;t understand what metadata=
 could do to fix that.</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br><br class=3D"gmail_msg"><br>________________________________________=
_______<br class=3D"gmail_msg"><br>linux-lvm mailing list<br class=3D"gmail=
_msg"><br><a href=3D"mailto:linux-lvm@redhat.com" class=3D"gmail_msg" targe=
t=3D"_blank">linux-lvm@redhat.com</a><br class=3D"gmail_msg"><br><a href=3D=
"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"noreferrer" clas=
s=3D"gmail_msg" target=3D"_blank">https://www.redhat.com/mailman/listinfo/l=
inux-lvm</a><br class=3D"gmail_msg"><br>read the LVM HOW-TO at<span class=
=3D"inbox-inbox-Apple-converted-space">=C2=A0</span><a href=3D"http://tldp.=
org/HOWTO/LVM-HOWTO/" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_bla=
nk">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockquote></div></div>

--047d7ba97312459c09053ec52ce9--
