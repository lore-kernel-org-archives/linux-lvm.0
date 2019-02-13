Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 166AC5C21F
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2019 21:41:52 +0000 (UTC)
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
	[209.85.217.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BB9DE6A9E
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2019 21:41:52 +0000 (UTC)
Received: by mail-vs1-f71.google.com with SMTP id c1so997274vsq.23
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2019 13:41:52 -0800 (PST)
MIME-Version: 1.0
References: <CAMRbyyv5qcsqmmP0uk+hEBmZJfZ-stV7XWUH23eJDnNMZYs7QA@mail.gmail.com>
	<20190204162527.GA2896@redhat.com>
	<2837066.rp6GCmz5LT@localhost.localdomain>
	<20190213203958.GA9718@redhat.com>
In-Reply-To: <20190213203958.GA9718@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 13 Feb 2019 23:41:39 +0200
Message-ID: <CAMRbyytH4AHLZy3E0g3m5q+tyESiX5Qxa5J0_oeYW=iFktuq0Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d602630581cd685f"
Subject: Re: [linux-lvm] Mixing devices with different logical or physical
 block size in oVirt LVM based storage
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Denis Chaplygin <dchaplyg@redhat.com>, Vojtech Juranek <vjuranek@redhat.com>, David Teigland <teigland@redhat.com>, linux-lvm@redhat.com

--000000000000d602630581cd685f
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 13, 2019 at 10:40 PM Mike Snitzer <snitzer@redhat.com> wrote:

> On Wed, Feb 13 2019 at  4:14am -0500,
> Vojtech Juranek <vjuranek@redhat.com> wrote:
>
> > Hi Mike,
> >
> > >
> > > Nir Soffer <nsoffer@redhat.com> wrote:
> > > >    We working on enabling 4k block size in oVirt block storage
> domain,
> > > >    built
> > > >    using VG
> > > >    on multipath devices on shared storage.
> > > >
> > > >    We have incomplete support for 4k, added in 2011, for this bug:
> > > >        [1]https://bugzilla.redhat.com/732980
> > > >
> > > >    When creating or extending a VG, we check that all PVs are using
> same
> > > >    logical and
> > > >    phyisical block size, and we store both logical and physical
> block size
> > > >    in
> > > >    the VG tags.
> > > >    We get the block sizes from
> > > >    /sys/block/dm-X/queue/{logical,physical}_block_size.
> > > >    We also enforce that device physical block size is not smaller
> than
> > > >    logical block size,
> > > >    This check was added in this patch, trying to enable block size
> != 512.
> > > >    There is no
> > > >    explanation in the patch or in the review comments why we need to
> > > >    validate
> > > >    this.
> > > >
> > > >    [2]
> https://github.com/oVirt/vdsm/commit/7e79153705891a91a06eb31cd642fb2
> > > >    09d10ff86 When we start to use a VG, we validate that all the
> devices
> > > >    are using the stored logical
> > > >    and physical block size.
> > > >    In vdsm itself, we use the logical block size to manage vdsm
> metadata,
> > > >    assuming that writing
> > > >    and reading one block of logical block size bytes is atomic, and
> we can
> > > >    read and write
> > > >    different blocks from different hosts at the same time.
> > > >    The relevant code validating PV block sizes is here:
> > > >
> > > >    [3]
> https://github.com/oVirt/vdsm/blob/8b043e402f41d8a82b9f832be5f582b85
> > > >    20b38bc/lib/vdsm/storage/lvm.py#L1110 Reading the comments in bug
> > > >    732980, I don't see anything about physical block size. It looks
> > > >    like this is unnecessary check, and we should check only the
> logical
> > > >    block
> > > >    size.
> > > >    Regarding mixing devices with different logical block size,
> according
> > > >    to
> > > >
> > > >        [4]https://bugzilla.redhat.com/show_bug.cgi?id=732980#c8
> > > >
> > > >    We should not extend an LV over devices with different block
> size, as
> > > >    this
> > > >    will change the device
> > > >    logical block size (e.g change from 512 to 4k), and the change may
> > > >    break
> > > >    the upper layer that
> > > >    already use the device and assume the previous logical block size.
> > >
> > > This idea that 4K writes to a 512b physical drive aren't going to be
> > > atomic, and that that is going to be the basis for some upper level
> > > failure is handwaving and overly paranoid TBH.
> > >
> > > >    Based on this, I think we are ok with limiting VG to devices with
> same
> > > >    logical block size, so any
> > > >    LV can be extended to any device.
> > > >    I think this code should change to:
> > > >    1. When creating a VG, check that all PVs use the same logical
> block
> > > >    size
> > > >    2. Store the logical block size in the VG tag
> > > >    3. When extending the VG, check that the new PVs use the same
> logical
> > > >    block size
> > > >    4. When starting to use a VG, check that stored logical block size
> > > >    matches
> > > >    PVs logical block size
> > > >    What do you think?
> > >
> > > I think you shouldn't care.  Or please show me a case where all this
> > > concern matters.
> >
> > I'm sorry, but I'm still quite confused what needs to be checked and
> what not.
> >
> > In [1] you wrote
> >
> > "So the appropriate VDSM constraint is to not allow a larger
> > logical_block_size device (4K) to be added to a VG that has only ever
> > contained small logical_block_size (512b) devices."
> >
> > and
> >
> > "If an LV is already in use then the admin needs to avoid extending the
> LV in
> > a way that upper layers may get upset with."
> >
> > and here that we shouldn't care. Could you be please more specific what
> one
> > needs to check (regarding block sizes) when creating or extending VG and
> start
> > using it?
> >
> > Thanks
> > Vojta
> >
> > [1] https://bugzilla.redhat.com/show_bug.cgi?id=732980
>
> Ha, only going back 8 years in the archive for that BZ!
>

Thanks for looking at this.

I'd need to revisit all the details of what VDSM/oVirt are so concerned
> about relative to just _always_ using 4K for the sanlock volumes.
>

For sanlock volumes we don't care, we trust David to get this right :-)

The issue is vdsm metadata.

My contention is the constraint likely wasn't ever _really_ needed.  But
> maybe it was.. again, I'll look back at the BZ in more detail to see
> what I'm missing.
>
> Concerns about 4K issued to 512b physical devices _not_ being atomic
> (could have 5 of the 8 512b written, so old 3 bytes could cause
> issues).  IIRC I shared those concerns with Martin Petersen before
> (Martin is an upstream Linux SCSI maintainer) and he felt the atomicity
> concerns were overstated.  Thinking now, it was possibly for devices
> that advertise 4K physical and 512b logical.  Whereas issuing 4K to a
> 512b/512b device could easily not be atomic for that 4K IO.
>
> I can revisit this with Martin.  Also, I'm happy to adjust my
> understanding based on further anecdotal real-world evidence that
> issuing 4K IOs to a 512b device and expecting any 4K IO operation to be
> atomic is _wrong_.
>

I want more info why we care about atomic write to 512 bytes blocks.

One use case is managing vdsm volumes metadata. In current version we keep
one 512 bytes block for every vdsm volume. We keep that on a special
"metadata"
lv. The number of the block is kept in the lv tags.

Here is an example:

# lvs -o lv_name,tags fb5cab8c-08ba-4781-9532-ccc78ddb21ec
  LV                                   LV Tags

  3ad2d445-6505-4442-915b-ab3a6a2fd55b
IU_c4622768-4173-403a-811c-096376d28c26,MD_7,PU_00000000-0000-0000-0000-000000000000
  416573b6-caf0-49b8-ba36-8b64336d742f
IU_1f05ff49-e97b-4a13-a973-59260dd13b87,MD_8,PU_00000000-0000-0000-0000-000000000000
  ...
  metadata


The metadata of the lv 3ad2d445-6505-4442-915b-ab3a6a2fd55b is stored
at offset 7 * 512 (MD_7) in the metadata lv.

# dd if=/dev/fb5cab8c-08ba-4781-9532-ccc78ddb21ec/metadata bs=512 count=1
skip=7
DOMAIN=fb5cab8c-08ba-4781-9532-ccc78ddb21ec
CTIME=1542309274
FORMAT=RAW
DISKTYPE=ISOF
LEGALITY=LEGAL
SIZE=6291456
VOLTYPE=LEAF
DESCRIPTION={"DiskAlias":"Fedora-Server-dvd-x86_64-29-1.2.iso","DiskDescription":"Uploaded
disk"}
IMAGE=c4622768-4173-403a-811c-096376d28c26
PUUID=00000000-0000-0000-0000-000000000000
MTIME=0
POOL_UUID=
TYPE=PREALLOCATED
GEN=0
EOF
1+0 records in
1+0 records out
512 bytes (512 B) copied, 0.00085428 s, 599 kB/s

We use sanlock to synchronize access to the metadata lv, but this lv is
active
on many hosts at the same time, and different hosts are reading and writing
volume metadata at the same time.

We may have 2 storage jobs reading and writing the blocks at offset 7 and 8.
If the writes are not atomic, one host can overwrite other host write.

To support 4k drives, we are modifying this format to keep 8k per volume so
we can have the same format regardless of the underlying block size, reading
and writing 512 bytes blocks or 4k blocks. However we still have to support
the old format using 512 bytes blocks per volume.

We can simplify the code to always read and write 4k blocks, but I believe
that
we may have short read/write, and handling that may be more complicated then
writing always one block.

The underlying storage that we try to support is anything that can be
shared using
FC/SAS/iSCSI. We want to be compatible with the most stupid storage.

Nir

--000000000000d602630581cd685f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><span styl=
e=3D"color:rgb(34,34,34)">On Wed, Feb 13, 2019 at 10:40 PM Mike Snitzer &lt=
;<a href=3D"mailto:snitzer@redhat.com">snitzer@redhat.com</a>&gt; wrote:</s=
pan><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Wed, Feb 13 2019 at=C2=A0 4:14am -0500,<br>
Vojtech Juranek &lt;<a href=3D"mailto:vjuranek@redhat.com" target=3D"_blank=
">vjuranek@redhat.com</a>&gt; wrote:<br>
<br>
&gt; Hi Mike,<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Nir Soffer &lt;<a href=3D"mailto:nsoffer@redhat.com" target=3D"_b=
lank">nsoffer@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 We working on enabling 4k block size in oVirt b=
lock storage domain,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 built<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 using VG<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 on multipath devices on shared storage.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 We have incomplete support for 4k, added in 201=
1, for this bug:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 [1]<a href=3D"https://bugzilla.re=
dhat.com/732980" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redh=
at.com/732980</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 When creating or extending a VG, we check that =
all PVs are using same<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 logical and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 phyisical block size, and we store both logical=
 and physical block size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 the VG tags.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 We get the block sizes from<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 /sys/block/dm-X/queue/{logical,physical}_block_=
size.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 We also enforce that device physical block size=
 is not smaller than<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 logical block size,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 This check was added in this patch, trying to e=
nable block size !=3D 512.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 There is no<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 explanation in the patch or in the review comme=
nts why we need to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 validate<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 this.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 [2]<a href=3D"https://github.com/oVirt/vdsm/com=
mit/7e79153705891a91a06eb31cd642fb2" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/oVirt/vdsm/commit/7e79153705891a91a06eb31cd642fb2</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 09d10ff86 When we start to use a VG, we validat=
e that all the devices<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 are using the stored logical<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 and physical block size.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 In vdsm itself, we use the logical block size t=
o manage vdsm metadata,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 assuming that writing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 and reading one block of logical block size byt=
es is atomic, and we can<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 read and write<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 different blocks from different hosts at the sa=
me time.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 The relevant code validating PV block sizes is =
here:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 [3]<a href=3D"https://github.com/oVirt/vdsm/blo=
b/8b043e402f41d8a82b9f832be5f582b85" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/oVirt/vdsm/blob/8b043e402f41d8a82b9f832be5f582b85</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 20b38bc/lib/vdsm/storage/lvm.py#L1110 Reading t=
he comments in bug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 732980, I don&#39;t see anything about physical=
 block size. It looks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 like this is unnecessary check, and we should c=
heck only the logical<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 block<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 size.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 Regarding mixing devices with different logical=
 block size, according<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 [4]<a href=3D"https://bugzilla.re=
dhat.com/show_bug.cgi?id=3D732980#c8" rel=3D"noreferrer" target=3D"_blank">=
https://bugzilla.redhat.com/show_bug.cgi?id=3D732980#c8</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 We should not extend an LV over devices with di=
fferent block size, as<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 this<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 will change the device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 logical block size (e.g change from 512 to 4k),=
 and the change may<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 break<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 the upper layer that<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 already use the device and assume the previous =
logical block size.<br>
&gt; &gt; <br>
&gt; &gt; This idea that 4K writes to a 512b physical drive aren&#39;t goin=
g to be<br>
&gt; &gt; atomic, and that that is going to be the basis for some upper lev=
el<br>
&gt; &gt; failure is handwaving and overly paranoid TBH.<br>
&gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 Based on this, I think we are ok with limiting =
VG to devices with same<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 logical block size, so any<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 LV can be extended to any device.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 I think this code should change to:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 1. When creating a VG, check that all PVs use t=
he same logical block<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 2. Store the logical block size in the VG tag<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 3. When extending the VG, check that the new PV=
s use the same logical<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 block size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 4. When starting to use a VG, check that stored=
 logical block size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 matches<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 PVs logical block size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 What do you think?<br>
&gt; &gt; <br>
&gt; &gt; I think you shouldn&#39;t care.=C2=A0 Or please show me a case wh=
ere all this<br>
&gt; &gt; concern matters.<br>
&gt; <br>
&gt; I&#39;m sorry, but I&#39;m still quite confused what needs to be check=
ed and what not. <br>
&gt; <br>
&gt; In [1] you wrote <br>
&gt; <br>
&gt; &quot;So the appropriate VDSM constraint is to not allow a larger <br>
&gt; logical_block_size device (4K) to be added to a VG that has only ever =
<br>
&gt; contained small logical_block_size (512b) devices.&quot;<br>
&gt; <br>
&gt; and <br>
&gt; <br>
&gt; &quot;If an LV is already in use then the admin needs to avoid extendi=
ng the LV in <br>
&gt; a way that upper layers may get upset with.&quot; <br>
&gt; <br>
&gt; and here that we shouldn&#39;t care. Could you be please more specific=
 what one <br>
&gt; needs to check (regarding block sizes) when creating or extending VG a=
nd start <br>
&gt; using it?<br>
&gt; <br>
&gt; Thanks<br>
&gt; Vojta<br>
&gt; <br>
&gt; [1] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D732980" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cg=
i?id=3D732980</a><br>
<br>
Ha, only going back 8 years in the archive for that BZ!<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small;colo=
r:rgb(0,0,0)">Thanks for looking at this.</div></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
I&#39;d need to revisit all the details of what VDSM/oVirt are so concerned=
<br>
about relative to just _always_ using 4K for the sanlock volumes.<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small;color:rgb(0,0,0)">For sanlock volumes we don&#39;t care, we trust Dav=
id to get this right :-)</div></div><div class=3D"gmail_default" style=3D"f=
ont-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small;color:rgb(0,0,0)">The issue is vdsm metadata.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
My contention is the constraint likely wasn&#39;t ever _really_ needed.=C2=
=A0 But<br>
maybe it was.. again, I&#39;ll look back at the BZ in more detail to see<br=
>
what I&#39;m missing.<br>
<br>
Concerns about 4K issued to 512b physical devices _not_ being atomic<br>
(could have 5 of the 8 512b written, so old 3 bytes could cause<br>
issues).=C2=A0 IIRC I shared those concerns with Martin Petersen before<br>
(Martin is an upstream Linux SCSI maintainer) and he felt the atomicity<br>
concerns were overstated.=C2=A0 Thinking now, it was possibly for devices<b=
r>
that advertise 4K physical and 512b logical.=C2=A0 Whereas issuing 4K to a<=
br>
512b/512b device could easily not be atomic for that 4K IO.<br>
<br>
I can revisit this with Martin.=C2=A0 Also, I&#39;m happy to adjust my<br>
understanding based on further anecdotal real-world evidence that<br>
issuing 4K IOs to a 512b device and expecting any 4K IO operation to be<br>
atomic is _wrong_.<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small;color:rgb(0,0,0)">I want more info why we=
 care about atomic write to 512 bytes blocks.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small;color:rgb(0,0,0)">One use case is mana=
ging vdsm volumes metadata. In current version we keep</div><div class=3D"g=
mail_default" style=3D"font-size:small;color:rgb(0,0,0)">one 512 bytes bloc=
k for every vdsm volume. We keep that on a special &quot;metadata&quot;</di=
v><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">l=
v. The number of the block is kept in the lv tags.</div><div class=3D"gmail=
_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">Here is an ex=
ample:</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb=
(0,0,0)"><br></div><div class=3D"gmail_default"><div class=3D"gmail_default=
" style=3D"color:rgb(0,0,0);font-size:small"># lvs -o lv_name,tags fb5cab8c=
-08ba-4781-9532-ccc78ddb21ec</div><div class=3D"gmail_default" style=3D"col=
or:rgb(0,0,0);font-size:small">=C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0LV Tags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0</div><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-=
size:small">=C2=A0 3ad2d445-6505-4442-915b-ab3a6a2fd55b IU_c4622768-4173-40=
3a-811c-096376d28c26,MD_7,PU_00000000-0000-0000-0000-000000000000=C2=A0</di=
v><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-size:small">=
=C2=A0 416573b6-caf0-49b8-ba36-8b64336d742f IU_1f05ff49-e97b-4a13-a973-5926=
0dd13b87,MD_8,PU_00000000-0000-0000-0000-000000000000=C2=A0</div><div class=
=3D"gmail_default" style=3D"color:rgb(0,0,0);font-size:small">=C2=A0 ...</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(0,0,0);font-size:small">=
=C2=A0 metadata=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br></div><div class=3D"=
gmail_default" style=3D"color:rgb(0,0,0);font-size:small"><br></div><div st=
yle=3D"color:rgb(0,0,0);font-size:small">The metadata of the lv 3ad2d445-65=
05-4442-915b-ab3a6a2fd55b is stored</div><div style=3D"color:rgb(0,0,0);fon=
t-size:small">at offset 7 * 512 (MD_7) in the metadata lv.</div><div style=
=3D"color:rgb(0,0,0);font-size:small"><br></div><div><div><font color=3D"#0=
00000"># dd if=3D/dev/fb5cab8c-08ba-4781-9532-ccc78ddb21ec/metadata bs=3D51=
2 count=3D1 skip=3D7</font></div><div><font color=3D"#000000">DOMAIN=3Dfb5c=
ab8c-08ba-4781-9532-ccc78ddb21ec</font></div><div><font color=3D"#000000">C=
TIME=3D1542309274</font></div><div><font color=3D"#000000">FORMAT=3DRAW</fo=
nt></div><div><font color=3D"#000000">DISKTYPE=3DISOF</font></div><div><fon=
t color=3D"#000000">LEGALITY=3DLEGAL</font></div><div><font color=3D"#00000=
0">SIZE=3D6291456</font></div><div><font color=3D"#000000">VOLTYPE=3DLEAF</=
font></div><div><font color=3D"#000000">DESCRIPTION=3D{&quot;DiskAlias&quot=
;:&quot;Fedora-Server-dvd-x86_64-29-1.2.iso&quot;,&quot;DiskDescription&quo=
t;:&quot;Uploaded disk&quot;}</font></div><div><font color=3D"#000000">IMAG=
E=3Dc4622768-4173-403a-811c-096376d28c26</font></div><div><font color=3D"#0=
00000">PUUID=3D00000000-0000-0000-0000-000000000000</font></div><div><font =
color=3D"#000000">MTIME=3D0</font></div><div><font color=3D"#000000">POOL_U=
UID=3D</font></div><div><font color=3D"#000000">TYPE=3DPREALLOCATED</font><=
/div><div><font color=3D"#000000">GEN=3D0</font></div><div><font color=3D"#=
000000">EOF</font></div><div><font color=3D"#000000">1+0 records in</font><=
/div><div><font color=3D"#000000">1+0 records out</font></div><div><font co=
lor=3D"#000000">512 bytes (512 B) copied, 0.00085428 s, 599 kB/s</font></di=
v></div><div style=3D"color:rgb(0,0,0);font-size:small"><br></div><div styl=
e=3D"color:rgb(0,0,0);font-size:small">We use sanlock to synchronize access=
 to the metadata lv, but this lv is active</div><div style=3D"color:rgb(0,0=
,0);font-size:small">on many hosts at the same time, and different hosts ar=
e reading and writing</div><div style=3D"color:rgb(0,0,0);font-size:small">=
volume metadata at the same time.</div><div style=3D"color:rgb(0,0,0);font-=
size:small"><br></div><div style=3D"color:rgb(0,0,0);font-size:small">We ma=
y have 2 storage jobs reading and writing the blocks at offset 7 and 8.</di=
v><div style=3D"color:rgb(0,0,0);font-size:small">If the writes are not ato=
mic, one host can overwrite other host write.</div><div style=3D"color:rgb(=
0,0,0);font-size:small"><br></div><div style=3D"color:rgb(0,0,0);font-size:=
small">To support 4k drives, we are modifying this format to keep 8k per vo=
lume so</div><div style=3D"color:rgb(0,0,0);font-size:small">we can have th=
e same format regardless of the underlying block size, reading</div><div st=
yle=3D"color:rgb(0,0,0);font-size:small">and writing 512 bytes blocks or 4k=
 blocks. However we still have to support</div><div style=3D"color:rgb(0,0,=
0);font-size:small">the old format using 512 bytes blocks per volume.</div>=
</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0=
)"><br></div><div class=3D"gmail_default" style=3D"font-size:small;color:rg=
b(0,0,0)">We can simplify the code to always read and write 4k blocks, but =
I believe that</div><div class=3D"gmail_default" style=3D"font-size:small;c=
olor:rgb(0,0,0)">we may have short read/write, and handling that may be mor=
e complicated then</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll;color:rgb(0,0,0)">writing always one block.=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">The underlyin=
g storage that we try to support is anything that can be shared using</div>=
<div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">FC/=
SAS/iSCSI. We want to be compatible with the most stupid storage.</div><div=
 class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">=
Nir</div></div></div></div></div></div>

--000000000000d602630581cd685f--
