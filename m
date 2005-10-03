Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j93Ep9rW014393
	for <linux-lvm@redhat.com>; Mon, 3 Oct 2005 15:51:09 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EMRen-0007Nc-O9
	for linux-lvm@redhat.com; Mon, 03 Oct 2005 15:51:09 +0100
Date: Mon, 3 Oct 2005 15:51:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 lvcreate multi snapshots and dm-devel patches
Message-ID: <20051003145109.GK18976@agk.surrey.redhat.com>
References: <43414138.3090502@poczta.fm>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43414138.3090502@poczta.fm>
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

On Mon, Oct 03, 2005 at 04:33:28PM +0200, Hubert wrote:
> ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/editing-quilt/patches/

  dm-snapshot-metadata-reading-separation.patch

followed by:

  dm-snapshot-load-metadata-on-creation.patch

[with any recent kernel]

These patches are meant to solve one of the problems: they mean that
the metadata for snapshots is set up when the snapshot is created 
instead of the first time it is accessed.

However, if you apply them, you'll find that some LVM2 snapshot operations
are incomplete or hang and need prodding or finishing with dmsetup (eg with 
a dmsetup resume or remove).  This is because the order LVM2 does some
operations needs to be changed.


You should also apply dm-snapshot-chunksize-fix.patch - it stops
you choosing a chunk size that is too big and causes a crash.
(Validation has also been added to LVM2 in CVS to validate the
chunk size better.)
 
Alasdair
-- 
agk@redhat.com
