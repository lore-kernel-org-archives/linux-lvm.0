From: Jeff <threshar@torgo.978.org>
Message-Id: <20031016133727.469620f0.threshar@torgo.978.org>
In-Reply-To: <200310161009.27379.josh@agliodbs.com>
References: <Pine.BSF.4.44.0310160740510.5719-100000@torgo.978.org>
	<200310160949.59442.josh@agliodbs.com>
	<20031016130637.535f633f.threshar@torgo.978.org>
	<200310161009.27379.josh@agliodbs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Oct 16 14:06:09 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Josh Berkus <josh@agliodbs.com>
Cc: markw@osdl.org, pgsql-performance@postgresql.org, linux-lvm@sistina.com, pgsql-admin@postgresql.org

On Thu, 16 Oct 2003 10:09:27 -0700
Josh Berkus <josh@agliodbs.com> wrote:

> Jeff,
> 
> > I left the DB up while doing this.
> >
> > Even had a program sitting around committing data to try and corrupt
> > things. (Which is how I discovered I was doing the snapshot wrong)
> 
> Really?   I'm unclear on the method you're using to take the snapshot,
> then; I seem to have missed a couple posts on this thread.   Want to
> refresh me?
> 

I have a 2 disk stripe LVM on /dev/postgres/pgdata/

lvcreate -L4000M -s -n pg_backup /dev/postgres/pgdata
mount /dev/postgres/pg_backup /pg_backup 
tar cf - /pg_backup | gzip -1 > /squeegit/mb.backup 
umount /pg_backup;
lvremove -f /dev/postgres/pg_backup;

In a nutshell an LVM snapshot is an atomic operation that takes, well, a
snapshot of hte FS as it was at that instant.  It does not make a 2nd
copy of the data.   This way you can simply tar up the pgdata directory
and be happy as the snapshot will not be changing due to db activity.

-- 
Jeff Trout <jeff@jefftrout.com>
http://www.jefftrout.com/
http://www.stuarthamm.net/
