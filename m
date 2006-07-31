Received: from o.ww.redhat.com (vpn-4-43.stuttgart.redhat.com [10.32.4.43])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VEFVWA026647
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 10:15:32 -0400
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.7/8.13.7) with ESMTP id k6VEFUdf004061
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 16:15:30 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.7/8.13.7/Submit) id k6VEFT2U004060
	for linux-lvm@redhat.com; Mon, 31 Jul 2006 16:15:29 +0200
Date: Mon, 31 Jul 2006 16:15:29 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Strange pvmove problem
Message-ID: <20060731141529.GC2967@redhat.com>
References: <44C9E4BD.9070204@forouher.de> <44CA0D67.5000008@conterra.de>
	<44CA1479.8080909@forouher.de> <44CA269C.6040802@conterra.de>
	<44CA397A.8020209@forouher.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <44CA397A.8020209@forouher.de>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>


You've got a kernel/userspace version mismatch on device-mapper
and lvm2.

Check your config an upgrade.

Heinz

On Fri, Jul 28, 2006 at 06:21:14PM +0200, Dariush Forouher wrote:
> Dieter St=EF=BF=BDken wrote:
>=20
> > any  messages from syslog / dmesg?
>=20
> Jupp, these:
>=20
> device-mapper: unrecognised sync argument to mirror log: 2
> device-mapper: dm-mirror: Error creating mirror dirty log
> device-mapper: error adding target to table
> device-mapper: unrecognised sync argument to mirror log: 2
> device-mapper: dm-mirror: Error creating mirror dirty log
> device-mapper: error adding target to table
> device-mapper: device 253:1 too small for target
> device-mapper: error adding target to table
>=20
> > does it work while LV not active (i.E. boot from rescue CD)?
>=20
> Nope. :(
>=20
> ciao
> Dariush
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
