Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n3GCs33F015373
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 08:54:03 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LuR6R-0005Yv-9D
	for linux-lvm@redhat.com; Thu, 16 Apr 2009 13:54:03 +0100
Date: Thu, 16 Apr 2009 13:54:03 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
Message-ID: <20090416125403.GU7843@agk.fab.redhat.com>
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
	<49E71F9D.3010401@sivell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49E71F9D.3010401@sivell.com>
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

On Thu, Apr 16, 2009 at 07:07:57AM -0500, vu pham wrote:
> yogeen honnavar wrote:
> >Dear users,
> >dd if=/dev/zero of=/dev/vg1/lv1 count=10
> >as per the redhat guide this should result in mirror leg failure and any 

Can you provide the reference - where does it say this?

Alasdair
-- 
agk@redhat.com
