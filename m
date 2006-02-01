Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11LTO111486
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 16:29:24 -0500
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k11LTMcm026782
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 16:29:22 -0500
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <43E0E3E3.3030407@starnetworks.us>
References: <43E0E3E3.3030407@starnetworks.us>
Date: Wed, 01 Feb 2006 13:29:14 -0800
Message-Id: <1138829354.26648.85.camel@seki.nac.uci.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2006-02-01 at 10:37 -0600, Kevin P. Fleming wrote:
> I noticed that this is still the case... but I want to use it :-)
> 
> I need to set up simple snapshot/rsync backups of XFS filesystems, so 
> I'm wondering what the current thinking in the community is. Is it 
> reliable enough to trust not to crash my server or do other nasty things?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

I've been doing my home backups via rsync to an xfs via cron, and using
rsync from whatever (mostly ext3 and UFS) to ext3 for one-off backups
prior to making large administrative changes to systems.  It seems to be
working well so far, and also seems to give a very nice combination of
single-file recovery ease and disaster recovery ease, which isn't
astonishingly common.

It just maintains a series of hardlink trees, so any time a file is
deleted or added, the actual disk usage increase is only due to the
changes.

And, every backup after the first is both a fullsave and an incremental
in a sense - but the network usage is far, far less than your typical
fullsave.

http://dcs.nac.uci.edu/~strombrg/Backup.remote.html
