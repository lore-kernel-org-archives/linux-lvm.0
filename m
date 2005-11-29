Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATJJ7V02561
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 14:19:07 -0500
Received: from mail.davidb.org (adsl-64-172-240-129.dsl.sndg02.pacbell.net
	[64.172.240.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jATJJ696029768
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 14:19:07 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1EhB0M-0002pf-EX
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 11:19:06 -0800
Date: Tue, 29 Nov 2005 11:19:06 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] Enterprise Backup Software with good support for LVM
Message-ID: <20051129191905.GA10770@old.davidb.org>
References: <0456A130F613AD459887FF012652963F33EB75@mail7.amherst.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0456A130F613AD459887FF012652963F33EB75@mail7.amherst.edu>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 29, 2005 at 01:43:17PM -0500, Steffen Plotner wrote:

> I would like to add that creating backups of LVM snapshots is sensible,
> as the data is in a crash-consistent state. Today's operating systems
> can definitely handle this type of state. I have developed scripts that
> effectively netcat contents from LVM snapshots to a remote machine
> (either into another logical volume or simply a file). 

One other thing to point out.  Any backup utility that is based on
timestamps, as opposed to a file database, is going to occasionally miss
changes made between the creation of the snapshot and the invocation of the
backup.

For example.  I perform the following.

   - Make snapshot of /foo.
   - Create file /foo/bar.
   - Backup the /foo snapshot.

At this point, the backup of /foo won't contain the file 'bar', since it
was created after the snapshot was made.

However, if the backup software uses the time that the backup was created,
rather than the time the snapshot was created, it will think that /foo/bar
would have been included in the backup, and won't catch it for future
incrementals.

If the backup software knows about LVM (creating the snapshots itself, for
example), then it _should_ know to use the correct timestamp.  My personal
experience is that it is very rare to find backup software that will
restore to the same filesystem at the time of backup.  Even the very
expensive ones don't always do the right thing.

As an example, GNU tar can be coerced into doing the right thing with LVM
snapshots.  Something like this.

  # touch /tmp/snapstamp
  # lvcreate -s ...
  # mount ...
  # tar ... -g $lfile ...

  Then fix up the timestamp on the backup.
  # stat -c %Y /tmp/snapstamp > $lfile.bak
  # tail -n +2 $lfile >> $lfile.bak
  # mv $lfile.bak $lfile

Star accepts a 'dumpdate=/tmp/snapstamp' option to use instead of current
time.

Dave
