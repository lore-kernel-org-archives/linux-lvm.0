Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6SBjnIR032729
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 07:45:49 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.8])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6SBjYVx009456
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 07:45:35 -0400
Received: from localhost.housecafe.de ([127.0.0.1] helo=localhost)
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1MVl7V-00073X-W7
	for linux-lvm@redhat.com; Tue, 28 Jul 2009 13:45:26 +0200
Date: Tue, 28 Jul 2009 04:45:21 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [linux-lvm] lvm2 confused about double UUID
In-Reply-To: <20090727134109.GC3136@us.ibm.com>
Message-ID: <alpine.DEB.2.01.0907280436340.5831@bogon.housecafe.de>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
	<20090727134109.GC3136@us.ibm.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 27 Jul 2009 at 06:41, malahal@us.ibm.com wrote:
> I believe, "pvs" always rescans and just prints names it finds. It
> doesn't really tell what is used.

That's a pity then, I thought I could "trust" pvs to show what's really 
used, without going to the devices - which I did, and iostat disagreed 
with LVM. OTOH, this split mirror was confusing LVM, and me as well.

Anyway, I just went for it now: removed the filter= directives, 
ran pvcreate on sdb, now we have different UUID and all LVs survived - all 
but two, but these two were created after the split and must've been 
written to sdb. I think this was done before I installed the filter= in 
lvm.conf, because all the other LVs contain current data.

Lessons learned: deal with double UUIDs right after the mirror split, not 
a weeks later (which I did, because the backup took that long, but that's 
another story).

Thanks for all the comments on this,
Christian.
-- 
BOFH excuse #268:

Neutrino overload on the nameserver
