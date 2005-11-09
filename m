Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA9L3xV28642
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 16:03:59 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA9L3qsG013064
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 16:03:52 -0500
Received: by xproxy.gmail.com with SMTP id r21so656932wxc
	for <linux-lvm@redhat.com>; Wed, 09 Nov 2005 13:03:47 -0800 (PST)
Message-ID: <ddaf98bd0511091303y34bd9b47p7ae4257cdd534574@mail.gmail.com>
Date: Wed, 9 Nov 2005 15:03:46 -0600
From: Cory Zerwas <gannas@gmail.com>
Subject: Re: [linux-lvm] Missing 1 of 3 PVs and all partition tables are good
In-Reply-To: <ddaf98bd0511090937k1fd05f5ep20cc5a643955d916@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_8494_18304759.1131570226633"
References: <ddaf98bd0511090937k1fd05f5ep20cc5a643955d916@mail.gmail.com>
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
To: linux-lvm@redhat.com

------=_Part_8494_18304759.1131570226633
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Whoops, where's my head at... I forgot the critical bits:

LVM ver 2.01.08 (2005-03-22)
Library ver 1.01.02 (2005-05-17)
Driver ver 4.4.0
Fedora Core 4 with 2.6.13-1.1526 kernel

hda are the system essentials; /boot, /, and swap
hdb, hdc, hdd are the LVM disks. Each disk contains 1 primary type 8e
partition from beginning to end of disk.

Also, recently while I was tinkering with it I attempted a 'vgcfgrestore
bloaty' and received:

Couldn't find device with uuid 'tfkC8Z-sWLe-09A5-1Yow-qKw1-0DZz-x73mWt'.
Couldn't find all physical volumes for volume group videovg.
Restore failed.

I surmise that that uuid belongs to hdb1. Would this be the appropriate
point to restore pv metadata?
http://www.tldp.org/HOWTO/html_single/LVM-HOWTO/#recovermetadata

If I've omitted anything please let me know.

Thanks again,
Cory

On 11/9/05, Cory Zerwas <gannas@gmail.com> wrote:
>
> Hi all,
>
> I'm in a pinch. I've got about 500Gb of data trapped in a non-functioning
> VG... Here's the deal:
>
> I upgraded from FC3 to FC4, or tried to. The whole update bombed out but
> during this time the LVM disks were unplugged from the system. When I got
> the new system up on the old FS my LVM conf still appears to be in place.=
 I
> powered up the 3 drives and reset the system and I found the VG won't
> activate.
> I did not export the volume first. I realize now that this was a mistake.
>
> I have 3 whole disks for this VG, each with 1 partition, type 8e,
> occupying the entire disk. These are hdb1, hdc1, hdd1.
>
> I'm noticing that an "fdisk -l" lists hdb, hdc, and hdd as all having
> partitions of type 8e from beginning to end of disk. However, when I go i=
nto
> LVM and run "pvscan" I only see two PVs belonging to my VG "bloaty" and i=
t
> shows:
>
> PV /dev/hdc1 VG bloaty lvm2 [111.78 GB / 0 free]
> PV /dev/hdd1 VG bloaty lvm2 [115.03 GB / 64.00 MB free]
> Total: 2 [266.81 GB] / in use: 2 [226.81 GB] / in no VG: 0 [0 ]
>
> LVM doesn't seem to notice /dev/hdb1? It's a 232.88 Gb PV, how can this
> be? And why isn't PVSCAN complaining about a missing PV? It should be,
> shouldn't it?
>
> When I perform a "lvmdiskscan" I get (the parenthesis outline my input):
>
> /dev/hda1 [ 101.94 MB]
> (^^this is the /boot partition)
> /dev/hdc1 [ 111.79 GB] LVM physical volume
> /dev/hda2 [ 17.54 GB]
> (^^this is the / partition)
> /dev/hda3 [ 1.00 GB]
> (^^this is the swap partition)
> /dev/hdb1 [ 232.88 GB]
> (^^THIS SHOULD BE A PV)
> /dev/hdd1 [ 115.04 GB] LVM physical volume
>
> Is there some trick here I don't know about? Do I have to restore the LVM
> conf?
>
> I am stumped. I'm pretty sure I'm not a newb, but I am definately not a
> wizard. I've got my LPIC Level 1 cert if that means anything.
>
> Heh, thanks for any help,
> Cory
>

------=_Part_8494_18304759.1131570226633
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Whoops, where's my head at...&nbsp; I forgot the critical bits:<br>
<br>
LVM ver 2.01.08 (2005-03-22)<br>
Library ver 1.01.02 (2005-05-17)<br>
Driver ver 4.4.0<br>
Fedora Core 4 with 2.6.13-1.1526 kernel<br>
<br>
hda are the system essentials; /boot, /, and swap<br>
hdb, hdc, hdd are the LVM disks.&nbsp; Each disk contains 1 primary type 8e=
 partition from beginning to end of disk.<br>
<br>
Also, recently while I was tinkering with it I attempted a 'vgcfgrestore bl=
oaty' and received:<br>
<br>
Couldn't find device with uuid 'tfkC8Z-sWLe-09A5-1Yow-qKw1-0DZz-x73mWt'.<br=
>
Couldn't find all physical volumes for volume group videovg.<br>
Restore failed.<br>
<br>
I surmise that that uuid belongs to hdb1.&nbsp; Would this be the appropria=
te point to restore pv metadata?<br>
<a href=3D"http://www.tldp.org/HOWTO/html_single/LVM-HOWTO/#recovermetadata=
">http://www.tldp.org/HOWTO/html_single/LVM-HOWTO/#recovermetadata</a><br>
<br>
If I've omitted anything please let me know.<br>
<br>
Thanks again,<br>
Cory<br><br><div><span class=3D"gmail_quote">On 11/9/05, <b class=3D"gmail_=
sendername">Cory Zerwas</b> &lt;<a href=3D"mailto:gannas@gmail.com">gannas@=
gmail.com</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"b=
order-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; paddin=
g-left: 1ex;">
Hi all,<br>
<br>
I'm in a pinch.&nbsp; I've got about 500Gb of data trapped in a non-functio=
ning VG...&nbsp; Here's the deal:<br>
<br>
I upgraded from FC3 to FC4, or tried to.&nbsp; The whole update bombed
out but during this time the LVM disks were unplugged from the
system.&nbsp; When I got the new system up on the old FS my LVM conf
still appears to be in place.&nbsp; I powered up the 3 drives and reset
the system and I found the VG won't activate.<br>
I did not export the volume first.&nbsp; I realize now that this was a mist=
ake.<br>
<br>
I have 3 whole disks for this VG, each with 1 partition, type 8e, occupying=
 the entire disk.&nbsp; These are hdb1, hdc1, hdd1.<br>
<br>
I'm noticing that an &quot;fdisk -l&quot; lists hdb, hdc, and hdd as all ha=
ving
partitions of type 8e from beginning to end of disk.&nbsp; However,
when I go into LVM and run &quot;pvscan&quot; I only see two PVs belonging =
to my
VG &quot;bloaty&quot; and it shows:<br>
<br>
PV /dev/hdc1&nbsp;&nbsp; VG bloaty&nbsp;&nbsp; lvm2 [111.78 GB / 0&nbsp;&nb=
sp;&nbsp; free]<br>
PV /dev/hdd1&nbsp;&nbsp; VG bloaty&nbsp;&nbsp; lvm2 [115.03 GB / 64.00 MB f=
ree]<br>
Total: 2 [266.81 GB] / in use: 2 [226.81 GB] / in no VG: 0 [0&nbsp;&nbsp; ]=
<br>
<br>
LVM doesn't seem to notice /dev/hdb1?&nbsp; It's a 232.88 Gb PV, how
can this be?&nbsp; And why isn't PVSCAN complaining about a missing
PV?&nbsp; It should be, shouldn't it?<br>
<br>
When I perform a &quot;lvmdiskscan&quot; I get (the parenthesis outline my =
input):<br>
<br>
/dev/hda1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 101.94 MB]<br>
(^^this is the /boot partition)<br>
/dev/hdc1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 111.79 GB] LVM physical volume<br=
>
/dev/hda2 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17.54 GB]<br>
(^^this is the / partition)<br>
/dev/hda3 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.00 GB]<br>
(^^this is the swap partition)<br>
/dev/hdb1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 232.88 GB]<br>
(^^THIS SHOULD BE A PV)<br>
/dev/hdd1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 115.04 GB] LVM physical volume<br=
>
<br>
Is there some trick here I don't know about?&nbsp; Do I have to restore the=
 LVM conf?<br>
<br>
I am stumped.&nbsp; I'm pretty sure I'm not a newb, but I am definately
not a wizard.&nbsp; I've got my LPIC Level 1 cert if that means
anything.<br>
<br>
Heh, thanks for any help,<br><span class=3D"sg">
Cory<br>

</span></blockquote></div><br>

------=_Part_8494_18304759.1131570226633--
