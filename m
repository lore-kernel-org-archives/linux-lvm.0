Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBCEKc131590
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 09:20:38 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBCEKUgN004373
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 09:20:30 -0500
Received: by zproxy.gmail.com with SMTP id 9so1380449nzo
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 06:20:30 -0800 (PST)
Message-ID: <52fe6b680512120620m2d9d462erdc37b7f3d79183de@mail.gmail.com>
Date: Mon, 12 Dec 2005 19:50:30 +0530
From: Anil Kumar Sharma <xplusaks@gmail.com>
Subject: Re: [linux-lvm] Converting LVM back to Ext2?
In-Reply-To: <45980936.20051212152523@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3657_9945598.1134397230077"
References: <45980936.20051212152523@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Andrey Subbotin <eploko@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_3657_9945598.1134397230077
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

U may reduce LV size and get some free space but that still will be lying o=
n
PV and there is no pvreduce (afaik).

So, I think (I may be wrong), U are out of luck. Get your luck back, have
same temporary storage for your data to change the size or convert PV.

UC, LVM is good for multi-partitions and multi-disks, everything in
multiples. That's the playground for LVM.
When U (re)start for FC4 or FC5, have your linux space on multiple PV's.
I will suggest utilize all 4 primary  partitions,
1. boot, 2. dual boot (if required) else PV and 3.& 4 also PV's. Swap goes
in LVM.
LVM can make them look like one or as desired partitions (LV's), which U ca=
n
change as per your requirements, even for dual boot.

 Hard luck with "auto partition" - it is good for itself! smart fellow not
caring for our moods.




On 12/12/05, Andrey Subbotin <eploko@gmail.com> wrote:
>
> Hello all.
>
> I've got a 200GB HD partitioned automatically during Fedora Core 4 setup.
> That is the disk carries 2 partitions where the first one (/dev/sda1) is
> ext3 mounted as /boot and the second one (/dev/sda2) is an LVM.
>
> That is all clear and fancy but the problem is I'm faced with the fact I
> need to migrate the HD to Ext2 FS, so I could convert it to FAT32 later, =
so
> I could access it from a copy of the Windows OS I happen to boot recently=
 to
> do some work. The LVM on /dev/sda2 is full of data I need to save and the
> problem is I don't have a spare HD to temporarily copy all those 200GB to=
.
>
> If I had a spare HD I would eventually mount it, make a new Ext2 partitio=
n
> on it and then copy all the data from the LogicalVolume to the new
> partition. Then I would fire up fdisk and kill the LVM, thus freeing the
> space on the drive. Then, moving the data back to the first HD would be a
> snap. But without a spare disk I face a real challenge.
>
> My initial idea was to reduce the FS inside the LogicalVolume (it has
> ~40GB free of space) and then reduce the size of the LogicalVolume and th=
en
> reduce the PhysicalVolume /dev/sda2 by the freed number of cylinders. The=
n,
> I would create an ext2 partition over the freed cylinders and move some
> files from the LogicalVolume onto it. Then I thought I would repeat the
> process several times effectively migrating my data from the ever-shrinki=
ng
> LVM to the ever-growing plain Ext2 FS.
>
> The problem is I have little idea how I can shrink an LVM partition on
> /dev/sda2. And there seem to be very little information on this on the ne=
t.
>
> So far, I have lvreduce'd the FS inside the LogicalVolume and the
> LogicalVolume itselft to 35700000 4k blocks. Now, how do I redeuce the
> number of cyllinders occupied by the LVM on /dev/sda?
>
> I would really apreciate any help or ideas.
> Thanks a lot in advance.
>
> --
> See you,
> Andrey
>
> ICQ UIN: 114087545
> Journal: http://www.livejournal.com/users/e_ploko/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
Anil Kumar Shrama

------=_Part_3657_9945598.1134397230077
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>U may reduce LV size and get some free space but that still will be ly=
ing on PV and there is no pvreduce (afaik).</div>
<div>&nbsp;</div>
<div>So, I think (I may be wrong), U are out of luck. Get your luck back,&n=
bsp;have same temporary storage for your data to change the size or convert=
 PV.&nbsp;</div>
<div>&nbsp;</div>
<div>UC, LVM is good for multi-partitions and multi-disks, everything in mu=
ltiples. That's the playground for LVM.</div>
<div>When U (re)start for FC4 or FC5, have your linux space on multiple PV'=
s.</div>
<div>I will suggest&nbsp;utilize all 4 primary &nbsp;partitions,</div>
<div>1. boot, 2. dual boot (if required) else PV and 3.&amp; 4 also PV's. S=
wap goes in LVM.</div>
<div>LVM can make them look like one or as desired partitions (LV's), which=
 U can change as per your requirements, even for dual boot.</div>
<div>&nbsp;</div>
<div>&nbsp;Hard luck with &quot;auto partition&quot; - it is good for itsel=
f! smart fellow not caring&nbsp;for our moods.<br><br>&nbsp;</div><br><br>
<div><span class=3D"gmail_quote">On 12/12/05, <b class=3D"gmail_sendername"=
>Andrey Subbotin</b> &lt;<a onclick=3D"return top.js.OpenExtLink(window,eve=
nt,this)" href=3D"mailto:eploko@gmail.com" target=3D"_blank">eploko@gmail.c=
om</a>
&gt; wrote:</span>=20
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hello all.<br><br>I've got a 200=
GB HD partitioned automatically during Fedora Core 4 setup. That is the dis=
k carries 2 partitions where the first one (/dev/sda1) is ext3 mounted as /=
boot and the second one (/dev/sda2) is an LVM.=20
<br><br>That is all clear and fancy but the problem is I'm faced with the f=
act I need to migrate the HD to Ext2 FS, so I could convert it to FAT32 lat=
er, so I could access it from a copy of the Windows OS I happen to boot rec=
ently to do some work. The LVM on /dev/sda2 is full of data I need to save =
and the problem is I don't have a spare HD to temporarily copy all those 20=
0GB to.=20
<br><br>If I had a spare HD I would eventually mount it, make a new Ext2 pa=
rtition on it and then copy all the data from the LogicalVolume to the new =
partition. Then I would fire up fdisk and kill the LVM, thus freeing the sp=
ace on the drive. Then, moving the data back to the first HD would be a sna=
p. But without a spare disk I face a real challenge.=20
<br><br>My initial idea was to reduce the FS inside the LogicalVolume (it h=
as ~40GB free of space) and then reduce the size of the LogicalVolume and t=
hen reduce the PhysicalVolume /dev/sda2 by the freed number of cylinders. T=
hen, I would create an ext2 partition over the freed cylinders and move som=
e files from the LogicalVolume onto it. Then I thought I would repeat the p=
rocess several times effectively migrating my data from the ever-shrinking =
LVM to the ever-growing plain Ext2 FS.=20
<br><br>The problem is I have little idea how I can shrink an LVM partition=
 on /dev/sda2. And there seem to be very little information on this on the =
net.<br><br>So far, I have lvreduce'd the FS inside the LogicalVolume and t=
he LogicalVolume itselft to 35700000 4k blocks. Now, how do I redeuce the n=
umber of cyllinders occupied by the LVM on /dev/sda?=20
<br><br>I would really apreciate any help or ideas.<br>Thanks a lot in adva=
nce.<br><br>--<br>See you,<br>Andrey<br><br>ICQ UIN: 114087545<br>Journal: =
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://=
www.livejournal.com/users/e_ploko/" target=3D"_blank">
http://www.livejournal.com/users/e_ploko/ </a><br><br>_____________________=
__________________________<br>linux-lvm mailing list<br><a onclick=3D"retur=
n top.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-lvm@redhat.co=
m" target=3D"_blank">
linux-lvm@redhat.com</a><br><a onclick=3D"return top.js.OpenExtLink(window,=
event,this)" href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" tar=
get=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm </a><br>re=
ad the LVM HOW-TO at=20
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://=
tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWT=
O/</a><br></blockquote></div><br><br clear=3D"all"><br>-- <br>Anil Kumar Sh=
rama=20

------=_Part_3657_9945598.1134397230077--
