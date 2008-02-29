Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
From: Greg Hudson <ghudson@MIT.EDU>
In-Reply-To: <20080229183148.GI1788@agk.fab.redhat.com>
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>
	<20080229183148.GI1788@agk.fab.redhat.com>
Date: Fri, 29 Feb 2008 14:11:05 -0500
Message-Id: <1204312265.5850.7.camel@error-messages.mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-lvm@redhat.com

On Fri, 2008-02-29 at 18:31 +0000, Alasdair G Kergon wrote:
> On Fri, Feb 29, 2008 at 12:32:41PM -0500, ghudson@MIT.EDU wrote:
> > The reproduction recipe looks like:
> >   rm -rf /tmp/test
> >   mkdir /tmp/test
> >   # Put around 60MB of files into /tmp/test
> >   find /tmp/test -type f | xargs md5sum > /tmp/sum.pre
> >   lvcreate --size 2G --snapshot /dev/dink/gutsy-i386-sbuild --name testsnapshot
> >   find /tmp/test -type f | xargs md5sum > /tmp/sum.post
> 
> Can you do that twice?
>     find /tmp/test -type f | xargs md5sum > /tmp/sum.post2
> and check the two post files are the same?

In three reproductions of the page cache corruption, sum.post2 was
always the same as sum.post.

In my experiences with this problem in general, the page cache
corruption is not particularly transient; once it happens, the file
continues to appear modified (with the same incorrect contents) for the
indefinite future, until the machine is rebooted.

> And add some syncs/blockdev --flushbufs at different places
> in the script to see if you can make it go away.

Nope, that never made it go away.  I'm not sure in what situations
flushing write buffers would have any effect.  If I had a way to throw
away the read-only page cache and force a file reload from disk, I would
expect that to eliminate the visible effect of the corruption; at the
moment the only reliable way I know how to do that is to reboot.  (I
could churn the page cache into oblivion with a bazillion reads of
different files, but I'd have no way of knowing when I had succeeded in
reusing the corrupted cache page.)
