Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBDCvBBM028952
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:57:11 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Em9iQ-0004M2-Ph
	for linux-lvm@redhat.com; Tue, 13 Dec 2005 12:57:10 +0000
Date: Tue, 13 Dec 2005 12:57:10 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm1 to lvm2 upgrade failed: confused on pv between
	sda1 and md5
Message-ID: <20051213125710.GG25866@agk.surrey.redhat.com>
References: <20051212182045.GA30998@merlins.org>
	<20051212184408.GD25866@agk.surrey.redhat.com>
	<20051213022027.GD28650@merlins.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051213022027.GD28650@merlins.org>
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

On Mon, Dec 12, 2005 at 06:20:27PM -0800, Marc MERLIN wrote:
> That was the one, thank you so much.
> For some reason, the debian package I got had this set to 0 by default
 
When it was first introduced, the md detection didn't handle some cases
very well, so Debian decided to turn it off by default.  The changes to
handle those cases correctly were made over a year ago, but Debian still 
doesn't enable it.

  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=278180

Alasdair
-- 
agk@redhat.com
