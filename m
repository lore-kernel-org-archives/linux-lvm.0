From: Josh Berkus <josh@agliodbs.com>
References: <Pine.BSF.4.44.0310160740510.5719-100000@torgo.978.org>
In-Reply-To: <Pine.BSF.4.44.0310160740510.5719-100000@torgo.978.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200310160949.59442.josh@agliodbs.com>
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
Date: Thu Oct 16 14:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jeff <threshar@torgo.978.org>, "markw@osdl.org" <markw@osdl.org>
Cc: "pgsql-performance@postgresql.org" <pgsql-performance@postgresql.org>, "linux-lvm@sistina.com" <linux-lvm@sistina.com>, pgsql-admin@postgresql.org

Jeff,

> The downside is
> this method will only work on that specific version of PG and it isn't the
> "cleanest" thing in the world since you are essentially simulating a power
> failure to PG. Luckly the WAL works like a champ. Also, these backups can
> be much larger since it has to include the indexes as well. but this is a
> price you have to pay.

The other downside is, of course, that the database needs to be shut down.

> COOL HUH?

Certainly very useful in the DBA's arsenal of backup tools.

-- 
Josh Berkus
Aglio Database Solutions
San Francisco
