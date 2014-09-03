Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s83GTdAN006029
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2014 12:29:39 -0400
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s83GTZTF013552
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2014 12:29:36 -0400
Received: by mail-vc0-f181.google.com with SMTP id ij19so8973684vcb.26
	for <linux-lvm@redhat.com>; Wed, 03 Sep 2014 09:29:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACjhXxdyw1Sx4iMKT7dMUFTRwd--zLpt8BK8iyedCj_bPiTCWg@mail.gmail.com>
References: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
	<590C03FA-0051-4DCF-B568-C0A47B16AA49@redhat.com>
	<CACjhXxdyw1Sx4iMKT7dMUFTRwd--zLpt8BK8iyedCj_bPiTCWg@mail.gmail.com>
Date: Wed, 3 Sep 2014 12:29:34 -0400
Message-ID: <CACjhXxd5+b52Z5UE1uoOp5fHQSm-rnXmBaDvtvn4VQZxJxrrJQ@mail.gmail.com>
From: Elvin Cako <ecako@cogolabs.com>
Content-Type: multipart/alternative; boundary=001a1136b1b6d0a60705022bbdaa
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
To: Brassow Jonathan <jbrassow@redhat.com>
Cc: data <data@cogolabs.com>, LVM general discussion and development <linux-lvm@redhat.com>

--001a1136b1b6d0a60705022bbdaa
Content-Type: text/plain; charset=UTF-8

>
> I also want to add some discrepancies in looking at the file:
>
> cat /proc/mdstat
>
Personalities : [raid1]
>
...

> md35 : active raid1 sdb2[0] sdc2[1]
>
>       99629440 blocks super 1.0 [3/2] [UU_]
>
>
>
> md34 : active raid1 sdbt2[0] sdbp2[1]
>
>       830240064 blocks super 1.0 [3/2] [UU_]
>
>
>
> md33 : active raid1 sdbu2[0] sdbs2[1]
>
>       830240064 blocks super 1.0 [3/2] [UU_]
>
>
>
> md32 : active raid1 sdby2[0] sdbv2[1]
>
>       830240064 blocks super 1.0 [3/2] [UU_]
>
>
>
> md31 : active raid1 sdbr2[0] sdbw2[1]
>
>       830240064 blocks super 1.0 [3/2] [UU_]
>
>
>
> md30 : active raid1 sdbq2[0] sdbx2[1]
>
>       830240064 blocks super 1.0 [3/2] [UU_]
>
...

>
> We are only using the second partition of each drive for our md devices.
> In the log(attached previously) we see that the drive, the first partition,
> and the second partition are "Added to device cache".  Is "device cache"
> some other cache not related to our SSD cache we're trying to create?
>

#device/dev-cache.c:333         /dev/sdb: Added to device cache

#device/dev-cache.c:330
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M: Aliased to
/dev/sdb in device cache

#device/dev-cache.c:330         /dev/disk/by-id/wwn-0x50025388a01d30bc:
Aliased to /dev/sdb in device cache

#device/dev-cache.c:333         /dev/sdb1: Added to device cache

#device/dev-cache.c:330
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M-part1:
Aliased to /dev/sdb1 in device cache

#device/dev-cache.c:330
/dev/disk/by-id/wwn-0x50025388a01d30bc-part1: Aliased to /dev/sdb1 in
device cache

#device/dev-cache.c:319         /dev/disk/by-partlabel/metadata: Already in
device cache

#device/dev-cache.c:330
/dev/disk/by-partuuid/e7d5c622-626c-4122-9d5c-ccb1ae1ff0dc: Aliased to
/dev/sdb1 in device cache

#device/dev-cache.c:330
/dev/disk/by-uuid/dc8f83e2-1073-4128-b64f-9e86b9539c67: Aliased to
/dev/sdb1 in device cache

#device/dev-cache.c:333         /dev/sdb2: Added to device cache

#device/dev-cache.c:330
/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSBF109608M-part2:
Aliased to /dev/sdb2 in device cache

#device/dev-cache.c:330
/dev/disk/by-id/wwn-0x50025388a01d30bc-part2: Aliased to /dev/sdb2 in
device cache

#device/dev-cache.c:319         /dev/disk/by-partlabel/raiddata: Already in
device cache

#device/dev-cache.c:330
/dev/disk/by-partuuid/39bcecad-693c-4842-b71d-920c4eb8aaef: Aliased to
/dev/sdb2 in device cache



On Wed, Sep 3, 2014 at 11:58 AM, Elvin Cako <ecako@cogolabs.com> wrote:

> Hello Jonathan,
>
> Thanks for the reply. In regards to the information you are seeking:
>
> 1) I've attached the output of the verbose vgchange command
>
> 2) By crash, I mean the machine hangs then automatically reboots itself.
>
> Hope that helps.
>
>
> On Tue, Sep 2, 2014 at 6:00 PM, Brassow Jonathan <jbrassow@redhat.com>
> wrote:
>
>>
>> On Aug 25, 2014, at 11:45 AM, Elvin Cako wrote:
>>
>>  Hello,
>>
>> Kernel:
>> 3.10.0-123.6.3.el7.x86_64 #1 SMP Wed Aug 6 21:12:36 UTC 2014 x86_64
>> x86_64 x86_64 GNU/Linux
>>
>> Issue:
>> In trying to set up the new LVM caching, I've run into some issues. I
>> have followed the steps in the lvm manual:
>>
>>
>> Thanks for trying LVM caching.
>>
>> My first guess is that not all the devices are visible to LVM when it
>> tries to construct the LVs.  This could have been due to MD running after
>> lvmetad - I'm not sure.  However, testing without lvmetad (as you have
>> done) should have yielded different results then.  Even without the devices
>> being visible, 'vgchange' should not crash.
>>
>> We could use a couple pieces of information:
>> 1) what is the verbose trace of 'vgchange -ay'?  (Add '-vvvv' for "very
>> verbose" and capture the output.)
>>
>> 2) What do you mean by "crash"?  Does the system go down?  Does the
>> command hang or segfault?
>>
>>  brassow
>>
>
>
>
> --
> Elvin
>



-- 
Elvin

--001a1136b1b6d0a60705022bbdaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><blockquote class=3D"gmail_quote" style=3D"font-famil=
y:arial,sans-serif;font-size:13px;margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-le=
ft:1ex">

<div dir=3D"ltr"><div>I also want to add some discrepancies in looking at t=
he file:<div><br></div></div><div><p style=3D"margin:0px;font-size:11px;fon=
t-family:Menlo">cat /proc/mdstat</p></div></div></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"font-family:arial,sans-serif;font-size:13px;ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex">

<div dir=3D"ltr"><p style=3D"margin:0px;font-size:11px;font-family:Menlo">P=
ersonalities : [raid1]=C2=A0</p></div></blockquote><div style=3D"font-famil=
y:arial,sans-serif;font-size:13px">...=C2=A0</div><div style=3D"font-family=
:arial,sans-serif;font-size:13px">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><p style=3D"margin:0px;font-size:11px;fon=
t-family:Menlo">

md35 : active raid1 sdb2[0] sdc2[1]</p><p style=3D"margin:0px;font-size:11p=
x;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 99629440 blocks super 1.0 [3/2] [=
UU_]</p><p style=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:=
13px">=C2=A0=C2=A0 =C2=A0 =C2=A0</p>

<p style=3D"margin:0px;font-size:11px;font-family:Menlo">md34 : active raid=
1 sdbt2[0] sdbp2[1]</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo">=C2=A0 =C2=A0 =C2=A0 830240064 blocks super 1.0 [3/2] [UU_]</p><p styl=
e=3D"margin:0px;font-size:11px;font-family:Menlo;min-height:13px">

=C2=A0=C2=A0 =C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-fa=
mily:Menlo">md33 : active raid1 sdbu2[0] sdbs2[1]</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 830240064 blocks su=
per 1.0 [3/2] [UU_]</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo;min-height:13px">

=C2=A0=C2=A0 =C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-fa=
mily:Menlo">md32 : active raid1 sdby2[0] sdbv2[1]</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 830240064 blocks su=
per 1.0 [3/2] [UU_]</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo;min-height:13px">

=C2=A0=C2=A0 =C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-fa=
mily:Menlo">md31 : active raid1 sdbr2[0] sdbw2[1]</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 830240064 blocks su=
per 1.0 [3/2] [UU_]</p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo;min-height:13px">

=C2=A0=C2=A0 =C2=A0 =C2=A0</p><p style=3D"margin:0px;font-size:11px;font-fa=
mily:Menlo">md30 : active raid1 sdbq2[0] sdbx2[1]</p><p style=3D"margin:0px=
;font-size:11px;font-family:Menlo">=C2=A0 =C2=A0 =C2=A0 830240064 blocks su=
per 1.0 [3/2] [UU_]</p></div></blockquote>

</div><div style=3D"font-family:arial,sans-serif;font-size:13px">...=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"font-family:arial,sans-seri=
f;font-size:13px;margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

<div dir=3D"ltr"><p style=3D"margin:0px;font-size:11px;font-family:Menlo;mi=
n-height:13px"><br></p><p style=3D"margin:0px;font-size:11px;font-family:Me=
nlo">We are only using the second partition of each drive for our md device=
s. In the log(attached previously) we see that the drive, the first partiti=
on, and the second partition are &quot;Added to device cache&quot;. =C2=A0I=
s &quot;device cache&quot; some other cache not related to our SSD cache we=
&#39;re trying to create?</p>

</div></blockquote><div><br></div><p style=3D"margin:0px;font-size:11px;fon=
t-family:Menlo">#device/dev-cache.c:333 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sd=
b: Added to device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-id/ata-Samsung_SSD_840_EVO_1=
20GB_S1D5NSBF109608M: Aliased to /dev/sdb in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-id/wwn-0x50025388a01d30bc: A=
liased to /dev/sdb in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:333 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sdb1: Added to device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-id/ata-Samsung_SSD_840_EVO_1=
20GB_S1D5NSBF109608M-part1: Aliased to /dev/sdb1 in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-id/wwn-0x50025388a01d30bc-pa=
rt1: Aliased to /dev/sdb1 in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:319 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-partlabel/metadata: Already =
in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-partuuid/e7d5c622-626c-4122-=
9d5c-ccb1ae1ff0dc: Aliased to /dev/sdb1 in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-uuid/dc8f83e2-1073-4128-b64f=
-9e86b9539c67: Aliased to /dev/sdb1 in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:333 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/sdb2: Added to device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-id/ata-Samsung_SSD_840_EVO_1=
20GB_S1D5NSBF109608M-part2: Aliased to /dev/sdb2 in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-id/wwn-0x50025388a01d30bc-pa=
rt2: Aliased to /dev/sdb2 in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:319 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-partlabel/raiddata: Already =
in device cache</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">#device/dev-cache.=
c:330 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/disk/by-partuuid/39bcecad-693c-4842-=
b71d-920c4eb8aaef: Aliased to /dev/sdb2 in device cache</p><div>=C2=A0</div=
></div></div><div class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Wed, Sep 3, 2014 at 11:58 AM, Elvin C=
ako <span dir=3D"ltr">&lt;<a href=3D"mailto:ecako@cogolabs.com" target=3D"_=
blank">ecako@cogolabs.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<div dir=3D"ltr">Hello Jonathan,<div><br></div><div>Thanks for the reply. I=
n regards to the information you are seeking:</div><div><br></div><div>1) I=
&#39;ve attached the output of the verbose vgchange command</div><div><br>

</div><div>2) By crash, I mean the machine hangs then automatically reboots=
 itself.</div><div><br></div><div>Hope that helps.</div><div class=3D"gmail=
_extra"><div><div class=3D"h5"><br><br><div class=3D"gmail_quote">On Tue, S=
ep 2, 2014 at 6:00 PM, Brassow Jonathan <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jbrassow@redhat.com" target=3D"_blank">jbrassow@redhat.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><div><br=
><div><div>On Aug 25, 2014, at 11:45 AM, Elvin Cako wrote:</div><br>
<blockquote type=3D"cite"><span style=3D"border-collapse:separate;font-fami=
ly:Helvetica;font-style:normal;font-variant:normal;font-weight:normal;lette=
r-spacing:normal;line-height:normal;text-align:-webkit-auto;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;font-size:medium">=
<span style=3D"font-family:arial,sans-serif;font-size:13px"><div>

Hello,</div><div><br></div><div>Kernel:</div><div><div style=3D"margin-top:=
0px;margin-right:0px;margin-bottom:0px;margin-left:0px;font-size:11px;font-=
family:Menlo">3.10.0-123.6.3.el7.x86_64 #1 SMP Wed Aug 6 21:12:36 UTC 2014 =
x86_64 x86_64 x86_64 GNU/Linux</div>

</div><div><br></div><div>Issue:</div>In trying to set up the new LVM cachi=
ng, I&#39;ve run into some issues. I have followed the steps in the lvm man=
ual:</span></span><br></blockquote></div><br></div><div>Thanks for trying L=
VM caching.</div>

<div><br></div><div>My first guess is that not all the devices are visible =
to LVM when it tries to construct the LVs. =C2=A0This could have been due t=
o MD running after lvmetad - I&#39;m not sure. =C2=A0However, testing witho=
ut lvmetad (as you have done) should have yielded different results then. =
=C2=A0Even without the devices being visible, &#39;vgchange&#39; should not=
 crash.</div>

<div><br></div><div>We could use a couple pieces of information:</div><div>=
1) what is the verbose trace of &#39;vgchange -ay&#39;? =C2=A0(Add &#39;-vv=
vv&#39; for &quot;very verbose&quot; and capture the output.)</div><div><br=
>

</div><div>2) What do you mean by &quot;crash&quot;? =C2=A0Does the system =
go down? =C2=A0Does the command hang or segfault?</div><span><font color=3D=
"#888888"><div><br></div><div>=C2=A0brassow</div></font></span></div></bloc=
kquote>
</div><br><br clear=3D"all"><div><br></div></div></div><span class=3D"HOEnZ=
b"><font color=3D"#888888">-- <br><div dir=3D"ltr">Elvin</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr">Elvin</div>
</div>

--001a1136b1b6d0a60705022bbdaa--
