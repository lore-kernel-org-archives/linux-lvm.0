From: Patrick Caulfield <caulfield@sistina.com>
Message-ID: <20030419141513.GB1217@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
Subject: [linux-lvm] [Bug#189650: Trace of crash from Syslog]
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Apr 20 17:43:03 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline


-- 

patrick


--Bn2rw/3z4jIqBvZU
Content-Type: message/rfc822
Content-Disposition: inline

X-Mail-Format-Warning: Bad RFC2822 header formatting in >From patrick  Sat Apr 19 15:10:08 2003
Return-path: <debbugs@master.debian.org>
Envelope-to: patrick@localhost
Delivery-date: Sat, 19 Apr 2003 15:10:08 +0100
Received: from localhost.pjc.net ([127.0.0.1] helo=localhost)
	by arthur.pjc.net with esmtp (Exim 3.36 #1 (Debian))
	id 196t2e-0001cQ-01
	for <patrick@localhost>; Sat, 19 Apr 2003 15:10:08 +0100
Received: from mail.cix.co.uk
	by localhost with POP3 (fetchmail-5.9.11)
	for patrick@localhost (single-drop); Sat, 19 Apr 2003 15:10:08 +0100 (BST)
Received: from master.debian.org (master.debian.org [65.125.64.135])
	by sulphur.cix.co.uk (8.11.3/CIX/8.11.3) with ESMTP id h3JE50J13604
	for <patrick@tykepenguin.cix.co.uk>; Sat, 19 Apr 2003 15:05:00 +0100 (BST)
X-Envelope-From: debbugs@master.debian.org
Received: from debbugs by master.debian.org with local (Exim 3.12 1 (Debian))
	id 196shJ-0004UI-00; Sat, 19 Apr 2003 08:48:05 -0500
X-Loop: owner@bugs.debian.org
Subject: Bug#189650: Trace of crash from Syslog
Reply-To: Alan Chandler <alan@chandlerfamily.org.uk>, 189650@bugs.debian.org
Resent-From: Alan Chandler <alan@chandlerfamily.org.uk>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: Patrick Caulfield <patrick@debian.org>,
   lvm10@packages.qa.debian.org
Resent-Date: Sat, 19 Apr 2003 13:48:04 GMT
Resent-Message-ID: <handler.189650.B189650.105076003417072@bugs.debian.org>
X-Debian-PR-Message: report 189650
X-Debian-PR-Package: lvm10
X-Debian-PR-Keywords: 
Received: via spool by 189650-submit@bugs.debian.org id=B189650.105076003417072
          (code B ref 189650); Sat, 19 Apr 2003 13:48:04 GMT
Received: (at 189650) by bugs.debian.org; 19 Apr 2003 13:47:14 +0000
Received: from pcow035o.blueyonder.co.uk (blueyonder.co.uk) [195.188.53.121] 
	by master.debian.org with esmtp (Exim 3.12 1 (Debian))
	id 196sgU-0004R4-00; Sat, 19 Apr 2003 08:47:14 -0500
Received: from home.chandlerfamily.org.uk ([82.43.75.142]) by blueyonder.co.uk  with Microsoft SMTPSVC(5.5.1877.757.75);
	 Sat, 19 Apr 2003 14:47:12 +0100
Received: from kanger.home ([10.0.10.1] ident=alan)
	by home.chandlerfamily.org.uk with esmtp (Exim 3.36 #1 (Debian))
	id 196sgS-0000N0-00
	for <189650@bugs.debian.org>; Sat, 19 Apr 2003 14:47:12 +0100
From: Alan Chandler <alan@chandlerfamily.org.uk>
To: 189650@bugs.debian.org
Date: Sat, 19 Apr 2003 14:47:08 +0100
User-Agent: KMail/1.5.1
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200304191447.12106.alan@chandlerfamily.org.uk>
Delivered-To: 189650@bugs.debian.org
Resent-Sender: Debian BTS <debbugs@master.debian.org>
X-Envelope-To: patrick@tykepenguin.cix.co.uk
X-Spam-Status: No, hits=-18.7 required=5.0
	tests=DEBIAN_BTS_BUG,PGP_SIGNATURE,RESENT_TO,USER_AGENT_KMAIL,
	      X_LOOP
	autolearn=ham version=2.53
X-Spam-Level: 
X-Spam-Checker-Version: SpamAssassin 2.53 (1.174.2.15-2003-03-30-exp)

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I found the trace of one of the crashes in syslog - here it is below

Apr 19 11:20:57 roo kernel: Unable to handle kernel NULL pointer dereferenc=
e=20
at virtual address 00000021
Apr 19 11:20:57 roo kernel:  printing eip:
Apr 19 11:20:57 roo kernel: c0159dc7
Apr 19 11:20:57 roo kernel: *pde =3D 00000000
Apr 19 11:20:57 roo kernel: Oops: 0000
Apr 19 11:20:57 roo kernel: CPU:    0
Apr 19 11:20:57 roo kernel: EIP:    0010:[devfs_generate_path+143/156]    N=
ot=20
tainted
Apr 19 11:20:57 roo kernel: EFLAGS: 00010246
Apr 19 11:20:57 roo kernel: eax: 00000000   ebx: 00000001   ecx: 00000000  =
=20
edx: 00000040
Apr 19 11:20:57 roo kernel: esi: b5f5d25d   edi: cbbaff47   ebp: 0000003f  =
=20
esp: cbbafeb0
Apr 19 11:20:57 roo kernel: ds: 0018   es: 0018   ss: 0018
Apr 19 11:20:57 roo kernel: Process lvcreate (pid: 3562, stackpage=3Dcbbaf0=
00)
Apr 19 11:20:57 roo kernel: Stack: 00000008 cbbaff08 00000000 cc9679be=20
c01512b4 c1755b60 cbbaff08 00000040
Apr 19 11:20:57 roo kernel:        cc968c60 000000b5 00000008 00000000=20
c017aa22 cc968c60 00000008 cbbaff08
Apr 19 11:20:57 roo kernel:        cc969b80 00000c00 00000c00 c4adc000=20
00001000 00000220 c0124e82 c96c7d98
Apr 19 11:20:57 roo kernel: Call Trace:   =20
[af_packet:__insmod_af_packet_O/lib/modules/2.4.19-686/kernel/net/pack+
=2D -648770/96] [disk_name+84/524]=20
[af_packet:__insmod_af_packet_O/lib/modules/2.4.19-686/kernel/net/pack+-644=
000/96]
[get_partition_list+106/248]=20
[af_packet:__insmod_af_packet_O/lib/modules/2.4.19-686/kernel/net/pack+-644=
000/96]
Apr 19 11:20:57 roo kernel:  =20
[af_packet:__insmod_af_packet_O/lib/modules/2.4.19-686/kernel/net/pack+-640=
128/96]=20
[
__vma_link+98/176] [do_mmap_pgoff+1050/1228] [partitions_read_proc+26/52]=20
[proc_file_read+242/404] [sys_read+150/2
40]
Apr 19 11:20:57 roo kernel:   [system_call+51/56]
Apr 19 11:20:57 roo kernel:
Apr 19 11:20:57 roo kernel: Code: 83 7b 20 00 75 b3 89 e8 5b 5e 5f 5d c3 53=
 8b=20
5c 24 08 85 db

=2D --=20
Alan Chandler
alan@chandlerfamily.org.uk
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+oVNfuFHxcV2FFoIRAicKAKCzhhnN1i7mUKmz8OIoOFRDyiZIjQCdF/ba
WpuClhs0FT3Vt543HqxVnpM=3D
=3DZKLM
=2D----END PGP SIGNATURE-----



--Bn2rw/3z4jIqBvZU--
