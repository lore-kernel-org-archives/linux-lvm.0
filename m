From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] PostgreSQL and file system level backup
Message-ID: <58090000.1037406183@[192.168.200.4]>
In-Reply-To: <2D92FEBFD3BE1346A6C397223A8DD3FC09208C@THOR.goeci.com>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC09208C@THOR.goeci.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Nov 15 18:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> Which gives rise to my present question: given that LVM DOES give an
> instantaneous snapshot of the filesystem, would an xfsdump of an LVM
> snapshot of an XFS filesystem give usable backups?

> PS: Our databases have crossed the 100 GB size, with some tables reaching
> 25 GB, so pg_dump is taking more than 5 hours to complete (changing the
> level of compression in custom format dump files from 6 to 1 did not
> significantly reduce the dump duration). Otherwise, pg_dump-ing the
> database (and copying the .conf files) was just dandy.

LVM won't give you any more stable of a pictire over 5
hours than anything else will unless you shut dwon the
database first. Even if you try it once and the process
works you are just as likely to be bit my Murphy on the
next trial.

Alternatives:

	Use a mirror for the database, split it, and use that
	copy for a backup. This is a common procedure in data
	warehousing.

	Make incremental backups of the daily loads and only
	perform a full backup on, say, weekends at 0300; use
	RAID5 or mirroring to minimimize the odds of having to
	restore anything.
	
	You may be able to dump portions of the
	database in parallel to decrease the time (this
	requires careful partitioning of the space).

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
