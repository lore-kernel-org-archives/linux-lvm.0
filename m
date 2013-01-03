Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r03DPrfi010480
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 08:25:54 -0500
Received: from exprod6og121.obsmtp.com (exprod6og121.obsmtp.com [64.18.1.237])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id r03DPpVJ028359
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 08:25:51 -0500
Received: by mail-wi0-f197.google.com with SMTP id hm6so14280883wib.8
	for <linux-lvm@redhat.com>; Thu, 03 Jan 2013 05:25:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <50E55AFD.1040807@redhat.com>
References: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
	<50E55AFD.1040807@redhat.com>
Date: Thu, 3 Jan 2013 08:25:49 -0500
Message-ID: <CABTYv7XzCRM-ejqB+mxzAanc7bkvxX5AABW0WR7wcXrF=0Bvtg@mail.gmail.com>
From: Tyler Gates <tyler.gates@ats.coop>
Content-Type: multipart/alternative; boundary=089e0122f17027427204d2624db1
Subject: Re: [linux-lvm] Snapshot causing segault
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

--089e0122f17027427204d2624db1
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 3, 2013 at 5:18 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 31.12.2012 19:50, Tyler Gates napsal(a):
>
>  Hello everyone,
>>       I've been having an intermittent problem on random servers
>> segfaulting
>> while trying to create a snapshot under version  lvm2-2.02.17-7.38.3 on
>> kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4). The messages I get are:
>> ##############################**#############
>> Dec 27 07:45:39 chelco-app-01 kernel: Unable to handle kernel NULL pointer
>> dereference at virtual address 0000001c
>> Dec 27 07:45:39 chelco-app-01 kernel:  printing eip:
>> Dec 27 07:45:39 chelco-app-01 kernel: f90ab3a7
>> Dec 27 07:45:39 chelco-app-01 kernel: *pde = 3780a001
>> Dec 27 07:45:39 chelco-app-01 kernel: Oops: 0000 [#1]
>> Dec 27 07:45:39 chelco-app-01 kernel: SMP
>> Dec 27 07:45:39 chelco-app-01 kernel: last sysfs file:
>> /devices/pci0000:00/0000:00:**02.0/0000:04:00.1/irq
>> Dec 27 07:45:39 chelco-app-01 kernel: Modules linked in: raw dock button
>> battery ac loop dm_snapshot usbhid dm_mod uhci_hcd bnx2x hw_random
>> ehci_hcd
>> qla2xxx hpilo usbcore firmware_class scsi_transport_fc parport_pc lp
>> parport
>> ext3 jbd edd
>> fan thermal processor cciss sd_mod scsi_mod
>> Dec 27 07:45:39 chelco-app-01 kernel: CPU:    4
>> Dec 27 07:45:39 chelco-app-01 kernel: EIP:    0060:[<f90ab3a7>]
>>  Tainted: G
>>      X VLI
>> Dec 27 07:45:39 chelco-app-01 kernel: EFLAGS: 00210202
>> (2.6.16.60-0.93.1-bigsmp #1)
>> Dec 27 07:45:39 chelco-app-01 kernel: EIP is at __map_bio+0x50/0x11f
>> [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel: eax: f90960c4   ebx: 00000000   ecx:
>> f7ff2a60   edx: f7794440
>> Dec 27 07:45:39 chelco-app-01 kernel: esi: f7ff2a58   edi: f90960c4   ebp:
>> f46306c0   esp: f4c15d28
>> Dec 27 07:45:39 chelco-app-01 kernel: ds: 007b   es: 007b   ss: 0068
>> Dec 27 07:45:39 chelco-app-01 kernel: Process lvcreate (pid: 6678,
>> threadinfo=f4c14000 task=f7838680)
>> Dec 27 07:45:39 chelco-app-01 kernel: Stack: <0>f7794340 f7794440 f7794440
>> 03201ff0 00000000 03201ff0 00000000 00000008
>> Dec 27 07:45:39 chelco-app-01 kernel:        00000000 00000000 f90960c4
>> f7ff2a68 f46306c0 f90abd1b 00000000 00000001
>> Dec 27 07:45:39 chelco-app-01 kernel:        00000008 f428e2e0 fcdfe010
>> ffffffff c0113d62 00000000 0000001f f7ff2a58
>> Dec 27 07:45:39 chelco-app-01 kernel: Call Trace:
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90abd1b>]
>> __split_bio+0x182/0x440
>> [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0113d62>]
>> do_flush_tlb_all+0x0/0x5d
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90abff0>]
>> __flush_deferred_io+0x17/0x20 [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90ac14c>] dm_resume+0x8e/0xf9
>> [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90aedd8>]
>> dev_suspend+0x138/0x157
>> [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90af607>] ctl_ioctl+0x220/0x26e
>> [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90aeca0>] dev_suspend+0x0/0x157
>> [dm_mod]
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179ce8>] do_ioctl+0x48/0x5e
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179f60>] vfs_ioctl+0x262/0x275
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179fc7>] sys_ioctl+0x54/0x6d
>> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0103dcb>]
>> sysenter_past_esp+0x54/0x79
>> Dec 27 07:45:39 chelco-app-01 kernel: Code: b4 0a f9 89 70 40 8b 06 83 c0
>> 0c
>> f0 ff 00 8b 54 24 08 8d 4e 08 8b 02 8b 52 04 89 44 24 0c 89 f8 89 54 24
>> 10 8b
>> 5f 04 8b 54 24 08 <ff> 53 1c 83 f8 00 89 c2 0f 8e 93 00 00 00 8b 54 24 08
>> 8b 42 0c
>> ##############################**##############################**#
>>
>> The result is the target volume gets suspended and the only way to fix it
>> is
>> to reboot and remove the faulty snapshot when it comes back up.
>>
>> Now the script I wrote that creates these snapshots will use all available
>> extents from the Volume Group pool which in this case was actually larger
>> than
>> the size of the volume I was trying to snapshot. Thinking this was the
>> problem, I tried creating the snapshot several times using a snapshot size
>> less than or equal to the target volume and it worked every time. So, I
>> tried
>> a value larger than the target to generate a crash and it did BUT not
>> every
>> time. In fact now I can't get it to segfault at all.
>>
>> So my question is: is creating the snapshot volume with a size larger
>> than the
>> target volume inducing segfaults randomly or could there be another
>> problem
>> lurking? If these weren't production machines I would normally just go
>> with a
>> size smaller than the target but I really need to be sure what exactly is
>> causing the segfaults.
>>
>> Any help would be appreciated.
>>
>
>
> Any special reason to use lvm2 from the year 2006 in the year 2013 ?
>

Yes. It is from a specific version of an OS we tested as being stable back
in the day, which unfortunately uses older software such as this LVM
version. It wasn't until recently that I wanted to start using LVM.


> There is no big point in fixing some particular bugs any many years
> obsoleted source code.
>
> Can you try to use/rebuild more recent version?
>

I realize trying a more recent version would be the best thing to do
assuming it would be easy (in this situation it would be a big hassle) but
I was hoping someone could tell me either "yes over allocating to the
snapshot could cause this" or  "it sounds like a bug in that version"
before I go through all that trouble.


>
> Zdenek
>
>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>



-- 

Tyler Gates*
*

*ATS* | Sr. Systems Administrator

Tyler.Gates@ats.coop

*The Power of **One** Software Solution - **OpenOne*


 910.210.4100 main  |  910.210.4150 fax |  910.210.4118 direct |
910.358.3063 mobile |


This email may contain information that is confidential or attorney-client
privileged and may constitute inside
information. The contents of this email are intended only for the
recipient(s) listed above.  If you are not the
intended recipient, you are directed not to read, disclose, distribute or
otherwise use this transmission.  If you
received this email in error, please notify the sender immediately and
delete the transmission.  Delivery of the
message is not intended to waive any applicable privileges.

--089e0122f17027427204d2624db1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, J=
an 3, 2013 at 5:18 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dne 31.12.2012 19:50, Tyler Gates napsal(a):=
<div><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello everyone,<br>
=A0 =A0 =A0 I&#39;ve been having an intermittent problem on random servers =
segfaulting<br>
while trying to create a snapshot under version =A0lvm2-2.02.17-7.38.3 on<b=
r>
kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4). The messages I get are:<br>
##############################<u></u>#############<br>
Dec 27 07:45:39 chelco-app-01 kernel: Unable to handle kernel NULL pointer<=
br>
dereference at virtual address 0000001c<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0printing eip:<br>
Dec 27 07:45:39 chelco-app-01 kernel: f90ab3a7<br>
Dec 27 07:45:39 chelco-app-01 kernel: *pde =3D 3780a001<br>
Dec 27 07:45:39 chelco-app-01 kernel: Oops: 0000 [#1]<br>
Dec 27 07:45:39 chelco-app-01 kernel: SMP<br>
Dec 27 07:45:39 chelco-app-01 kernel: last sysfs file:<br>
/devices/pci0000:00/0000:00:<u></u>02.0/0000:04:00.1/irq<br>
Dec 27 07:45:39 chelco-app-01 kernel: Modules linked in: raw dock button<br=
>
battery ac loop dm_snapshot usbhid dm_mod uhci_hcd bnx2x hw_random ehci_hcd=
<br>
qla2xxx hpilo usbcore firmware_class scsi_transport_fc parport_pc lp parpor=
t<br>
ext3 jbd edd<br>
fan thermal processor cciss sd_mod scsi_mod<br>
Dec 27 07:45:39 chelco-app-01 kernel: CPU: =A0 =A04<br>
Dec 27 07:45:39 chelco-app-01 kernel: EIP: =A0 =A00060:[&lt;f90ab3a7&gt;] =
=A0 =A0Tainted: G<br>
=A0 =A0 =A0X VLI<br>
Dec 27 07:45:39 chelco-app-01 kernel: EFLAGS: 00210202<br>
(2.6.16.60-0.93.1-bigsmp #1)<br>
Dec 27 07:45:39 chelco-app-01 kernel: EIP is at __map_bio+0x50/0x11f [dm_mo=
d]<br>
Dec 27 07:45:39 chelco-app-01 kernel: eax: f90960c4 =A0 ebx: 00000000 =A0 e=
cx:<br>
f7ff2a60 =A0 edx: f7794440<br>
Dec 27 07:45:39 chelco-app-01 kernel: esi: f7ff2a58 =A0 edi: f90960c4 =A0 e=
bp:<br>
f46306c0 =A0 esp: f4c15d28<br>
Dec 27 07:45:39 chelco-app-01 kernel: ds: 007b =A0 es: 007b =A0 ss: 0068<br=
>
Dec 27 07:45:39 chelco-app-01 kernel: Process lvcreate (pid: 6678,<br>
threadinfo=3Df4c14000 task=3Df7838680)<br>
Dec 27 07:45:39 chelco-app-01 kernel: Stack: &lt;0&gt;f7794340 f7794440 f77=
94440<br>
03201ff0 00000000 03201ff0 00000000 00000008<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0 =A0 =A0 =A000000000 00000000 f909=
60c4<br>
f7ff2a68 f46306c0 f90abd1b 00000000 00000001<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0 =A0 =A0 =A000000008 f428e2e0 fcdf=
e010<br>
ffffffff c0113d62 00000000 0000001f f7ff2a58<br>
Dec 27 07:45:39 chelco-app-01 kernel: Call Trace:<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90abd1b&gt;] __split_bio+0x1=
82/0x440<br>
[dm_mod]<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0113d62&gt;] do_flush_tlb_al=
l+0x0/0x5d<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90abff0&gt;]<br>
__flush_deferred_io+0x17/0x20 [dm_mod]<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90ac14c&gt;] dm_resume+0x8e/=
0xf9 [dm_mod]<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90aedd8&gt;] dev_suspend+0x1=
38/0x157<br>
[dm_mod]<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90af607&gt;] ctl_ioctl+0x220=
/0x26e [dm_mod]<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90aeca0&gt;] dev_suspend+0x0=
/0x157 [dm_mod]<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0179ce8&gt;] do_ioctl+0x48/0=
x5e<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0179f60&gt;] vfs_ioctl+0x262=
/0x275<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0179fc7&gt;] sys_ioctl+0x54/=
0x6d<br>
Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0103dcb&gt;] sysenter_past_e=
sp+0x54/0x79<br>
Dec 27 07:45:39 chelco-app-01 kernel: Code: b4 0a f9 89 70 40 8b 06 83 c0 0=
c<br>
f0 ff 00 8b 54 24 08 8d 4e 08 8b 02 8b 52 04 89 44 24 0c 89 f8 89 54 24 10 =
8b<br>
5f 04 8b 54 24 08 &lt;ff&gt; 53 1c 83 f8 00 89 c2 0f 8e 93 00 00 00 8b 54 2=
4 08 8b 42 0c<br>
##############################<u></u>##############################<u></u>#=
<br>
<br>
The result is the target volume gets suspended and the only way to fix it i=
s<br>
to reboot and remove the faulty snapshot when it comes back up.<br>
<br>
Now the script I wrote that creates these snapshots will use all available<=
br>
extents from the Volume Group pool which in this case was actually larger t=
han<br>
the size of the volume I was trying to snapshot. Thinking this was the<br>
problem, I tried creating the snapshot several times using a snapshot size<=
br>
less than or equal to the target volume and it worked every time. So, I tri=
ed<br>
a value larger than the target to generate a crash and it did BUT not every=
<br>
time. In fact now I can&#39;t get it to segfault at all.<br>
<br>
So my question is: is creating the snapshot volume with a size larger than =
the<br>
target volume inducing segfaults randomly or could there be another problem=
<br>
lurking? If these weren&#39;t production machines I would normally just go =
with a<br>
size smaller than the target but I really need to be sure what exactly is<b=
r>
causing the segfaults.<br>
<br>
Any help would be appreciated.<br>
</blockquote>
<br>
<br></div></div>
Any special reason to use lvm2 from the year 2006 in the year 2013 ?<br></b=
lockquote><div><br></div><div>Yes. It is from a specific version of an OS w=
e tested as being stable back in the day, which unfortunately uses older so=
ftware such as this LVM version. It wasn&#39;t until recently that I wanted=
 to start using LVM.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
There is no big point in fixing some particular bugs any many years obsolet=
ed source code.<br>
<br>
Can you try to use/rebuild more recent version?<br></blockquote><div><br></=
div><div>I realize trying a more recent version would be the best thing to =
do assuming it would be easy (in this situation it would be a big hassle) b=
ut I was hoping someone could tell me either &quot;yes over allocating to t=
he snapshot could cause this&quot; or =A0&quot;it sounds like a bug in that=
 version&quot; before I go through all that trouble.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Zdenek<br>
<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><p><span sty=
le=3D"font-style:normal">Tyler Gates</span><font color=3D"#008000"><b><br><=
/b></font></p><p><font color=3D"#008000"><b>ATS</b></font> | Sr. Systems
Administrator</p><p><a href=3D"mailto:Tyler.Gates@ats.coop" target=3D"_blan=
k">Tyler.Gates@ats.coop</a></p>
<p><i>The Power of </i><font color=3D"#ff0000"><i><b>One</b></i></font><i>
Software Solution - </i><i><b>OpenOne</b></i></p>
<p><br>=A0<font>910.210.4100 main=A0 |=A0
910.210.4150 fax | =A0910.210.4118 direct |=A0 910.358.3063
mobile | </font>
</p>
<p><font color=3D"#1f497d"><font style=3D"font-size:8pt" size=3D"1"><br>
This email may contain information that is confidential or attorney-client =
privileged and may constitute inside<br>
information.=A0The contents of this email are intended only for the recipie=
nt(s) listed above.=A0 If you are not the<br>
intended recipient, you are directed not to read, disclose, distribute or o=
therwise use this transmission.=A0 If you<br>
received this email in error, please notify the sender immediately and dele=
te the transmission.=A0 Delivery of the<br>
message is not intended to waive any applicable privileges.</font></font></=
p>
</div>

--089e0122f17027427204d2624db1--
