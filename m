Subject: Re: [linux-lvm] EXT3 vs Reiserfs
From: Matt <mschilli@vss.fsi.com>
In-Reply-To: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
Message-Id: <1070897481.9011.38.camel@hotbox>
Mime-Version: 1.0
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
Date: Mon Dec  8 09:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Reiserfs has in some cases better performance. But resiserfs (in 2.4)
has NO bad block management capabilities..=20


So, if your drive gets bad blocks, you can very quickly be rebuilding
your entire filesystem ( I lost a TB on a RAID where one drive developed
some bad blocks.)

Just keep in mind stability.

Matt Schillinger
mschilli@vss.fsi.com


On Mon, 2003-12-08 at 08:39, Yanick Quirion wrote:
> Hi all,
>=20
> Could you please tell what is the best filesystem for linux between ext=
3 and reiserfs?
>=20
> I know that ext3 can handle ACLs and not online fs extend, and reiserfs=
 do not seems to support ACLs (I found some patches for kernel 2.4.21, bu=
t there are errors when I apply them to the kernel sources), but can be e=
xtend while it's online.
>=20
> I'm just asking for your personal opinion and knowledge with them.
>=20
> Thanks.
>=20
> Regards,
>=20
> -----------
> Yanick Quirion
> Administrateur R=C3=A9seau/Network Manager
> NEOKIMIA INC.
> Institut de Pharmacologie de Sherbrooke
> 3e =C3=A9tage (=C3=89difice Z5)
> 3001 12e avenue Nord
> Sherbrooke, Qu=C3=A9bec
> CANADA
> J1H 5N4
> =20
> T=C3=A9l.:    +1 819 820-6040
> Direct:  +1 819 820-6855
> Fax.:    +1 819 820-6841
> =20
> email: Yanick.Quirion@neokimia.com
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
