Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6UHOXFr013394
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 13:24:33 -0400
Received: from smtp.smytheonline.com (ext4.smytheonline.com [38.96.154.84])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6UHOTbP023442
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 13:24:30 -0400
Received: from [192.168.1.20] (norbert.smytheonline.com [192.168.1.20])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.smytheonline.com (Postfix) with ESMTP id 3FD0C3CC674
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 13:24:14 -0400 (EDT)
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <2C96D4B0-33EC-4250-89C5-1B516C83A04D@smytheonline.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-4--796947059
From: Norbert Phillipps <nphillipps@smytheonline.com>
Date: Mon, 30 Jul 2007 13:22:46 -0400
Subject: [linux-lvm] Xen, LVM, Snapshots Random Kernel Panics
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


--Apple-Mail-4--796947059
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Hi all,

I'm currently running lvm 2.02.25, and device-mapper 1.02.19 on  
kernel 2.6.20.13 with Xen 3.1 on Gentoo Linux

I randomly have kernel panics when creating snapshots and also when  
removing snapshots.

Attached is one of the kernel panics that I have seen while creating  
a snapshot.  I'm trying to find a stable combination of kernel, lvm,  
and Xen version.

Thanks!

------------[ cut here ]------------
kernel BUG at mm/mempool.c:121!
invalid opcode: 0000 [#1]
SMP
Modules linked in: ipv6 nfs lockd nfs_acl sunrpc bridge llc  
dm_snapshot dm_mod aoe qla2xxx i2c_i801 i2c_core firmware_class e1000  
uhci_hcd evdev
CPU:    0
EIP:    0061:[<c013d66b>]    Not tainted VLI
EFLAGS: 00010282   (2.6.20.14-xen #5)
EIP is at mempool_resize+0x137/0x16c
eax: ec5a6900   ebx: ffffffe0   ecx: 000000d0   edx: ffffffe0
esi: e9395b00   edi: f07f5080   ebp: ec5a6900   esp: e8317d5c
ds: 007b   es: 007b   ss: 0069
Process vgchange (pid: 8179, ti=e8316000 task=e873da70 task.ti=e8316000)
Stack: 00692000 000000d0 ffffffe0 80000000 ffffffe0 e9395b00 f07f5080  
00000000
        ee24a3c8 00000000 e8d289c0 ee24a5cd e873da70 c012d034  
e8317d94 e8317d94
        c0156c7e e93962c0 e9395b00 f07f5080 ee06ebf1 f07f5080  
e93964c0 00000000
Call Trace:
  [<ee24a3c8>] resize_pool+0x47/0xb2 [dm_mod]
  [<ee24a5cd>] kcopyd_client_destroy+0x84/0xc9 [dm_mod]
  [<c012d034>] autoremove_wake_function+0x0/0x37
  [<c0156c7e>] kfree+0xe/0x7d
  [<ee06ebf1>] snapshot_dtr+0x85/0xcf [dm_snapshot]
  [<ee246d73>] dm_table_put+0x55/0xbd [dm_mod]
  [<ee245b0e>] dm_put+0x6f/0x110 [dm_mod]
  [<ee249561>] dev_remove+0x76/0xa4 [dm_mod]
  [<ee249b48>] ctl_ioctl+0x1eb/0x255 [dm_mod]
  [<c0107457>] monotonic_clock+0x37/0x74
  [<ee2494eb>] dev_remove+0x0/0xa4 [dm_mod]
  [<c0164874>] do_ioctl+0x64/0x6d
  [<c01648cd>] vfs_ioctl+0x50/0x278
  [<c0164b29>] sys_ioctl+0x34/0x53
  [<c0104c34>] syscall_call+0x7/0xb
  [<c0320033>] unix_dgram_sendmsg+0x2f9/0x48a
  =======================
Code: 8b 45 08 3b 45 04 0f 8d 4c ff ff ff 8b 14 24 89 e8 e8 c4 93 1e  
00 8b 55 10 8b 44 24 04 ff 55 14 89 c3 85 c0 75 bf e9 37 ff ff ff  
<0f> 0b eb fe 8b 14 24 89 e8 e8 a1 93 1e 00 8b 55 10 89 d8 ff 55
EIP: [<c013d66b>] mempool_resize+0x137/0x16c SS:ESP 0069:e8317d5c
--Apple-Mail-4--796947059
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Hi all,<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I'm currently running lvm =
2.02.25, and device-mapper 1.02.19 on kernel 2.6.20.13 with Xen 3.1 on =
Gentoo Linux</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>I =
randomly have kernel panics when creating snapshots and also when =
removing snapshots.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Attached is one of the =
kernel panics that I have seen while creating a snapshot.=A0 I'm trying =
to find a stable combination of kernel, lvm, and Xen =
version.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Thanks!</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">------------[ cut here ]------------</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">kernel BUG at =
mm/mempool.c:121!</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">invalid opcode: 0000 [#1]</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><SPAN class=3D"Apple-style-span" style=3D"line-height:=
 14px;"><FONT class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida =
Grande" size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px; line-height: normal;">SMP</SPAN></FONT><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
line-height: normal;">=A0</SPAN></FONT></SPAN></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">Modules linked in: ipv6 nfs lockd nfs_acl =
sunrpc bridge llc dm_snapshot dm_mod aoe qla2xxx i2c_i801 i2c_core =
firmware_class e1000 uhci_hcd evdev</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">CPU: =A0 =A00</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">EIP: =A0 =A00061:[&lt;c013d66b&gt;] =A0 =A0Not =
tainted VLI</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">EFLAGS: 00010282 =A0 (2.6.20.14-xen #5)</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">EIP is at =
mempool_resize+0x137/0x16c</SPAN></FONT></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">eax: ec5a6900 =A0 ebx: ffffffe0 =A0 ecx: 000000d0 =A0 edx: =
ffffffe0</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">esi: e9395b00 =A0 edi: f07f5080 =A0 ebp: ec5a6900 =A0 esp: =
e8317d5c</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">ds: 007b =A0 es: 007b =A0 ss: 0069</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">Process vgchange (pid: 8179, ti=3De8316000 =
task=3De873da70 task.ti=3De8316000)</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><SPAN class=3D"Apple-style-span" style=3D"line-height:=
 14px;"><FONT class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida =
Grande" size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px; line-height: normal;">Stack: 00692000 000000d0 ffffffe0 80000000 =
ffffffe0 e9395b00 f07f5080 00000000</SPAN></FONT><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
line-height: normal;">=A0</SPAN></FONT></SPAN></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><SPAN class=3D"Apple-style-span" style=3D"line-height:=
 14px;"><FONT class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida =
Grande" size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px; line-height: normal;">=A0 =A0 =A0 =A0ee24a3c8 00000000 e8d289c0 =
ee24a5cd e873da70 c012d034 e8317d94 e8317d94</SPAN></FONT><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
line-height: normal;">=A0</SPAN></FONT></SPAN></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><SPAN class=3D"Apple-style-span" style=3D"line-height:=
 14px;"><FONT class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida =
Grande" size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px; line-height: normal;">=A0 =A0 =A0 =A0c0156c7e e93962c0 e9395b00 =
f07f5080 ee06ebf1 f07f5080 e93964c0 00000000</SPAN></FONT><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
line-height: normal;">=A0</SPAN></FONT></SPAN></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">Call Trace:</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">=A0[&lt;ee24a3c8&gt;] resize_pool+0x47/0xb2 =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee24a5cd&gt;] kcopyd_client_destroy+0x84/0xc9 =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;c012d034&gt;] =
autoremove_wake_function+0x0/0x37</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">=A0[&lt;c0156c7e&gt;] =
kfree+0xe/0x7d</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee06ebf1&gt;] snapshot_dtr+0x85/0xcf =
[dm_snapshot]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee246d73&gt;] dm_table_put+0x55/0xbd =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee245b0e&gt;] dm_put+0x6f/0x110 =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee249561&gt;] dev_remove+0x76/0xa4 =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee249b48&gt;] ctl_ioctl+0x1eb/0x255 =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;c0107457&gt;] =
monotonic_clock+0x37/0x74</SPAN></FONT></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;ee2494eb&gt;] dev_remove+0x0/0xa4 =
[dm_mod]</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;c0164874&gt;] do_ioctl+0x64/0x6d</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">=A0[&lt;c01648cd&gt;] =
vfs_ioctl+0x50/0x278</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;c0164b29&gt;] sys_ioctl+0x34/0x53</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;">=A0[&lt;c0104c34&gt;] =
syscall_call+0x7/0xb</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">=A0[&lt;c0320033&gt;] =
unix_dgram_sendmsg+0x2f9/0x48a</SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: =
10px;">=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; "><SPAN class=3D"Apple-style-span" =
style=3D"line-height: 14px;"><FONT class=3D"Apple-style-span" =
color=3D"#333333" face=3D"Lucida Grande" size=3D"2"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 10px; line-height: =
normal;">Code: 8b 45 08 3b 45 04 0f 8d 4c ff ff ff 8b 14 24 89 e8 e8 c4 =
93 1e 00 8b 55 10 8b 44 24 04 ff 55 14 89 c3 85 c0 75 bf e9 37 ff ff ff =
&lt;0f&gt; 0b eb fe 8b 14 24 89 e8 e8 a1 93 1e 00 8b 55 10 89 d8 ff =
55</SPAN></FONT><FONT class=3D"Apple-style-span" color=3D"#333333" =
face=3D"Lucida Grande" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; line-height: =
normal;">=A0</SPAN></FONT></SPAN></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" color=3D"#333333" face=3D"Lucida Grande" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;">EIP: [&lt;c013d66b&gt;] mempool_resize+0x137/0x16c SS:ESP =
0069:e8317d5c</SPAN></FONT></DIV></BODY></HTML>=

--Apple-Mail-4--796947059--
