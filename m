Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3SEaP4i021841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 10:36:25 -0400
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A87B11055D
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 14:36:23 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id x1so19291772obt.0
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 07:36:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5720CDAF.1020604@redhat.com>
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
Date: Thu, 28 Apr 2016 16:36:23 +0200
Message-ID: <CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
From: Bhasker C V <bhasker@unixindia.com>
Content-Type: multipart/alternative; boundary=089e013c64064c392e05318c738d
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

--089e013c64064c392e05318c738d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Zdenek,
 Thanks. Here I am just filling it up with random data and so I am not
concerned about data integrity
 You are right, I did get page lost during write errors in the kernel

The question however is even after reboot and doing several fsck of the
ext4fs the file size "occupied" is more than the pool size. How is this ?
I agree that data may be corrupted, but there *is* some data and this must
be saved somewhere. Why is this "somewhere" exceeding the pool size ?


On Wed, Apr 27, 2016 at 4:33 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote=
:

> On 27.4.2016 14:33, Bhasker C V wrote:
>
>> Hi,
>>
>>   I am starting with investigating about the lvm thin provisioning
>>   (repeat post from
>> https://lists.debian.org/debian-user/2016/04/msg00852.html )
>>   (apologies for html mail)
>>
>>   I have done the following
>>
>> 1.Create a PV
>> vdb    252:16   0   10G  0 disk
>> =E2=94=9C=E2=94=80vdb1 252:17   0  100M  0 part
>> =E2=94=94=E2=94=80vdb2 252:18   0  9.9G  0 part
>> root@vmm-deb:~# pvcreate /dev/vdb1
>>    Physical volume "/dev/vdb1" successfully created.
>> root@vmm-deb:~# pvs
>>    PV         VG   Fmt  Attr PSize   PFree
>>    /dev/vdb1       lvm2 ---  100.00m 100.00m
>>
>> 2. create a VG
>> root@vmm-deb:~# vgcreate virtp /dev/vdb1
>>    Volume group "virtp" successfully created
>> root@vmm-deb:~# vgs
>>    VG    #PV #LV #SN Attr   VSize  VFree
>>    virtp   1   0   0 wz--n- 96.00m 96.00m
>>
>> 3. create a lv pool  and a over-provisioned volume inside it
>> root@vmm-deb:~# lvcreate -n virtpool -T virtp/virtpool -L40M
>>    Logical volume "virtpool" created.
>> root@vmm-deb:~# lvs
>>    LV       VG    Attr       LSize  Pool Origin Data%  Meta%  Move Log
>> Cpy%Sync Convert
>>    virtpool virtp twi-a-tz-- 40.00m             0.00   0.88
>> root@vmm-deb:~# lvcreate  -V1G -T virtp/virtpool -n vol01
>>    WARNING: Sum of all thin volume sizes (1.00 GiB) exceeds the size of
>> thin
>> pool virtp/virtpool and the size of whole volume group (96.00 MiB)!
>>    For thin pool auto extension activation/thin_pool_autoextend_threshol=
d
>> should be below 100.
>>    Logical volume "vol01" created.
>> root@vmm-deb:~# lvs
>>    LV       VG    Attr       LSize  Pool     Origin Data%  Meta%  Move L=
og
>> Cpy%Sync Convert
>>    virtpool virtp twi-aotz-- 40.00m                 0.00   0.98
>>    vol01    virtp Vwi-a-tz--  1.00g virtpool        0.00
>>
>> ---------- Now the operations
>> # dd if=3D/dev/urandom of=3D./fil status=3Dprogress
>> 90532864 bytes (91 MB, 86 MiB) copied, 6.00005 s, 15.1 MB/s^C
>> 188706+0 records in
>> 188705+0 records out
>> 96616960 bytes (97 MB, 92 MiB) copied, 6.42704 s, 15.0 MB/s
>>
>> # df -h .
>> Filesystem               Size  Used Avail Use% Mounted on
>> /dev/mapper/virtp-vol01  976M   95M  815M  11% /tmp/x
>> # sync
>> # cd ..
>> root@vmm-deb:/tmp# umount x
>> root@vmm-deb:/tmp# fsck.ext4 -f -C0  /dev/virtp/vol01
>> e2fsck 1.43-WIP (15-Mar-2016)
>> Pass 1: Checking inodes, blocks, and sizes
>> Pass 2: Checking directory structure
>> Pass 3: Checking directory connectivity
>> Pass 4: Checking reference counts
>> Pass 5: Checking group summary information
>> /dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 36544/262144
>> blocks
>>
>> <mount>
>> # du -hs fil
>> 93M    fil
>>
>> # dd if=3D./fil of=3D/dev/null status=3Dprogress
>> 188705+0 records in
>> 188705+0 records out
>> 96616960 bytes (97 MB, 92 MiB) copied, 0.149194 s, 648 MB/s
>>
>>
>> # vgs
>>    VG    #PV #LV #SN Attr   VSize  VFree
>>    virtp   1   2   0 wz--n- 96.00m 48.00m
>>
>> Definetly the file is occupying 90+MB.
>>
>> What i expect is that the pool is 40M and the file must NOT exceed 40M.
>> Where
>> does the file get 93M space ?
>> I know the VG is 96M but the pool created was max 40M (also VG still say=
s
>> 48M
>> free). Is the file exceeding the boundaries ?
>> or am I doing anything wrong ?
>>
>>
>
> Hi
>
> Answer is simple ->  nowhere - they are simply lost - check your kernel
> dmesg log - you will spot lost of async write error.
> (page cache is tricky here...    - dd ends just in page-cache which is
> later asynchronously sync to disk)
>
> There is also 60s delay before thin-pool target starts to error all queue=
d
> write operations if there is not enough space in pool.
>
> So whenever you write something and you want to be 100% 'sure' it landed
> on disk you have to 'sync'  your writes.
>
> i.e.
> dd if=3D/dev/urandom of=3D./fil status=3Dprogress  conf=3Dfsync
>
> and if you want to know 'exactly' what's the error place -
>
> dd if=3D/dev/urandom of=3D./fil status=3Dprogress oflags=3Ddirect
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--089e013c64064c392e05318c738d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Zdenek,<br></div>=C2=A0Thanks. Here I =
am just filling it up with random data and so I am not concerned about data=
 integrity<br></div>=C2=A0You are right, I did get page lost during write e=
rrors in the kernel <br><br></div>The question however is even after reboot=
 and doing several fsck of the ext4fs the file size &quot;occupied&quot; is=
 more than the pool size. How is this ? <br></div>I agree that data may be =
corrupted, but there *is* some data and this must be saved somewhere. Why i=
s this &quot;somewhere&quot; exceeding the pool size ? <br><br></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 27, 2016 at=
 4:33 PM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@r=
edhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 27=
.4.2016 14:33, Bhasker C V wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
=C2=A0 I am starting with investigating about the lvm thin provisioning<br>
=C2=A0 (repeat post from <a href=3D"https://lists.debian.org/debian-user/20=
16/04/msg00852.html" rel=3D"noreferrer" target=3D"_blank">https://lists.deb=
ian.org/debian-user/2016/04/msg00852.html</a> )<br>
=C2=A0 (apologies for html mail)<br>
<br>
=C2=A0 I have done the following<br>
<br>
1.Create a PV<br>
vdb=C2=A0 =C2=A0 252:16=C2=A0 =C2=A00=C2=A0 =C2=A010G=C2=A0 0 disk<br>
=E2=94=9C=E2=94=80vdb1 252:17=C2=A0 =C2=A00=C2=A0 100M=C2=A0 0 part<br>
=E2=94=94=E2=94=80vdb2 252:18=C2=A0 =C2=A00=C2=A0 9.9G=C2=A0 0 part<br>
root@vmm-deb:~# pvcreate /dev/vdb1<br>
=C2=A0 =C2=A0Physical volume &quot;/dev/vdb1&quot; successfully created.<br=
>
root@vmm-deb:~# pvs<br>
=C2=A0 =C2=A0PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=A0Fmt=C2=A0 A=
ttr PSize=C2=A0 =C2=A0PFree<br>
=C2=A0 =C2=A0/dev/vdb1=C2=A0 =C2=A0 =C2=A0 =C2=A0lvm2 ---=C2=A0 100.00m 100=
.00m<br>
<br>
2. create a VG<br>
root@vmm-deb:~# vgcreate virtp /dev/vdb1<br>
=C2=A0 =C2=A0Volume group &quot;virtp&quot; successfully created<br>
root@vmm-deb:~# vgs<br>
=C2=A0 =C2=A0VG=C2=A0 =C2=A0 #PV #LV #SN Attr=C2=A0 =C2=A0VSize=C2=A0 VFree=
<br>
=C2=A0 =C2=A0virtp=C2=A0 =C2=A01=C2=A0 =C2=A00=C2=A0 =C2=A00 wz--n- 96.00m =
96.00m<br>
<br>
3. create a lv pool=C2=A0 and a over-provisioned volume inside it<br>
root@vmm-deb:~# lvcreate -n virtpool -T virtp/virtpool -L40M<br>
=C2=A0 =C2=A0Logical volume &quot;virtpool&quot; created.<br>
root@vmm-deb:~# lvs<br>
=C2=A0 =C2=A0LV=C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=A0 Attr=C2=A0 =C2=A0=
 =C2=A0 =C2=A0LSize=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log<br>
Cpy%Sync Convert<br>
=C2=A0 =C2=A0virtpool virtp twi-a-tz-- 40.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00.00=C2=A0 =C2=A00.88<br>
root@vmm-deb:~# lvcreate=C2=A0 -V1G -T virtp/virtpool -n vol01<br>
=C2=A0 =C2=A0WARNING: Sum of all thin volume sizes (1.00 GiB) exceeds the s=
ize of thin<br>
pool virtp/virtpool and the size of whole volume group (96.00 MiB)!<br>
=C2=A0 =C2=A0For thin pool auto extension activation/thin_pool_autoextend_t=
hreshold<br>
should be below 100.<br>
=C2=A0 =C2=A0Logical volume &quot;vol01&quot; created.<br>
root@vmm-deb:~# lvs<br>
=C2=A0 =C2=A0LV=C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=A0 Attr=C2=A0 =C2=A0=
 =C2=A0 =C2=A0LSize=C2=A0 Pool=C2=A0 =C2=A0 =C2=A0Origin Data%=C2=A0 Meta%=
=C2=A0 Move Log<br>
Cpy%Sync Convert<br>
=C2=A0 =C2=A0virtpool virtp twi-aotz-- 40.00m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.00=C2=A0 =C2=A00.98<br>
=C2=A0 =C2=A0vol01=C2=A0 =C2=A0 virtp Vwi-a-tz--=C2=A0 1.00g virtpool=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0.00<br>
<br>
---------- Now the operations<br>
# dd if=3D/dev/urandom of=3D./fil status=3Dprogress<br>
90532864 bytes (91 MB, 86 MiB) copied, 6.00005 s, 15.1 MB/s^C<br>
188706+0 records in<br>
188705+0 records out<br>
96616960 bytes (97 MB, 92 MiB) copied, 6.42704 s, 15.0 MB/s<br>
<br>
# df -h .<br>
Filesystem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size=C2=A0=
 Used Avail Use% Mounted on<br>
/dev/mapper/virtp-vol01=C2=A0 976M=C2=A0 =C2=A095M=C2=A0 815M=C2=A0 11% /tm=
p/x<br>
# sync<br>
# cd ..<br>
root@vmm-deb:/tmp# umount x<br>
root@vmm-deb:/tmp# fsck.ext4 -f -C0=C2=A0 /dev/virtp/vol01<br>
e2fsck 1.43-WIP (15-Mar-2016)<br>
Pass 1: Checking inodes, blocks, and sizes<br>
Pass 2: Checking directory structure<br>
Pass 3: Checking directory connectivity<br>
Pass 4: Checking reference counts<br>
Pass 5: Checking group summary information<br>
/dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 36544/262144 blocks=
<br>
<br>
&lt;mount&gt;<br>
# du -hs fil<br>
93M=C2=A0 =C2=A0 fil<br>
<br>
# dd if=3D./fil of=3D/dev/null status=3Dprogress<br>
188705+0 records in<br>
188705+0 records out<br>
96616960 bytes (97 MB, 92 MiB) copied, 0.149194 s, 648 MB/s<br>
<br>
<br>
# vgs<br>
=C2=A0 =C2=A0VG=C2=A0 =C2=A0 #PV #LV #SN Attr=C2=A0 =C2=A0VSize=C2=A0 VFree=
<br>
=C2=A0 =C2=A0virtp=C2=A0 =C2=A01=C2=A0 =C2=A02=C2=A0 =C2=A00 wz--n- 96.00m =
48.00m<br>
<br>
Definetly the file is occupying 90+MB.<br>
<br>
What i expect is that the pool is 40M and the file must NOT exceed 40M. Whe=
re<br>
does the file get 93M space ?<br>
I know the VG is 96M but the pool created was max 40M (also VG still says 4=
8M<br>
free). Is the file exceeding the boundaries ?<br>
or am I doing anything wrong ?<br>
<br>
</blockquote>
<br>
<br></div></div>
Hi<br>
<br>
Answer is simple -&gt;=C2=A0 nowhere - they are simply lost - check your ke=
rnel dmesg log - you will spot lost of async write error.<br>
(page cache is tricky here...=C2=A0 =C2=A0 - dd ends just in page-cache whi=
ch is later asynchronously sync to disk)<br>
<br>
There is also 60s delay before thin-pool target starts to error all queued =
write operations if there is not enough space in pool.<br>
<br>
So whenever you write something and you want to be 100% &#39;sure&#39; it l=
anded on disk you have to &#39;sync&#39;=C2=A0 your writes.<br>
<br>
i.e.<br>
dd if=3D/dev/urandom of=3D./fil status=3Dprogress=C2=A0 conf=3Dfsync<br>
<br>
and if you want to know &#39;exactly&#39; what&#39;s the error place -<br>
<br>
dd if=3D/dev/urandom of=3D./fil status=3Dprogress oflags=3Ddirect<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockqu=
ote></div><br></div>

--089e013c64064c392e05318c738d--
