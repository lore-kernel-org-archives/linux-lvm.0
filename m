Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0IJinxg026167
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 19:44:49 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CqzHV-0002vD-JF
	for linux-lvm@redhat.com; Tue, 18 Jan 2005 19:44:49 +0000
Date: Tue, 18 Jan 2005 19:44:49 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] snapshots and nfs
Message-ID: <20050118194449.GQ26670@agk.surrey.redhat.com>
References: <dff37527050118093648e504e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dff37527050118093648e504e@mail.gmail.com>
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

On Tue, Jan 18, 2005 at 12:36:06PM -0500, Kristina Clair wrote:
> so, is there a way to have lvcreate not suspend the volume?  I'm using
> xfs, so I should be able to freeze the filesystem.
 
Quick question: you're not running xfs_freeze are you?
If so, try without, as device-mapper does the equivalent of that
internally and xfs can't handle things if it gets run twice.

Alasdair
-- 
agk@redhat.com
