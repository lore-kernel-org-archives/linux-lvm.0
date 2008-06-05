Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m55NOFGD007672
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2008 19:24:15 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m55NNd5K006868
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2008 19:23:39 -0400
Message-ID: <62860.128.218.6.3.1212708196.squirrel@biostat.ucsf.edu>
In-Reply-To: <62138.128.218.6.3.1212706444.squirrel@biostat.ucsf.edu>
References: <62138.128.218.6.3.1212706444.squirrel@biostat.ucsf.edu>
Date: Thu, 5 Jun 2008 16:23:16 -0700 (PDT)
From: ross@biostat.ucsf.edu
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Help! snapshot apparenly trashed LVM [recovered?
	but still Q's]
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
To: ross@biostat.ucsf.edu
Cc: tabor@biostat.ucsf.edu, linux-lvm@redhat.com

> I did some expanding and shrinking of my volumes and then attempted to
> take a snapshot.  I got an error message that started "Invalid LV in
> extent map".  I now see that message when I do lvscan or pvscan as well.
>
> This looks very bad, and seems to be the same situation as described here:
> http://weblog.pell.portland.or.us/~orc/2008/02/20/000/index.html
>
> Despite these warnings, I *seem* to be able to use my volumes.  However, I
> have stopped doing anything on the system to try to prevent corruption.
>
> First, is it safe to continue to use the system?
>
> Second, what can I do to diagnose or recover?
>
> I'm running a stock Debian 2.6.24 kernel with a single SCSI disk.  Some of
> its partitions are dedicated to an LVM group, out of which most of my
> partitions are carved.  The LVM groups were originally created under EVMS
> with a 2.4 kernel.  I converted them to straight LVM months ago.
>
Following some suggestions in the archive, I used vgcfgrestore -M1 with
the last metadata before the backup, and things seem to be back.  At least
lvscan runs with out errors.

So, 2 new questions:
1) are my data OK? (I'm also curious about what state the system was in
before the recovery--was it safe to use?)

2) how can I take a snapshot without running into this problem?

Thanks.
Ross
