Return-Path: <heinrichs@qis-systemhaus.de>
Message-Id: <3B372D6D.88998D3F@qis-systemhaus.de>
Date: Mon, 25 Jun 2001 14:24:13 +0200
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Why vgscan not in kernel?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux LVM <linux-lvm@sistina.com>

Hi all,

upon boot, SCSI and IDE drivers check harddrives attached to the device
for partitions. Wouldn't it be better to have similar functionality
(scanning for VG's) for LVM in the kernel, instead of using a userland
command?

Bye...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
Configuration Manager	| Fax:	+49 (0)241 413 2640
QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
J=EF=BF=BDlicher Str. 338b	| Web:	http://www.qis-systemhaus.de
D-52070 Aachen		| ICQ#:	110037733
