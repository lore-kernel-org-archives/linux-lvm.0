From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] PostgreSQL and file system level backup
Message-ID: <20021116031032.V17827@vestdata.no>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC09208C@THOR.goeci.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2D92FEBFD3BE1346A6C397223A8DD3FC09208C@THOR.goeci.com>; from murthy.kambhampaty@goeci.com on Fri, Nov 15, 2002 at 04:25:49PM -0500
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
Date: Fri Nov 15 20:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: Postgres Admin List <pgsql-admin@postgresql.org>, "Linux-Xfs (E-mail)" <linux-xfs@oss.sgi.com>

On Fri, Nov 15, 2002 at 04:25:49PM -0500, Murthy Kambhampaty wrote:
> "Unless the postmaster is shut down meanwhile, you'll probably end up w=
ith a
> corrupt database.  The problem is that xfsdump does not give you an
> instantaneous snapshot of the filesystem state, so you will probably co=
llect
> inconsistent contents of the various files that make up the database."
>=20
> Which gives rise to my present question: given that LVM DOES give an
> instantaneous snapshot of the filesystem, would an xfsdump of an LVM
> snapshot of an XFS filesystem give usable backups?

Yes, it should.

Allthough, some of the postgresql-developers use the term "corrupt
database" of a database where the table-files are inconsistant. That's
generally _always_ the case when the server is running, as the latest
updates are only available in the database-log. That's also the case for
the LVM-snapshot.

This "inconsistancy" will be fixed by log-replay when you start the serve=
r
(after restore).

If you want to avoid it, you can:
- shut down databasee
- take snapshot
- start database
- backup from snapshot



There was a long thread on this subject on the postgresql-list a month
or two ago.




--=20
Ragnar Kj=F8rstad
Big Storage
