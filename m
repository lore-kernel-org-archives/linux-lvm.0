Return-Path: <heinrichs@qis-systemhaus.de>
Message-Id: <3A7E57E8.4DBED014@qis-systemhaus.de>
Date: Mon, 05 Feb 2001 08:36:08 +0100
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Shutdown Probs
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
To: linux-lvm@sistina.com

Hi there,

I'm using lvm-0.9.1-beta3 on RH7.0 with kernel 2.4.0 and devfs.
Everything works fine so far, but I get strange messages on shutdown.

I placed "/sbin/vgchange -a n" in /etc/init.d/halt right after
unmounting filesystems. But I get a message like "Cannot deactivate
volume group with open logical volumes". I then added some
"/sbin/lvchange -a n [LogicalVolumePath]" for each lv before the the
vgchange call. Then I get some "operation not permitted on (open)
logical volume" messages.

Does anybody have a working solution?

Thanx...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
QIS Systemhaus GmbH	| Fax:	+49 (0)241 413 2640
J=EF=BF=BDlicher Str. 338b	| Mail:	heinrichs@qis-systemhaus.de
D-52070 Aachen		| Web:	http://www.qis-systemhaus.de
