Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43CLTkr012336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 08:21:29 -0400
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 380A7C00040B
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 12:21:28 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id x201so22288266oif.3
	for <linux-lvm@redhat.com>; Tue, 03 May 2016 05:21:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57287570.5090509@redhat.com>
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
	<CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
	<57287570.5090509@redhat.com>
Date: Tue, 3 May 2016 14:21:27 +0200
Message-ID: <CAPLCSGBXKXZLthYSFGUkG+kGO=8aUXh8SS4wh+6Ynj8A7xfh2w@mail.gmail.com>
From: Bhasker C V <bhasker@unixindia.com>
Content-Type: multipart/alternative; boundary=001a11c161f0f8ac9b0531ef2551
Subject: Re: [linux-lvm] Lvm think provisioning query
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

--001a11c161f0f8ac9b0531ef2551
Content-Type: text/plain; charset=UTF-8

Here are the answers to your questions

1. fsck does not report any error and the file contained inside the FS is
definitely greater than the allocatable LV size
# fsck.ext4 -f -C0 /dev/virtp/vol01
e2fsck 1.43-WIP (15-Mar-2016)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory
structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 30492/262144
blocks

2. Size of the file

# du -hs fil
69M     fil

(please note here that the LV virtual size is 1G but the parent pool size
is just 40M I expect the file not to exceed 40M at any cost.)

3. lvs
# lvs
  LV       VG    Attr       LSize  Pool     Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  virtpool virtp twi-aotzD- 40.00m                 100.00
1.37
  vol01    virtp Vwi-aotz--  1.00g
virtpool


You can do this on any virtual machine. I use qemu with virtio back-end.


On Tue, May 3, 2016 at 11:54 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> On 3.5.2016 08:59, Bhasker C V wrote:
>
>> Does this mean the ext4 is showing wrong information. The file is reported
>> being 90+MB but in actuality the size is less in the FS ?
>> This is quite ok because it is just that file system being affected. I was
>> however concerned that the file in this FS might have overwritten other LV
>> data since the file is showing bigger than the volume size.
>>
>>
> I've no idea what 'ext4' is showing you, but if you have i.e. 100M
> filesystem size, you could still have there e.g. 1TB file. Experience the
> magic:
>
> 'truncate -s 1T myfirst1TBfile'
>
> As you can see 'ext4' is doing it's own over-provisioning with 'hole'
> files.
> The only important bits are:
> - is the filesystem consistent ?
> - is 'fsck' not reporting any error ?
>
> What's the 'real' size you get with 'du  myfirst1TBfile' or your wrong
> file ?
>
> Somehow I don't believe you can get  i.e.  90+MB 'du' size with 10MB
> filesystem size and 'fsck' would not report any problem.
>
> I will try this using BTRFS.
>>
>
> For what exactly ??
>
> Regard
>
> Zdenek
>
>
>
>
>
>>
>> On Fri, Apr 29, 2016 at 10:13 AM, Zdenek Kabelac <zkabelac@redhat.com
>> <mailto:zkabelac@redhat.com>> wrote:
>>
>>     On 28.4.2016 16:36, Bhasker C V wrote:
>>
>>         Zdenek,
>>            Thanks. Here I am just filling it up with random data and so I
>> am not
>>         concerned about data integrity
>>            You are right, I did get page lost during write errors in the
>> kernel
>>
>>         The question however is even after reboot and doing several fsck
>> of
>>         the ext4fs
>>         the file size "occupied" is more than the pool size. How is this ?
>>         I agree that data may be corrupted, but there *is* some data and
>> this
>>         must be
>>         saved somewhere. Why is this "somewhere" exceeding the pool size ?
>>
>>
>>     Hi
>>
>>     Few key principles -
>>
>>
>>     1. You should always mount extX fs with  errors=remount-ro
>> (tune2fs,mount)
>>
>>     2. There are few data={} modes ensuring various degree of data
>> integrity,
>>         An case you really care about data integrity here - switch to
>> 'journal'
>>         mode at price of lower speed. Default ordered mode might show
>> this.
>>         (i.e. it's the very same behavior as you would have seen with
>> failing hdd)
>>
>>     3. Do not continue using thin-pool when it's full :)
>>
>>     4. We do miss more configurable policies with thin-pools.
>>         i.e. do plan to instantiate 'error' target for writes in the case
>>         pool gets full - so ALL writes will be errored - as of now -
>> writes
>>         to provisioned blocks may cause further filesystem confusion -
>> that's
>>         why  'remount-ro' is rather mandatory - xfs is recently being
>> enhanced
>>         to provide similar logic.
>>
>>
>>
>>     Regards
>>
>>
>>     Zdenek
>>
>>     _______________________________________________
>>     linux-lvm mailing list
>>     linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>>     https://www.redhat.com/mailman/listinfo/linux-lvm
>>     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a11c161f0f8ac9b0531ef2551
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Here are the answers to your questions<br><=
br></div>1. fsck does not report any error and the file contained inside th=
e FS is definitely greater than the allocatable LV size <br># fsck.ext4 -f =
-C0 /dev/virtp/vol01 <br>e2fsck 1.43-WIP (15-Mar-2016)<br>Pass 1: Checking =
inodes, blocks, and sizes<br>Pass 2: Checking directory structure=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 <br>Pass 3: Checking directory connectivity<br>Pass 4: C=
hecking reference counts<br>Pass 5: Checking group summary information<br>/=
dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 30492/262144 blocks=
=C2=A0=C2=A0 <br><br></div>2. Size of the file <br><br># du -hs fil <br>69M=
=C2=A0=C2=A0=C2=A0=C2=A0 fil<br><br></div><div><span style=3D"background-co=
lor:rgb(255,255,255)"><span style=3D"color:rgb(255,0,0)">(please note here =
that the LV virtual size is 1G but the parent pool size is just 40M I expec=
t the file not to exceed 40M at any cost.)<br><br></span></span></div>3. lv=
s <br># lvs<br>=C2=A0 LV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VG=C2=A0=C2=A0=
=C2=A0 Attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LSize=C2=A0 Pool=C2=A0=C2=
=A0=C2=A0=C2=A0 Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert<br=
>=C2=A0 virtpool virtp twi-aotzD- 40.00m=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100.00 1.37=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <br>=C2=A0 vol01=C2=A0=C2=A0=C2=A0 virtp Vwi-aotz--=C2=A0 1.00=
g virtpool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 <br><div><br><br></div><div>You can do this on any virtual =
machine. I use qemu with virtio back-end. <br><br></div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 3, 2016 at 11:54 A=
M, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.c=
om" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D"">On 3.5.2016 08:59, Bhasker C V wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Does this mean the ext4 is showing wrong information. The file is reported<=
br>
being 90+MB but in actuality the size is less in the FS ?<br>
This is quite ok because it is just that file system being affected. I was<=
br>
however concerned that the file in this FS might have overwritten other LV<=
br>
data since the file is showing bigger than the volume size.<br>
<br>
</blockquote>
<br></span>
I&#39;ve no idea what &#39;ext4&#39; is showing you, but if you have i.e. 1=
00M filesystem size, you could still have there e.g. 1TB file. Experience t=
he magic:<br>
<br>
&#39;truncate -s 1T myfirst1TBfile&#39;<br>
<br>
As you can see &#39;ext4&#39; is doing it&#39;s own over-provisioning with =
&#39;hole&#39; files.<br>
The only important bits are:<br>
- is the filesystem consistent ?<br>
- is &#39;fsck&#39; not reporting any error ?<br>
<br>
What&#39;s the &#39;real&#39; size you get with &#39;du=C2=A0 myfirst1TBfil=
e&#39; or your wrong file ?<br>
<br>
Somehow I don&#39;t believe you can get=C2=A0 i.e.=C2=A0 90+MB &#39;du&#39;=
 size with 10MB filesystem size and &#39;fsck&#39; would not report any pro=
blem.<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I will try this using BTRFS.<br>
</blockquote>
<br></span>
For what exactly ??<br>
<br>
Regard<br>
<br>
Zdenek<br>
<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Fri, Apr 29, 2016 at 10:13 AM, Zdenek Kabelac &lt;<a href=3D"mailto:zkab=
elac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a><br></span><div><=
div class=3D"h5">
&lt;mailto:<a href=3D"mailto:zkabelac@redhat.com" target=3D"_blank">zkabela=
c@redhat.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On 28.4.2016 16:36, Bhasker C V wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Zdenek,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks. Here I am just filling it =
up with random data and so I am not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 concerned about data integrity<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You are right, I did get page lost=
 during write errors in the kernel<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The question however is even after reboot and d=
oing several fsck of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the ext4fs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the file size &quot;occupied&quot; is more than=
 the pool size. How is this ?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I agree that data may be corrupted, but there *=
is* some data and this<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 must be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved somewhere. Why is this &quot;somewhere&qu=
ot; exceeding the pool size ?<br>
<br>
<br>
=C2=A0 =C2=A0 Hi<br>
<br>
=C2=A0 =C2=A0 Few key principles -<br>
<br>
<br>
=C2=A0 =C2=A0 1. You should always mount extX fs with=C2=A0 errors=3Dremoun=
t-ro=C2=A0 (tune2fs,mount)<br>
<br>
=C2=A0 =C2=A0 2. There are few data=3D{} modes ensuring various degree of d=
ata integrity,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 An case you really care about data integrity he=
re - switch to &#39;journal&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode at price of lower speed. Default ordered m=
ode might show this.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (i.e. it&#39;s the very same behavior as you wo=
uld have seen with failing hdd)<br>
<br>
=C2=A0 =C2=A0 3. Do not continue using thin-pool when it&#39;s full :)<br>
<br>
=C2=A0 =C2=A0 4. We do miss more configurable policies with thin-pools.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i.e. do plan to instantiate &#39;error&#39; tar=
get for writes in the case<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pool gets full - so ALL writes will be errored =
- as of now - writes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to provisioned blocks may cause further filesys=
tem confusion - that&#39;s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 why=C2=A0 &#39;remount-ro&#39; is rather mandat=
ory - xfs is recently being enhanced<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to provide similar logic.<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 Regards<br>
<br>
<br>
=C2=A0 =C2=A0 Zdenek<br>
<br>
=C2=A0 =C2=A0 _______________________________________________<br>
=C2=A0 =C2=A0 linux-lvm mailing list<br></div></div>
=C2=A0 =C2=A0 <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">lin=
ux-lvm@redhat.com</a> &lt;mailto:<a href=3D"mailto:linux-lvm@redhat.com" ta=
rget=3D"_blank">linux-lvm@redhat.com</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm"=
 rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listin=
fo/linux-lvm</a><br>
=C2=A0 =C2=A0 read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-H=
OWTO/" rel=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO=
/</a><br>
<br>
<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</span></blockquote><div class=3D"HOEnZb"><div class=3D"h5">
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br></div>

--001a11c161f0f8ac9b0531ef2551--
