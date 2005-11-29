Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATIoWV24873
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:50:32 -0500
Received: from mail.davidb.org (adsl-64-172-240-129.dsl.sndg02.pacbell.net
	[64.172.240.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jATIoUQ0019493
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:50:31 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1EhAYd-0002dV-Sp
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 10:50:27 -0800
Date: Tue, 29 Nov 2005 10:50:27 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] Enterprise Backup Software with good support for LVM
Message-ID: <20051129185026.GA9978@old.davidb.org>
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

If you are using a journalling filesystem, then the snapshot should be
consistent.  XFS and LVM2 work together to try and make the snapshot even
more consistent.

The question, then would be can you integrate the LVM2 snapshot
creation/removal with the backup software.  I backup my snapshot volumes
using custom backup software (file based) and things work fine.

I have discovered a minor problem with snapshots, but haven't figured out
exactly what is happening.  It seems that with some types of databases,
modifications made to the database happen across the snapshots (happen to
both images).  I suspect it has something to do with mmapping a file, but I
can't reproduce it with my own code.  For my instances, the changes don't
hurt anything, since they are databases that are essentially caches of
other derrived information, but a real database file could be a problem.

Dave
