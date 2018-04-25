Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5636763125
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2018 05:00:34 +0000 (UTC)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AE11552C7
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2018 05:00:22 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id e12-v6so2390228iob.8
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2018 22:00:22 -0700 (PDT)
MIME-Version: 1.0
From: Gang He <dchg2000@gmail.com>
Date: Wed, 25 Apr 2018 13:00:21 +0800
Message-ID: <CAGmFzSc8a8TZq7LtTuwwA+zrKmgQ722KubjHBeu4M2WW2KAZew@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e95f36056aa525b1"
Subject: [linux-lvm] Pvmove can work on cluster with LVM 2.02.120(2)
	(2015-05-15), or not?
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

--000000000000e95f36056aa525b1
Content-Type: text/plain; charset="UTF-8"

Hello List,

This is another pvmove problem, the LVM version is 2.02.120(2) (2015-05-15).
This bug can be reproduced (not each time, but very easy),
the problem is, online pvmove brings the upper file system hang.
the environment is a three-node cluster (CLVM+OCFS2).
1) create two PV, create one VG, create one LV.
sles12sp3r1-nd1:/ # pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda1  cluster-vg2 lvm2 a--  120.00g 60.00g
  /dev/sda2              lvm2 ---   30.00g 30.00g
  /dev/sdb1  cluster-vg2 lvm2 a--  120.00g 60.00g
  /dev/sdb2              lvm2 ---   30.00g 30.00g
sles12sp3r1-nd1:/ # vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  cluster-vg2   2   2   0 wz--nc 239.99g 119.99g
sles12sp3r1-nd1:/ # lvs
  LV       VG          Attr       LSize  Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  test-lv  cluster-vg2 -wI-ao---- 20.00g

2) mkfs.ocfs2 test-lv LV, and mount this LV on each node.
mkfs.ocfs2 -N 4 /dev/cluster-vg2/test-lv (on one node)
mount /dev/cluster-vg2/test-lv  /mnt/shared (on each node)

3) write/truncate some files in /mnt/shared from each node continually.

4) run pvmove command on node1 while step 3) is in progress on each node.
sles12sp3r1-nd1:/ # pvmove -i 5 /dev/sda1 /dev/sdb1
Pvmove process will enter this stack,
sles12sp3r1-nd1:/ # cat /proc/12748/stack
[<ffffffff810f429f>] hrtimer_nanosleep+0xaf/0x170
[<ffffffff810f43b6>] SyS_nanosleep+0x56/0x70
[<ffffffff8160916e>] entry_SYSCALL_64_fastpath+0x12/0x6d
[<ffffffffffffffff>] 0xffffffffffffffff

5)Then, I can encounter ocfs2 file system write/truncate process hang
problem on each node,
The root cause is blocked at getting journal lock.
but the journal lock is being used by ocfs2_commit thread, this thread is
blocked at flushing journal to the disk (LVM disk).
sles12sp3r1-nd3:/ # cat /proc/2310/stack
[<ffffffffa021ab4a>] jbd2_log_wait_commit+0x8a/0xf0 [jbd2]
[<ffffffffa021e5c7>] jbd2_journal_flush+0x47/0x180 [jbd2]
[<ffffffffa04d2621>] ocfs2_commit_thread+0xa1/0x350 [ocfs2]
[<ffffffff8109b627>] kthread+0xc7/0xe0
[<ffffffff8160617f>] ret_from_fork+0x3f/0x70
[<ffffffff8109b560>] kthread+0x0/0xe0
[<ffffffffffffffff>] 0xffffffffffffffff

So, I want to confirm if online pvmove is supported by LVM 2.02.120(2)
(2015-05-15)?
If yes, how to debug this bug? it looks ocfs2 journal thread can not flush
data to the underlying LVM disk.

Thanks
Gang

--000000000000e95f36056aa525b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default"><div class=3D"gmail_default">=
<font face=3D"verdana, sans-serif">Hello List,</font></div><div class=3D"gm=
ail_default"><font face=3D"verdana, sans-serif"><br></font></div><div class=
=3D"gmail_default"><font face=3D"verdana, sans-serif">This is another pvmov=
e problem, the LVM version is 2.02.120(2) (2015-05-15).</font></div><div cl=
ass=3D"gmail_default"><font face=3D"verdana, sans-serif">This bug can be re=
produced (not each time, but very easy),=C2=A0</font></div><div class=3D"gm=
ail_default"><font face=3D"verdana, sans-serif">the problem is, online pvmo=
ve brings the upper file system hang.</font></div><div class=3D"gmail_defau=
lt"><font face=3D"verdana, sans-serif">the environment is a three-node clus=
ter (CLVM+OCFS2).</font></div><div class=3D"gmail_default"><font face=3D"ve=
rdana, sans-serif">1) create two PV, create one VG, create one LV.</font></=
div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">sles12s=
p3r1-nd1:/ # pvs</font></div><div class=3D"gmail_default"><font face=3D"ver=
dana, sans-serif">=C2=A0 PV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Fmt=C2=A0 Attr PSize=C2=A0 =C2=A0PFree</font></div=
><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">=C2=A0 /de=
v/sda1=C2=A0 cluster-vg2 lvm2 a--=C2=A0 120.00g 60.00g</font></div><div cla=
ss=3D"gmail_default"><font face=3D"verdana, sans-serif">=C2=A0 /dev/sda2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvm2 ---=C2=A0 =C2=A030.00g 3=
0.00g</font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-=
serif">=C2=A0 /dev/sdb1=C2=A0 cluster-vg2 lvm2 a--=C2=A0 120.00g 60.00g</fo=
nt></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">=
=C2=A0 /dev/sdb2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvm2 ---=
=C2=A0 =C2=A030.00g 30.00g</font></div><div class=3D"gmail_default"><font f=
ace=3D"verdana, sans-serif">sles12sp3r1-nd1:/ # vgs</font></div><div class=
=3D"gmail_default"><font face=3D"verdana, sans-serif">=C2=A0 VG=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 #PV #LV #SN Attr=C2=A0 =C2=A0VSize=C2=A0 =C2=A0VFr=
ee</font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-ser=
if">=C2=A0 cluster-vg2=C2=A0 =C2=A02=C2=A0 =C2=A02=C2=A0 =C2=A00 wz--nc 239=
.99g 119.99g</font></div><div class=3D"gmail_default"><font face=3D"verdana=
, sans-serif">sles12sp3r1-nd1:/ # lvs</font></div><div class=3D"gmail_defau=
lt"><font face=3D"verdana, sans-serif">=C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0=
VG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSize=
=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert</font>=
</div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">=C2=
=A0 test-lv=C2=A0 cluster-vg2 -wI-ao---- 20.00g</font></div><div class=3D"g=
mail_default"><font face=3D"verdana, sans-serif"><br></font></div><div clas=
s=3D"gmail_default"><font face=3D"verdana, sans-serif">2) mkfs.ocfs2 test-l=
v LV, and mount this LV on each node.</font></div><div class=3D"gmail_defau=
lt"><font face=3D"verdana, sans-serif">mkfs.ocfs2 -N 4 /dev/cluster-vg2/tes=
t-lv (on one node)</font></div><div class=3D"gmail_default"><font face=3D"v=
erdana, sans-serif">mount /dev/cluster-vg2/test-lv=C2=A0 /mnt/shared (on ea=
ch node)</font></div><div class=3D"gmail_default"><font face=3D"verdana, sa=
ns-serif"><br></font></div><div class=3D"gmail_default"><font face=3D"verda=
na, sans-serif">3) write/truncate some files in /mnt/shared from each node =
continually.</font></div><div class=3D"gmail_default"><font face=3D"verdana=
, sans-serif"><br></font></div><div class=3D"gmail_default"><font face=3D"v=
erdana, sans-serif">4) run pvmove command on node1 while step 3) is in prog=
ress on each node.</font></div><div class=3D"gmail_default"><font face=3D"v=
erdana, sans-serif">sles12sp3r1-nd1:/ # pvmove -i 5 /dev/sda1 /dev/sdb1</fo=
nt></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">Pv=
move process will enter this stack,</font></div><div class=3D"gmail_default=
"><font face=3D"verdana, sans-serif">sles12sp3r1-nd1:/ # cat /proc/12748/st=
ack</font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-se=
rif">[&lt;ffffffff810f429f&gt;] hrtimer_nanosleep+0xaf/0x170</font></div><d=
iv class=3D"gmail_default"><font face=3D"verdana, sans-serif">[&lt;ffffffff=
810f43b6&gt;] SyS_nanosleep+0x56/0x70</font></div><div class=3D"gmail_defau=
lt"><font face=3D"verdana, sans-serif">[&lt;ffffffff8160916e&gt;] entry_SYS=
CALL_64_fastpath+0x12/0x6d</font></div><div class=3D"gmail_default"><font f=
ace=3D"verdana, sans-serif">[&lt;ffffffffffffffff&gt;] 0xffffffffffffffff</=
font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">=
<br></font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-s=
erif">5)Then, I can encounter ocfs2 file system write/truncate process hang=
 problem on each node,</font></div><div class=3D"gmail_default"><font face=
=3D"verdana, sans-serif">The root cause is blocked at getting journal lock.=
</font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif=
">but the journal lock is being used by ocfs2_commit thread, this thread is=
 blocked at flushing journal to the disk (LVM disk).</font></div><div class=
=3D"gmail_default"><font face=3D"verdana, sans-serif">sles12sp3r1-nd3:/ # c=
at /proc/2310/stack</font></div><div class=3D"gmail_default"><font face=3D"=
verdana, sans-serif">[&lt;ffffffffa021ab4a&gt;] jbd2_log_wait_commit+0x8a/0=
xf0 [jbd2]</font></div><div class=3D"gmail_default"><font face=3D"verdana, =
sans-serif">[&lt;ffffffffa021e5c7&gt;] jbd2_journal_flush+0x47/0x180 [jbd2]=
</font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif=
">[&lt;ffffffffa04d2621&gt;] ocfs2_commit_thread+0xa1/0x350 [ocfs2]</font><=
/div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">[&lt;f=
fffffff8109b627&gt;] kthread+0xc7/0xe0</font></div><div class=3D"gmail_defa=
ult"><font face=3D"verdana, sans-serif">[&lt;ffffffff8160617f&gt;] ret_from=
_fork+0x3f/0x70</font></div><div class=3D"gmail_default"><font face=3D"verd=
ana, sans-serif">[&lt;ffffffff8109b560&gt;] kthread+0x0/0xe0</font></div><d=
iv class=3D"gmail_default"><font face=3D"verdana, sans-serif">[&lt;ffffffff=
ffffffff&gt;] 0xffffffffffffffff</font></div><div class=3D"gmail_default"><=
font face=3D"verdana, sans-serif"><br></font></div><div class=3D"gmail_defa=
ult"><font face=3D"verdana, sans-serif">So, I want to confirm if online pvm=
ove is supported by LVM 2.02.120(2) (2015-05-15)?</font></div><div class=3D=
"gmail_default"><font face=3D"verdana, sans-serif">If yes, how to debug thi=
s bug? it looks ocfs2 journal thread can not flush data to the underlying L=
VM disk.=C2=A0</font></div><div class=3D"gmail_default"><font face=3D"verda=
na, sans-serif"><br></font></div><div class=3D"gmail_default"><font face=3D=
"verdana, sans-serif">Thanks</font></div><div class=3D"gmail_default"><font=
 face=3D"verdana, sans-serif">Gang</font></div><div style=3D"font-family:ve=
rdana,sans-serif;font-size:large"><br></div></div></div>

--000000000000e95f36056aa525b1--
