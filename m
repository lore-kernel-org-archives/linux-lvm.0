Message-ID: <60644C5CF4F2D511A0120001025F99BC01117C56@IMF00SA1>
From: "Sauer, Adrian" <Adrian.Sauer@db-ig.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvscan problem
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
Date: Tue Oct 14 06:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hallo,
ich habe da folgendes Problem:

------------------------------------------------------------------------=
----
--------------------------------------------------------
[root@imf00yc1 VGs]# lvscan
lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please =
run
vgscan

[root@imf00yc1 VGs]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "VG_yc1_sdc"
vgscan -- found active volume group "VG_yc1_sdd"
vgscan -- found active volume group "VG_yc1_sde"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your =
volume
groups

[root@imf00yc1 VGs]# lvscan
lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please =
run
vgscan
------------------------------------------------------------------------=
----
--------------------------------------------------------

woran liegt das und wie kriege ich das in den Griff ?


Danke schon mal f=FCr die Antwort


MfG

  Adrian
