From: Jeff <threshar@torgo.978.org>
In-Reply-To: <200310142218.h9EMIWo27040@mail.osdl.org>
Message-ID: <Pine.BSF.4.44.0310160740510.5719-100000@torgo.978.org>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [PERFORM] backup/restore - another area.
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
Date: Thu Oct 16 07:56:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "markw@osdl.org" <markw@osdl.org>
Cc: "pgsql-performance@postgresql.org" <pgsql-performance@postgresql.org>, "linux-lvm@sistina.com" <linux-lvm@sistina.com>, pgsql-admin@postgresql.org

On Tue, 14 Oct 2003, markw@osdl.org wrote:

> I'm curious to what kind of testing you've done with LVM.  I'm not
> currently trying any backup/restore stuff, but I'm running our DBT-2
> workload using LVM.  I've started collecting vmstat, iostat, and
> readprofile data, initially running disktest to gauge the performance.
>
[added -admin to this, since this is very relevant there]

I was going to post this data yesterday, but I had severe inet issues.

So, I tried this out with lvm2 on 2.4.21 on a 2xp2-450 with 2 disks.
(I just looked at your 14 and 52 disk data. drool.)

So I have a db which is about 3.2GB on disk.
All backups were done to an nfs mount, but I ran a network monitor to
check bandwidth usage. I note where things were io bound.

backing up:

pg_dump: 18m             [cpu bound]
pg_dump | gzip -1: 18m   [cpu bound]

snapshot, then tar: 4m         [io bound]
snapshot, then tar | gzip: 21m [cpu bound]

The times for a compressed backup are a bit slower for snapshots, but this
is where the snapshot method wins tacos - restore.

restore:

psql:      158m
snapshot:    8m

Yes folks, 8m.
When I started PG back up it checked the WAL and got itself back online.

The benefits of the pg_dump backup afaict are that the data is in a format
readable to anything and is [mostly] cross-pg compatible. The downside is
it seems to be quite slow and restoring it can be long and tiresome.

The benefits of the snapshot are that backups are very, very quick and
restore is very, very quick (It won't need to re-enable foriegn keys, no
need to rebuild indexes, no need to re-vacuum analyze). The downside is
this method will only work on that specific version of PG and it isn't the
"cleanest" thing in the world since you are essentially simulating a power
failure to PG. Luckly the WAL works like a champ. Also, these backups can
be much larger since it has to include the indexes as well. but this is a
price you have to pay.

I did have some initial problems with snapshots & corruption but it turned
out to be user-error on my part.

COOL HUH?

--
Jeff Trout <jeff@jefftrout.com>
http://www.jefftrout.com/
http://www.stuarthamm.net/
