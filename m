content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] LVM for a Database
Message-ID: <8075D5C3061B9441944E137377645118012DBB@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <arechenberg@shermfin.com>
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
Date: Mon Dec  2 05:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

My apologies.  I should have said "In my experience, with the databases
and hardware I've used, RAID10 *should* give you better performance."

As always, testing in a controlled environment, with your hardware and
software and a "realistic" production load, is going to give you the
data that you need to make the best decision. =20

That being said, my disk I/O was very very good with a RAID10 disk
subsystem configuration with our hardware and software.

Sorry for the ambiguity.

Regards,
Andy.

-----Original Message-----
From: Kirby C. Bohling [mailto:kbohling@birddog.com]=20
Sent: Tuesday, November 26, 2002 5:57 PM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] LVM for a Database


On Tue, 2002-11-26 at 16:09, Rechenberg, Andrew wrote:
>=20
> You're going to get better performance if you have /dev/sd[b-e] and
then
> span across those devices or use LVM striping.  That is RAID10.
>=20

You can't possibly know that without knowing several facts.

A lot of times independent disk heads is much then not.  Specifically,
the journal should definitely be put on a different set of disks then
the straight data.  For reliability, and for speed.

What database is he running (Oracle, PostGres, DB2, MySQL, Sybase,
Informix).

What kind of database is it?  In Oracle speak, is it decision support,
or online transaction based.

It is doing warehousing of bulk data that is almost never written to?

What's the priority, uptime or throughput? (You make different decisions
based on this).

Do you have seperate disks for your journals/logs/archives?  If not, you
have to take that into account for your recovery.

I know a lot of DBA's always say more independant spindles is better.=20
However, our last set of DBA's, showed that wasn't the case for our
production database, because 4 disks worked really hard, while 12 sat
idle. So we put 14 of them together in a RAID10, and left 2 out (not
even mirrored).  The two raw disks are used for the redo logs, and the
spare copies of the control files.  While the 14 disks are used for all
the datafiles.  Including the indexes and the data (which is really
stupid according to everything I have ever read reguarding Oracle
tuning).  However, in this case it worked.

The right answer for him is to setup as many configurations as he can,
and put as close to a production load as he can manage onto it.

	Thanks,
		Kirby



> I have a Dell 6600 with two PowerVault 220S with the second
> configuration (12 RAID1 arrays, /dev/sd[c-n]) and then use Linux
> software RAID0 to stripe across those 12 RAID1 arrays.  It gives
fairly
> good performance.
>=20
> I don't have LVM on top of the RAID0, but I will be doing just that in
> the near future and I can post the results here if you wish.
>=20
> Regards,
> Andy.
>=20
> -----Original Message-----
> From: Joseph Kezar [mailto:jkezar@doc.state.vt.us]=20
> Sent: Tuesday, November 26, 2002 3:29 PM =20
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] LVM for a Database
>=20
>=20
> We are in the process of building a database on a 4 processor 1.8GHz,
> 4GB RAM Dell 6650.
>=20
> I am trying to figure out the most efficient way to use LVM for our
raw
> data storage.  We have a RAID array with 8x36GB drives in it.  Should
I
> do a raid 1+0(mirror 4 disks, and span them to get one logical
volume)?
>=20
> If so this leaves me a /dev/sdb.  Or would I get better performance if
I
> mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].
> Is it possible to figure out where the center of our spindles are?  So
I
> can arrange for the heads to spend little time seeking?
>=20
> Any perfomance hints would be greatly appreciated.
>=20
> thanks
> Joe K.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
--=20
Real Programmers view electronic multimedia files with a hex editor.


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
