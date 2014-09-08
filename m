Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/alternative; boundary=Apple-Mail-4-240473454
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <CACjhXxd5+b52Z5UE1uoOp5fHQSm-rnXmBaDvtvn4VQZxJxrrJQ@mail.gmail.com>
Date: Mon, 8 Sep 2014 10:58:06 -0500
Message-Id: <1C8E3DA4-6CF5-477C-AF69-C9F1095BC841@redhat.com>
References: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
	<590C03FA-0051-4DCF-B568-C0A47B16AA49@redhat.com>
	<CACjhXxdyw1Sx4iMKT7dMUFTRwd--zLpt8BK8iyedCj_bPiTCWg@mail.gmail.com>
	<CACjhXxd5+b52Z5UE1uoOp5fHQSm-rnXmBaDvtvn4VQZxJxrrJQ@mail.gmail.com>
Subject: Re: [linux-lvm] [data] Re:  Setting up LVM cache causes crash
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
To: Elvin Cako <ecako@cogolabs.com>
Cc: data <data@cogolabs.com>, LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-4-240473454
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Sep 3, 2014, at 11:29 AM, Elvin Cako wrote:

> I also want to add some discrepancies in looking at the file:
>=20
> cat /proc/mdstat
> Personalities : [raid1]=20
> ...=20
> md35 : active raid1 sdb2[0] sdc2[1]
>       99629440 blocks super 1.0 [3/2] [UU_]
>      =20
> md34 : active raid1 sdbt2[0] sdbp2[1]
>       830240064 blocks super 1.0 [3/2] [UU_]
>      =20
> md33 : active raid1 sdbu2[0] sdbs2[1]
>       830240064 blocks super 1.0 [3/2] [UU_]
>      =20
> md32 : active raid1 sdby2[0] sdbv2[1]
>       830240064 blocks super 1.0 [3/2] [UU_]
>      =20
> md31 : active raid1 sdbr2[0] sdbw2[1]
>       830240064 blocks super 1.0 [3/2] [UU_]
>      =20
> md30 : active raid1 sdbq2[0] sdbx2[1]
>       830240064 blocks super 1.0 [3/2] [UU_]
> ...=20
>=20
> We are only using the second partition of each drive for our md =
devices. In the log(attached previously) we see that the drive, the =
first partition, and the second partition are "Added to device cache".  =
Is "device cache" some other cache not related to our SSD cache we're =
trying to create?
>=20
> #device/dev-cache.c:333         /dev/sdb: Added to device cache
> #device/dev-cache.c:330         =
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M: Aliased =
to /dev/sdb in device cache
> #device/dev-cache.c:330         =
/dev/disk/by-id/wwn-0x50025388a01d30bc: Aliased to /dev/sdb in device =
cache
> #device/dev-cache.c:333         /dev/sdb1: Added to device cache
> #device/dev-cache.c:330         =
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M-part1: =
Aliased to /dev/sdb1 in device cache
> #device/dev-cache.c:330         =
/dev/disk/by-id/wwn-0x50025388a01d30bc-part1: Aliased to /dev/sdb1 in =
device cache
> #device/dev-cache.c:319         /dev/disk/by-partlabel/metadata: =
Already in device cache
> #device/dev-cache.c:330         =
/dev/disk/by-partuuid/e7d5c622-626c-4122-9d5c-ccb1ae1ff0dc: Aliased to =
/dev/sdb1 in device cache
> #device/dev-cache.c:330         =
/dev/disk/by-uuid/dc8f83e2-1073-4128-b64f-9e86b9539c67: Aliased to =
/dev/sdb1 in device cache
> #device/dev-cache.c:333         /dev/sdb2: Added to device cache
> #device/dev-cache.c:330         =
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M-part2: =
Aliased to /dev/sdb2 in device cache
> #device/dev-cache.c:330         =
/dev/disk/by-id/wwn-0x50025388a01d30bc-part2: Aliased to /dev/sdb2 in =
device cache
> #device/dev-cache.c:319         /dev/disk/by-partlabel/raiddata: =
Already in device cache
> #device/dev-cache.c:330         =
/dev/disk/by-partuuid/39bcecad-693c-4842-b71d-920c4eb8aaef: Aliased to =
/dev/sdb2 in device cache
> =20

Yes, it is different.  That has to do with LVM remembering what devices =
it has seen when reading LVM labels.  The LVM labels on those devices =
tell it how the volumes have been constructed and so on.

 brassow


--Apple-Mail-4-240473454
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Sep 3, 2014, at 11:29 AM, Elvin Cako wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
font-family: Helvetica; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><blockquote =
class=3D"gmail_quote" style=3D"font-family: arial, sans-serif; =
font-size: 13px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0.8ex; border-left-width: 1px; border-left-color: rgb(204, =
204, 204); border-left-style: solid; padding-left: 1ex; "><div =
dir=3D"ltr"><div>I also want to add some discrepancies in looking at the =
file:<div><br></div></div><div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">cat =
/proc/mdstat</div></div></div></blockquote><blockquote =
class=3D"gmail_quote" style=3D"font-family: arial, sans-serif; =
font-size: 13px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0.8ex; border-left-width: 1px; border-left-color: rgb(204, =
204, 204); border-left-style: solid; padding-left: 1ex; "><div =
dir=3D"ltr"><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">Personalities : [raid1]&nbsp;</div></div></blockquote><div =
style=3D"font-family: arial, sans-serif; font-size: 13px; =
">...&nbsp;</div><div style=3D"font-family: arial, sans-serif; =
font-size: 13px; "><blockquote class=3D"gmail_quote" style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0.8ex; =
border-left-width: 1px; border-left-color: rgb(204, 204, 204); =
border-left-style: solid; padding-left: 1ex; "><div dir=3D"ltr"><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font-size: 11px; font-family: Menlo; ">md35 : active =
raid1 sdb2[0] sdc2[1]</div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">&nbsp; &nbsp; &nbsp; 99629440 blocks super 1.0 [3/2] =
[UU_]</div><p style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; min-height: 13px; ">&nbsp;&nbsp; &nbsp; &nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">md34 : active raid1 sdbt2[0] =
sdbp2[1]</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">&nbsp; &nbsp; &nbsp; 830240064 blocks super 1.0 [3/2] =
[UU_]</div><p style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; min-height: 13px; ">&nbsp;&nbsp; &nbsp; &nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">md33 : active raid1 sdbu2[0] =
sdbs2[1]</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">&nbsp; &nbsp; &nbsp; 830240064 blocks super 1.0 [3/2] =
[UU_]</div><p style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; min-height: 13px; ">&nbsp;&nbsp; &nbsp; &nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">md32 : active raid1 sdby2[0] =
sdbv2[1]</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">&nbsp; &nbsp; &nbsp; 830240064 blocks super 1.0 [3/2] =
[UU_]</div><p style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; min-height: 13px; ">&nbsp;&nbsp; &nbsp; &nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">md31 : active raid1 sdbr2[0] =
sdbw2[1]</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">&nbsp; &nbsp; &nbsp; 830240064 blocks super 1.0 [3/2] =
[UU_]</div><p style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; min-height: 13px; ">&nbsp;&nbsp; &nbsp; &nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">md30 : active raid1 sdbq2[0] =
sdbx2[1]</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">&nbsp; &nbsp; &nbsp; 830240064 blocks super 1.0 [3/2] =
[UU_]</div></div></blockquote></div><div style=3D"font-family: arial, =
sans-serif; font-size: 13px; ">...&nbsp;</div><blockquote =
class=3D"gmail_quote" style=3D"font-family: arial, sans-serif; =
font-size: 13px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0.8ex; border-left-width: 1px; border-left-color: rgb(204, =
204, 204); border-left-style: solid; padding-left: 1ex; "><div =
dir=3D"ltr"><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; min-height: 13px; "><br></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">We are only using the second partition of =
each drive for our md devices. In the log(attached previously) we see =
that the drive, the first partition, and the second partition are "Added =
to device cache". &nbsp;Is "device cache" some other cache not related =
to our SSD cache we're trying to =
create?</div></div></blockquote><div><br></div><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:333 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/sdb: Added to device cache</div><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M: =
Aliased to /dev/sdb in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-id/wwn-0x50025388a01d30bc: Aliased to /dev/sdb in =
device cache</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">#device/dev-cache.c:333 &nbsp; &nbsp; &nbsp; &nbsp; /dev/sdb1: =
Added to device cache</div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; &nbsp; =
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M-part1: =
Aliased to /dev/sdb1 in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-id/wwn-0x50025388a01d30bc-part1: Aliased to =
/dev/sdb1 in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:319 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-partlabel/metadata: Already in device =
cache</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; &nbsp; =
/dev/disk/by-partuuid/e7d5c622-626c-4122-9d5c-ccb1ae1ff0dc: Aliased to =
/dev/sdb1 in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-uuid/dc8f83e2-1073-4128-b64f-9e86b9539c67: Aliased =
to /dev/sdb1 in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:333 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/sdb2: Added to device cache</div><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; =
&nbsp; =
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M-part2: =
Aliased to /dev/sdb2 in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-id/wwn-0x50025388a01d30bc-part2: Aliased to =
/dev/sdb2 in device cache</div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: =
11px; font-family: Menlo; ">#device/dev-cache.c:319 &nbsp; &nbsp; &nbsp; =
&nbsp; /dev/disk/by-partlabel/raiddata: Already in device =
cache</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font-size: 11px; font-family: =
Menlo; ">#device/dev-cache.c:330 &nbsp; &nbsp; &nbsp; &nbsp; =
/dev/disk/by-partuuid/39bcecad-693c-4842-b71d-920c4eb8aaef: Aliased to =
/dev/sdb2 in device =
cache</div><div>&nbsp;</div></span></blockquote><br></div><div>Yes, it =
is different. &nbsp;That has to do with LVM remembering what devices it =
has seen when reading LVM labels. &nbsp;The LVM labels on those devices =
tell it how the volumes have been constructed and so =
on.</div><div><br></div><div>&nbsp;brassow</div><br></body></html>=

--Apple-Mail-4-240473454--
