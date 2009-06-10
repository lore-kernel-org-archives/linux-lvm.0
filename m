Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5A18qSX008762
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 21:08:52 -0400
Received: from pzat.meep.org (155.251.187.81.in-addr.arpa [81.187.251.155])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5A18dke030714
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 21:08:39 -0400
Received: from oolon by pzat.meep.org with local (Exim 4.44)
	id 1MECIw-0001nv-LT
	for linux-lvm@redhat.com; Wed, 10 Jun 2009 01:08:38 +0000
Date: Wed, 10 Jun 2009 01:08:38 +0000
From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] pvmove or lv mirror/unmirror
Message-ID: <20090610010838.GA4285@pzat.meep.org>
References: <d4016b450906081448i165c25aelb98a196bb53b5d38@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4016b450906081448i165c25aelb98a196bb53b5d38@mail.gmail.com>
Sender: "James Hawtin,,," <oolon@pzat.meep.org>
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

> My doubt is... is it secure to use pvmove in disks with lots of data?
> I thought in using mirroring to keep my data safe, until breaking the
> mirror. All the syncing would be safer.
> This solution will work? What is the best option? May I move, or
> mirror, my data in a production environment?

I have some pvmovse on 1.5TB sections of data with success, I would warn you
it takes quite some time. Copying anything at the filesystem level takes
longer due to random access, if you want to try that use rsync repeated
times to get things right with minimum down time. DD works well for offline
systems, but you need to set a large block size. 

Like ways though before a bit change make sure you have a backup!

James
