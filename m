Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m54E7qML000726
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 10:07:52 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m54E7eLi026072
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 10:07:40 -0400
Received: from linux.interlinx.bc.ca (unknown [67.193.220.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 970572803
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 10:07:39 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id B5F8C808A
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 10:07:37 -0400 (EDT)
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of
	snapshot merging
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <Pine.LNX.4.64.0806040656380.2902@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525167.29076.191.camel@pc.ilinx>
	<Pine.LNX.4.64.0806040656380.2902@engineering.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-1PBN8MUlKJn3tHfTgY9r"
Date: Wed, 04 Jun 2008 10:07:37 -0400
Message-Id: <1212588457.29076.252.camel@pc.ilinx>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-1PBN8MUlKJn3tHfTgY9r
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2008-06-04 at 07:07 -0400, Mikulas Patocka wrote:
>=20
> > A pedantic example would be to create an origin, O1 and then a snapshot
> > of O1 called S1.  Make a bunch of changes to S1 and then create another
> > snapshot of O1 called S2 and then block copy from S1 to S2 (presumably,
> > although I don't know for sure, S2 only contains the same changed block=
s
> > as S1).
>=20
> No, if you block copy over /dev/vg/snapshot device, it will contain all=20
> the blocks (regardless if they differ from the origin or not).

So my premise of copying from S1 to S2 and the result that S2 would only
contain real blocks for what differs to the origin and pointers for
blocks that don't differ is false?

> There could theoretically be compare function, testing if the write equal=
s=20
> to actual data and dropping the write eventually --- but it would be too=20
> much coding overhead for too little practical advantage.

For certain use cases I think this would be a great advantage.  Think
about this:

     1. Create an LV and install a linux distro into it.
     2. Make a snapshot and customize to the settings for a given
        configuration (i.e. a group of hosts)
     3. Now I want to make an (initially) identical (to the snapshot
        customized in step 2) snapshot for each node in that
        configuration

Being able to do:

# lvcreate -L5G -n pristine node_group
[ install linux distro into /dev/node_group/pristine ]
# lvcreate -s -L$size -n config1_master pristine
# for node in $nodelist; do
>     lvcreate -s -L$size -n $node pristine
>     dd if=3D/dev/node_group/config1_master of=3D/dev/node_group/$node
> done

And have each of those snapshots be as efficient as config1_master.

> Snapshots are never shrunk (except when being merged) --- the metadata=20
> format doesn't allow to remove arbitrary exception from the exception=20
> table.

Pity.

b.


--=-1PBN8MUlKJn3tHfTgY9r
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIRqGpl3EQlGLyuXARAhZwAJ0bce1ElP6US/V5gOjPSWbGo2vtPQCg0pcL
wnUapbxwMhZ6HxiZIJgLbAU=
=olBf
-----END PGP SIGNATURE-----

--=-1PBN8MUlKJn3tHfTgY9r--
