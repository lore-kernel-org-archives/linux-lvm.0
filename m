Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i37Hs5j19185
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 13:54:06 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i37Hs4p29047
	for linux-lvm@redhat.com; Wed, 7 Apr 2004 12:54:04 -0500
Date: Wed, 7 Apr 2004 12:54:04 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Snapshots failing w/ kernel 2.6.4
Message-ID: <20040407125404.C18295@homer.msp.redhat.com>
References: <40743C87.4080805@oddbit.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40743C87.4080805@oddbit.com>;
	from lars@oddbit.com on Wed, Apr 07, 2004 at 01:38:15PM -0400
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 07, 2004 at 01:38:15PM -0400, Lars Kellogg-Stedman wrote:
> When I try to create a snapshot of a 50g LV named 'home':
> 	# lvm lvcreate -s -L 5g -n home.snap0 /dev/vg0/home
 
> I receive the following error:
> 	device-mapper ioctl cmd 9 failed: Invalid argument

> Is this a known problem?
 
The kernel you're running does not support snapshots yet.
Snapshot support for 2.6 is currently being tested - watch the dm-devel
list to keep up with progress.

Alasdair
-- 
agk@redhat.com
