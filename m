Message-ID: <2D92FEBFD3BE1346A6C397223A8DD3FC09208C@THOR.goeci.com>
From: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
MIME-Version: 1.0
Subject: [linux-lvm] PostgreSQL and file system level backup
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
Date: Fri Nov 15 15:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Postgres Admin List <pgsql-admin@postgresql.org>
Cc: "Linux-Xfs (E-mail)" <linux-xfs@oss.sgi.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

The postgresql documentation states that in order to get a usable backup
from a filesystem dump (or copy) the database server must be shut down.
Moreover, "Half-way measures such as disallowing all connections will not
work as there is always some buffering going on. For this reason it is also
not advisable to trust file systems that claim to support "consistent
snapshots"."

Just to make certain, is this true with running xfsdump on an LVM snapshot
of the XFS filesystem? My question was prompted by a recent post on the
linux-xfs list in which one of the xfs maintainers pointed out that xfsdumps
are cache coherent. In response to my preliminary question, Tom Lane pointed
out that:

"Unless the postmaster is shut down meanwhile, you'll probably end up with a
corrupt database.  The problem is that xfsdump does not give you an
instantaneous snapshot of the filesystem state, so you will probably collect
inconsistent contents of the various files that make up the database."

Which gives rise to my present question: given that LVM DOES give an
instantaneous snapshot of the filesystem, would an xfsdump of an LVM
snapshot of an XFS filesystem give usable backups?

Thanks,
	Murthy

PS: Our databases have crossed the 100 GB size, with some tables reaching 25
GB, so pg_dump is taking more than 5 hours to complete (changing the level
of compression in custom format dump files from 6 to 1 did not significantly
reduce the dump duration). Otherwise, pg_dump-ing the database (and copying
the .conf files) was just dandy.
