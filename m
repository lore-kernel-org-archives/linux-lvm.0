From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] restore of parts of a logical volume group
Message-Id: <20020425123355.E16336@sistina.com>
References: <F47B5C16711BEC4BBB0651C75F724809D568@qntsv14.quant.com>
MIME-Version: 1.0
In-Reply-To: <F47B5C16711BEC4BBB0651C75F724809D568@qntsv14.quant.com>;
    from G.SchaeferReimers@quant-forum.de on Wed, Apr 24, 2002 at 10:05:16AM
    +0200
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Apr 25 05:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Apr 24, 2002 at 10:05:16AM +0200, Gesine Sch=E4fer-Reimers wrote:
> My question is: How can I restore one or more logical volumes in a big
> volume group with the constellation (system filesystems and "private
> filesystems") described later?
>=20
> I have one logical volume group named quant. This is placed in a physic=
al
> volume that is a partition in a RAID 5 system on SUSE Linux 7.2 with Ke=
rnel
> 2.4.=20
> The quant volume group is divided into a lot of logical volumes. Some o=
f
> them hold the filesystems /home /opt /tmp /var and the swap system. The
> other volumes have no file systems since they serve as a medium for inf=
ormix
> database data. These database-logical-volumes are bound to raw devices.
>=20
> I tried to do a restore of one of the "private" logical volumes but it
> failed since I cannot down the volume group because of the file systems
> mentioned above (it was denied by the system) and on a running volume g=
roup
> there is no possibility to access the device since it is in use.

Gesine,

if you mean restore on one of your raw devices bound to a logical volume
used as an informix database device, you need to shutdown the database
and run the restore. Sure you need to restore all logical volumes which
make up the informix database you want to restore or you end up with
and inconsistent database anyway.

If this doesn't help, please provide the steps and their output you took
which lead to the problem.

>=20
> Is there a possibility to handle that or to devide the volume group int=
o two
> parts (that for the system file systems and another one for the data)?

Yes, you can do that using pvmove/vgsplit.

This is a *major* configuration change, so you should plan for system
downtime to do it:

- use pvmove to put logical volumes holding /home, /opt etc. onto seperat=
e
 physical volumes from the ones holding your Informix databse logical vol=
umes

- use vgsplit to split volume group quant into 2 volume groups; one will=20
  stay named quant and the one holding the split of physical volumes will
  get a new name

See the manual pages for pvmove, vgsplit and our LVM HowTo
on www.sistina.com for further details.

>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
