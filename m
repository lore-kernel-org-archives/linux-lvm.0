Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i82M2YJ0008008
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 23:02:34 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C2zf8-0000f8-1e
	for linux-lvm@redhat.com; Thu, 02 Sep 2004 23:02:34 +0100
Date: Thu, 2 Sep 2004 23:02:34 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] fc2 & lvm2 MAX LV
Message-ID: <20040902220234.GL6264@agk.surrey.redhat.com>
References: <1094161325.2396.22.camel@lnx2k>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1094161325.2396.22.camel@lnx2k>
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

On Thu, Sep 02, 2004 at 04:42:05PM -0500, Dan Fleischer wrote:
> Should I reinstall with at smaller, and presumably more efficient,
> PE Size?

A bigger PE size is more efficient for tools performance.
PE size is irrelevant to I/O performance.
LVs should go up to 16TB OK, though filesystems might not.

Alasdair
-- 
agk@redhat.com
