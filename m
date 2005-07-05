Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j65KYP3N012204
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 21:34:25 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dpu7d-0003oc-4C
	for linux-lvm@redhat.com; Tue, 05 Jul 2005 21:34:25 +0100
Date: Tue, 5 Jul 2005 21:34:25 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Segfault in lvcreate?
Message-ID: <20050705203425.GC12337@agk.surrey.redhat.com>
References: <Pine.LNX.4.44.0507051240100.21204-100000@algiers.clic.cs.columbia.edu>
	<Pine.LNX.4.44.0507051622040.21204-100000@algiers.clic.cs.columbia.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0507051622040.21204-100000@algiers.clic.cs.columbia.edu>
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

On Tue, Jul 05, 2005 at 04:27:45PM -0400, Dan B. Phung wrote:
> I used an old version from a build I cvs updated from
> earlier this year:
 
If you're using CVS, you're always taking a chance as to whether or
not it'll work.  Update to the current CVS and try again.

If it still fails, post a backup of your metadata here.
Add -vvvv to the cmd to get diagnostic output, and post the last few 
lines of it here.

Alasdair
-- 
agk@redhat.com
