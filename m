MIME-Version: 1.0
Message-id: <200309261446.hIxs@karlsruher.de>
From: THORSTEN TOVACOVSKY <THORSTEN.D.TOVACOVSKY@KARLSRUHER.DE>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] KLV: LVM-Probleme mit 31Bit-Linux auf s390x
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
Date: Mon Sep 29 08:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LINUX-LVM@SISTINA.COM

--- Erhalten von  A12.TOVACO 0721/353-4569                   26.09.03 15.=
46

=20 -> LINUX-LVM(A)SISTINA.COM

Hallo Herr Mauelshagen,

wir nutzen Suse SLS8 31Bit auf einer z900 (2C1) unter z/VM (64Bit).

Wir versuchen den LVM mit Raid0 - Devices arbeiten zu lassen.

Des =F6fteren kommt bei diversen Commands der LVM scheinbar durcheinander=
=20und
zeigt pl=F6tzlich das 1.Devices unterm Raid0-Device an.

Beispiel:
VG mit 6 PVs
per pvmove eines dieser PVs freigeschaufelt,
dann per vgreduce dieses aus der VG versucht zu entfernen.

ein pvscan bringt dann pl=F6tzlich sowohl das md-dev als auch die 1.devic=
e im md
als inaktiv.

Da ist also sowieso schon was schiefgegangen. Leider sind diese beiden da=
nn per
pvchange -xn /dev/xxx nicht als PVs entfernbar. Siehe Meldung:

=20> pvchange -- unable to find volume group of "/dev/dasdk1" (VG not act=
ive?) <

Scheints mu=DF die VG doch noch aktiv sein, doch dann bekomm ich die PVs =
ja auch
nicht raus, dann dann folgende Meldung kommt:

=20> pvchange -- physical volume "/dev/md0" is unallocatable <


Und nun ?
Haben Sie=B4nen Tipp f=FCr uns ?
K=F6nnen Wir sie bei einer eventuellen Fehlersuche unterst=FCtzen ?

Gr=FC=DFe
Thorsten
(Karlsruher Lebensversicherung AG)
###########################################################

This e-mail message has been scanned for Viruses=20
by a Content Security Software.=20

KARLSRUHER Lebensversicherung AG, 2003

###########################################################
