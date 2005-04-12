Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3C8Y7O13916
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 04:34:07 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3C8Y5xU026123
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 04:34:06 -0400
Received: from 73.red-83-45-99.pooles.rima-tde.net ([83.45.99.73]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DLGqK-0002Bc-00
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 10:33:56 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DLGqA-0006P4-00
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 10:33:46 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] invalid physical volume
Date: Tue, 12 Apr 2005 10:33:44 +0200
Message-Id: <20050412082844.M43465@pk25.com>
In-Reply-To: <425B37D8.7060801@cjs226.com>
References: <425B37D8.7060801@cjs226.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: LVM general discussion and development <linux-lvm@redhat.com>


Clif try to make a partition type linux lvm.. (8e) and after try pvcreate o=
ver it

send a output of pvcreate -v /dev/emcpowera

if you complile with debug use pvcreate -dv /dev/emcpowera

send the error leve returns echo $?

regards!



On Mon, 11 Apr 2005 21:52:08 -0500, Clif Smith wrote
> I'm running lvm-1.0.8-9 on RHES3 and am receiving the following when=20
> I try to utilize a volume from an EMC array:
> # pvcreate /dev/emcpowera
> pvcreate -- invalid physical volume "/dev/emcpowera"
>=20
> The OS sees the volume fine:
> # fdisk -l /dev/emcpowera
> Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
> 255 heads, 63 sectors/track, 1305 cylinders
> Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>=20
> I can create a partition and then a filesystem without issue, but I=20
> really need to use it within LVM.
>=20
> Any ideas?
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
La teta que la mano no cubre, no es teta sino ubre.
		-- An=EF=BF=BDnim.=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
