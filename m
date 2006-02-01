Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k11IUZED016708
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 18:30:35 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F4MkV-0005mV-4d
	for linux-lvm@redhat.com; Wed, 01 Feb 2006 18:30:35 +0000
Date: Wed, 1 Feb 2006 18:30:35 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
Message-ID: <20060201183034.GM4280@agk.surrey.redhat.com>
References: <0456A130F613AD459887FF012652963F33ED0B@mail7.amherst.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0456A130F613AD459887FF012652963F33ED0B@mail7.amherst.edu>
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

On Wed, Feb 01, 2006 at 01:07:20PM -0500, Steffen Plotner wrote:
> cd to a directory on an lv that has an active snapshot
> dd if=/dev/zero of=test bs=1M count=10000
 
> And see how hard it is to remove a live active snapshot. 

Strange - I don't recall anyone reporting that problem before.

I've just tried it here and the machine locked up:-(

Alasdair
-- 
agk@redhat.com
