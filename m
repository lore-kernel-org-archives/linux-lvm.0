From: Jeff <threshar@torgo.978.org>
Message-Id: <20031016130637.535f633f.threshar@torgo.978.org>
In-Reply-To: <200310160949.59442.josh@agliodbs.com>
References: <Pine.BSF.4.44.0310160740510.5719-100000@torgo.978.org>
	<200310160949.59442.josh@agliodbs.com>
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
Date: Thu Oct 16 14:06:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Josh Berkus <josh@agliodbs.com>
Cc: markw@osdl.org, pgsql-performance@postgresql.org, linux-lvm@sistina.com, pgsql-admin@postgresql.org

On Thu, 16 Oct 2003 09:49:59 -0700
Josh Berkus <josh@agliodbs.com> wrote:

> Jeff,
> 
> > The downside is
> > this method will only work on that specific version of PG and it
> > isn't the"cleanest" thing in the world since you are essentially
> > simulating a power failure to PG. Luckly the WAL works like a champ.
> > Also, these backups can be much larger since it has to include the
> > indexes as well. but this is a price you have to pay.
> 
> The other downside is, of course, that the database needs to be shut
> down.
> 

I left the DB up while doing this.

Even had a program sitting around committing data to try and corrupt
things. (Which is how I discovered I was doing the snapshot wrong)

You could  do pg_ctl stop; snapshot; pg_ctls tart for a "clean" image. 

-- 
Jeff Trout <jeff@jefftrout.com>
http://www.jefftrout.com/
http://www.stuarthamm.net/
