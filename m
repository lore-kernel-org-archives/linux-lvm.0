Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Bug Report LVM 1.0.1 RC4
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FFCF@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
Date: Wed Oct 31 01:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have the same with 2.4.12 and lvm1rc4.
Went back to 2.4.9 and all works well.
-jec

> -----Original Message-----
> From: Hadmut Danisch [mailto:hadmut@danisch.de]
> Sent: mardi, 30. octobre 2001 20:44
> To: linux-LVM@sistina.com
> Subject: [linux-lvm] Bug Report LVM 1.0.1 RC4
>=20
>=20
> Hi,
>=20
> I'd like to report a bug in LVM 1.0.1 RC4:
>=20
> I was using a 2.4.12 Linux Kernel with LVM 1.0.1 RC4
> patched in.
>=20
> I was removing logical volumes and a volume group
> formerly installed with LVM 0.9.
>=20
> when removing the volumen group, a segmentation fault
> (null pointer access) occured in the kernel. Same
> problem occured on two independent computers.
>=20
> regards
> Hadmut Danisch
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
