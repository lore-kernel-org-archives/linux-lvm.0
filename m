Message-Id: <200310142218.h9EMIWo27040@mail.osdl.org>
From: markw@osdl.org
In-Reply-To: <878ynu9ed5.fsf@stark.dyndns.tv>
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
Date: Tue Oct 14 17:20:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: threshar@torgo.978.org
Cc: pgsql-performance@postgresql.org, linux-lvm@sistina.com

Jeff,

I'm curious to what kind of testing you've done with LVM.  I'm not
currently trying any backup/restore stuff, but I'm running our DBT-2
workload using LVM.  I've started collecting vmstat, iostat, and
readprofile data, initially running disktest to gauge the performance.

For anyone curious, I have some data on a 14-disk volume here:
	http://developer.osdl.org/markw/lvm/results.4/log/
	
and a 52-disk volume here:
	http://developer.osdl.org/markw/lvm/results.5/data/

Mark

>Jeff <threshar@torgo.978.org> writes:
>
> Idea #1:
> Use an LVM and take a snapshop - archive that.
> From the way I see it. the downside is the LVM will use a lot of space
> until the snapshot is removed.  Also PG may be in a slightly inconsistant
> state - but this should "appear" to PG the same as if the power went out.
> 
> For restore, simply unarchive this snapshot and point postgres at it. Let
> it recover and you are good to go.
> 
> Little overhead from what I see...
> I'm leaning towards this method the more I think of it.
