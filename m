In-reply-to: <2D92FEBFD3BE1346A6C397223A8DD3FC09243E@THOR.goeci.com> 
References: <2D92FEBFD3BE1346A6C397223A8DD3FC09243E@THOR.goeci.com>
Message-ID: <23371.1066406725@sss.pgh.pa.us>
From: Tom Lane <tgl@sss.pgh.pa.us>
Subject: [linux-lvm] Re: [ADMIN] [PERFORM] backup/restore - another area.
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
Date: Fri Oct 17 15:02:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
Cc: 'Jeff' <threshar@torgo.978.org>, Josh Berkus <josh@agliodbs.com>, markw@osdl.org, pgsql-performance@postgresql.org, linux-lvm@sistina.com, pgsql-admin@postgresql.org

Murthy Kambhampaty <murthy.kambhampaty@goeci.com> writes:
> ... The script handles situations
> where (i) the XFS filesystem containing $PGDATA has an external log and (ii)
> the postmaster log ($PGDATA/pg_xlog) is written to a filesystem different
> than the one containing the $PGDATA folder.

It does?  How exactly can you ensure snapshot consistency between
data files and XLOG if they are on different filesystems?

			regards, tom lane
