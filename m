Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4KGKo031937
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 12:20:50 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i4KGKo110797
	for linux-lvm@redhat.com; Thu, 20 May 2004 11:20:50 -0500
Date: Thu, 20 May 2004 11:20:50 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] exit code of vgscan when everything is ok
Message-ID: <20040520112050.E3566@homer.msp.redhat.com>
References: <200405181252.32710.arekm@pld-linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200405181252.32710.arekm@pld-linux.org>;
	from arekm@pld-linux.org on Tue, May 18, 2004 at 12:52:32PM +0200
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

On Tue, May 18, 2004 at 12:52:32PM +0200, Arkadiusz Miskiewicz wrote:
> why it returns non-zero code? When there is no volume groups then it's normal 
> to find zero of them and it's not failure.
 
Fixed in CVS (tools/toollib.c); will get included in next release.

Alasdair
-- 
agk@redhat.com
