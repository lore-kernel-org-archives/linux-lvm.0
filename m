Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBREkXiS010362
	for <linux-lvm@redhat.com>; Thu, 27 Dec 2012 09:46:33 -0500
Received: from exprod6og115.obsmtp.com (exprod6og115.obsmtp.com [64.18.1.35])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id qBREkTXa014882
	for <linux-lvm@redhat.com>; Thu, 27 Dec 2012 09:46:29 -0500
Received: by mail-la0-f69.google.com with SMTP id w12so8198532lag.4
	for <linux-lvm@redhat.com>; Thu, 27 Dec 2012 06:46:27 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 27 Dec 2012 09:46:22 -0500
Message-ID: <CABTYv7U7WgmFQrmQzQaMZM4tbvjue5yKntPQjU6Tyco4yz6y2Q@mail.gmail.com>
From: Tyler Gates <tyler.gates@ats.coop>
Content-Type: multipart/alternative; boundary=f46d043bdf38539d5304d1d69c31
Subject: [linux-lvm] Snapshot causing segfault
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
To: linux-lvm@redhat.com

--f46d043bdf38539d5304d1d69c31
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone,
     I've been having an intermittent problem on random servers segfaulting
while trying to create a snapshot under version  lvm2-2.02.17-7.38.3 on
kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4). The messages I get are:
###########################################
Dec 27 07:45:39 chelco-app-01 kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000001c
Dec 27 07:45:39 chelco-app-01 kernel:  printing eip:
Dec 27 07:45:39 chelco-app-01 kernel: f90ab3a7
Dec 27 07:45:39 chelco-app-01 kernel: *pde = 3780a001
Dec 27 07:45:39 chelco-app-01 kernel: Oops: 0000 [#1]
Dec 27 07:45:39 chelco-app-01 kernel: SMP
Dec 27 07:45:39 chelco-app-01 kernel: last sysfs file:
/devices/pci0000:00/0000:00:02.0/0000:04:00.1/irq
Dec 27 07:45:39 chelco-app-01 kernel: Modules linked in: raw dock button
battery ac loop dm_snapshot usbhid dm_mod uhci_hcd bnx2x hw_random ehci_hcd
qla2xxx hpilo usbcore firmware_class scsi_transport_fc parport_pc lp
parport ext3 jbd edd
fan thermal processor cciss sd_mod scsi_mod
Dec 27 07:45:39 chelco-app-01 kernel: CPU:    4
Dec 27 07:45:39 chelco-app-01 kernel: EIP:    0060:[<f90ab3a7>]    Tainted:
G     X VLI
Dec 27 07:45:39 chelco-app-01 kernel: EFLAGS: 00210202
(2.6.16.60-0.93.1-bigsmp #1)
Dec 27 07:45:39 chelco-app-01 kernel: EIP is at __map_bio+0x50/0x11f
[dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel: eax: f90960c4   ebx: 00000000   ecx:
f7ff2a60   edx: f7794440
Dec 27 07:45:39 chelco-app-01 kernel: esi: f7ff2a58   edi: f90960c4   ebp:
f46306c0   esp: f4c15d28
Dec 27 07:45:39 chelco-app-01 kernel: ds: 007b   es: 007b   ss: 0068
Dec 27 07:45:39 chelco-app-01 kernel: Process lvcreate (pid: 6678,
threadinfo=f4c14000 task=f7838680)
Dec 27 07:45:39 chelco-app-01 kernel: Stack: <0>f7794340 f7794440 f7794440
03201ff0 00000000 03201ff0 00000000 00000008
Dec 27 07:45:39 chelco-app-01 kernel:        00000000 00000000 f90960c4
f7ff2a68 f46306c0 f90abd1b 00000000 00000001
Dec 27 07:45:39 chelco-app-01 kernel:        00000008 f428e2e0 fcdfe010
ffffffff c0113d62 00000000 0000001f f7ff2a58
Dec 27 07:45:39 chelco-app-01 kernel: Call Trace:
Dec 27 07:45:39 chelco-app-01 kernel:  [<f90abd1b>] __split_bio+0x182/0x440
[dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel:  [<c0113d62>]
do_flush_tlb_all+0x0/0x5d
Dec 27 07:45:39 chelco-app-01 kernel:  [<f90abff0>]
__flush_deferred_io+0x17/0x20 [dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel:  [<f90ac14c>] dm_resume+0x8e/0xf9
[dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel:  [<f90aedd8>] dev_suspend+0x138/0x157
[dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel:  [<f90af607>] ctl_ioctl+0x220/0x26e
[dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel:  [<f90aeca0>] dev_suspend+0x0/0x157
[dm_mod]
Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179ce8>] do_ioctl+0x48/0x5e
Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179f60>] vfs_ioctl+0x262/0x275
Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179fc7>] sys_ioctl+0x54/0x6d
Dec 27 07:45:39 chelco-app-01 kernel:  [<c0103dcb>]
sysenter_past_esp+0x54/0x79
Dec 27 07:45:39 chelco-app-01 kernel: Code: b4 0a f9 89 70 40 8b 06 83 c0
0c f0 ff 00 8b 54 24 08 8d 4e 08 8b 02 8b 52 04 89 44 24 0c 89 f8 89 54 24
10 8b 5f 04 8b 54 24 08 <ff> 53 1c 83 f8 00 89 c2 0f 8e 93 00 00 00 8b 54
24 08 8b 42 0c
#############################################################

The result is the target volume gets suspended and the only way to fix it
is to reboot and remove the faulty snapshot when it comes back up.

Now the script I wrote that creates these snapshots will use all available
extents from the Volume Group pool which in this case was actually larger
than the size of the volume I was trying to snapshot. Thinking this was the
problem, I tried creating the snapshot several times using a snapshot size
less than or equal to the target volume and it worked every time. So, I
tried a value larger than the target to generate a crash and it did BUT not
every time. In fact now I can't get it to segfault at all.

So my question is: is creating the snapshot volume with a size larger than
the target volume inducing segfaults randomly or could there be another
problem lurking? If these weren't production machines I would normally just
go with a size smaller than the target but I really need to be sure what
exactly is causing the segfaults.

Any help would be appreciated.

   -Tyelr

-- 

Tyler Gates*
*

*ATS* | Systems Administrator I

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

--f46d043bdf38539d5304d1d69c31
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello everyone,<div>=A0 =A0 =A0I&#39;ve been having an=A0intermittent probl=
em on random servers segfaulting while trying to create a snapshot under ve=
rsion=A0=A0lvm2-2.02.17-7.38.3 on kernel=A02.6.16.60-0.93.1-bigsmp (SLES 10=
 SP4). The messages I get are:</div>
<div>###########################################</div><div><div>Dec 27 07:4=
5:39 chelco-app-01 kernel: Unable to handle kernel NULL pointer dereference=
 at virtual address 0000001c</div><div>Dec 27 07:45:39 chelco-app-01 kernel=
: =A0printing eip:</div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: f90ab3a7</div><div>Dec 27 07:45:=
39 chelco-app-01 kernel: *pde =3D 3780a001</div><div>Dec 27 07:45:39 chelco=
-app-01 kernel: Oops: 0000 [#1]</div><div>Dec 27 07:45:39 chelco-app-01 ker=
nel: SMP=A0</div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: last sysfs file: /devices/pci000=
0:00/0000:00:02.0/0000:04:00.1/irq</div><div>Dec 27 07:45:39 chelco-app-01 =
kernel: Modules linked in: raw dock button battery ac loop dm_snapshot usbh=
id dm_mod uhci_hcd bnx2x hw_random ehci_hcd qla2xxx hpilo usbcore firmware_=
class scsi_transport_fc parport_pc lp parport ext3 jbd edd=A0</div>
<div>fan thermal processor cciss sd_mod scsi_mod</div><div>Dec 27 07:45:39 =
chelco-app-01 kernel: CPU: =A0 =A04</div><div>Dec 27 07:45:39 chelco-app-01=
 kernel: EIP: =A0 =A00060:[&lt;f90ab3a7&gt;] =A0 =A0Tainted: G =A0 =A0 X VL=
I</div><div>
Dec 27 07:45:39 chelco-app-01 kernel: EFLAGS: 00210202 =A0 (2.6.16.60-0.93.=
1-bigsmp #1)=A0</div><div>Dec 27 07:45:39 chelco-app-01 kernel: EIP is at _=
_map_bio+0x50/0x11f [dm_mod]</div><div>Dec 27 07:45:39 chelco-app-01 kernel=
: eax: f90960c4 =A0 ebx: 00000000 =A0 ecx: f7ff2a60 =A0 edx: f7794440</div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: esi: f7ff2a58 =A0 edi: f90960c4 =
=A0 ebp: f46306c0 =A0 esp: f4c15d28</div><div>Dec 27 07:45:39 chelco-app-01=
 kernel: ds: 007b =A0 es: 007b =A0 ss: 0068</div><div>Dec 27 07:45:39 chelc=
o-app-01 kernel: Process lvcreate (pid: 6678, threadinfo=3Df4c14000 task=3D=
f7838680)</div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: Stack: &lt;0&gt;f7794340 f779444=
0 f7794440 03201ff0 00000000 03201ff0 00000000 00000008=A0</div><div>Dec 27=
 07:45:39 chelco-app-01 kernel: =A0 =A0 =A0 =A000000000 00000000 f90960c4 f=
7ff2a68 f46306c0 f90abd1b 00000000 00000001=A0</div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: =A0 =A0 =A0 =A000000008 f428e2e0=
 fcdfe010 ffffffff c0113d62 00000000 0000001f f7ff2a58=A0</div><div>Dec 27 =
07:45:39 chelco-app-01 kernel: Call Trace:</div><div>Dec 27 07:45:39 chelco=
-app-01 kernel: =A0[&lt;f90abd1b&gt;] __split_bio+0x182/0x440 [dm_mod]</div=
>
<div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0113d62&gt;] do_flush_t=
lb_all+0x0/0x5d</div><div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90=
abff0&gt;] __flush_deferred_io+0x17/0x20 [dm_mod]</div><div>Dec 27 07:45:39=
 chelco-app-01 kernel: =A0[&lt;f90ac14c&gt;] dm_resume+0x8e/0xf9 [dm_mod]</=
div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;f90aedd8&gt;] dev_suspen=
d+0x138/0x157 [dm_mod]</div><div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[=
&lt;f90af607&gt;] ctl_ioctl+0x220/0x26e [dm_mod]</div><div>Dec 27 07:45:39 =
chelco-app-01 kernel: =A0[&lt;f90aeca0&gt;] dev_suspend+0x0/0x157 [dm_mod]<=
/div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0179ce8&gt;] do_ioctl+0=
x48/0x5e</div><div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0179f60&g=
t;] vfs_ioctl+0x262/0x275</div><div>Dec 27 07:45:39 chelco-app-01 kernel: =
=A0[&lt;c0179fc7&gt;] sys_ioctl+0x54/0x6d</div>
<div>Dec 27 07:45:39 chelco-app-01 kernel: =A0[&lt;c0103dcb&gt;] sysenter_p=
ast_esp+0x54/0x79</div><div>Dec 27 07:45:39 chelco-app-01 kernel: Code: b4 =
0a f9 89 70 40 8b 06 83 c0 0c f0 ff 00 8b 54 24 08 8d 4e 08 8b 02 8b 52 04 =
89 44 24 0c 89 f8 89 54 24 10 8b 5f 04 8b 54 24 08 &lt;ff&gt; 53 1c 83 f8 0=
0 89 c2 0f 8e 93 00 00 00 8b 54 24 08 8b 42 0c</div>
</div><div>#############################################################</d=
iv><div><br></div><div>The result is the target volume gets suspended and t=
he only way to fix it is to reboot and remove the faulty snapshot when it c=
omes back up.</div>
<div><br></div><div>Now the script I wrote that creates these snapshots wil=
l use all available extents from the Volume Group pool which in this case w=
as actually larger than the size of the volume I was trying to snapshot. Th=
inking this was the problem, I tried creating the snapshot several times us=
ing a snapshot size less than or equal to the target volume and it worked e=
very time. So, I tried a value larger than the target to generate a crash a=
nd it did BUT not every time. In fact now I can&#39;t get it to segfault at=
 all.</div>
<div><br></div><div>So my question is: is creating the snapshot volume with=
 a size larger than the target volume inducing segfaults randomly or could =
there be another problem lurking? If these weren&#39;t production machines =
I would normally just go with a size smaller than the target but I really n=
eed to be sure what exactly is causing the segfaults.</div>
<div><br></div><div>Any help would be appreciated.</div><div><br></div><div=
>=A0 =A0-Tyelr</div><div><br>-- <br><p><span style=3D"font-style:normal">Ty=
ler Gates</span><font color=3D"#008000"><b><br></b></font></p><p><font colo=
r=3D"#008000"><b>ATS</b></font> | Systems
Administrator I
</p><p><a href=3D"mailto:Tyler.Gates@ats.coop" target=3D"_blank">Tyler.Gate=
s@ats.coop</a></p>
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

--f46d043bdf38539d5304d1d69c31--
