Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3SDk8O7006763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 09:46:08 -0400
Received: from nm11.bullet.mail.ne1.yahoo.com (nm11.bullet.mail.ne1.yahoo.com
	[98.138.90.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32174C049D52
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 13:46:05 +0000 (UTC)
Date: Thu, 28 Apr 2016 13:46:03 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1684768750.3193600.1461851163510.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1684768750.3193600.1461851163510.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] thin handling of available space
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> > The real question you should be asking is if it increases the monitoring
> > aspect (enhances it) if thin pool data is seen through the lens of the
> > filesystems as well.

Then you want an integrated block+fs implementation. See BTRFS and ZFS. WAFL and friends.

> kernel for communication from lower fs layers to higher layers -

Correct. Because doing so violates the fundamental precepts of OS design. Higher layers trust lower layers. Thin Pools are outright lying about the real world to anything that uses it's services. That is its purpose. The FS doesn't give a damn that the block layer is lying to it, it can and does assume and rightly so that what the block layer says it has, it indeed does have. The onus of keeping the block layer ahead of the FS falls on a third party - the system admin. The system admin decided it was a bright idea to use thin pools in the first place so he necessarily signed up to be liable for the hazards and risks that choice entails. It is not the job of the FS to bail his ass out.

A responsible sysadmin who chose to use thin pools might configure the initial FS size to be some modest size well within the constraints of the actual block store, and then as the FS hit say 85% utilization to run a script that investigated the state of the block layer and use resize2fs and friends to grow the FS and let the thin-pool likewise grow to fit as IO gets issued. But at some point when the competing demands of other FS on the thin-pool were set to breach actual block availability, the script would refuse to grow the FS and thus userland would get signaled by the FS layer that it's out of space when it hit 100% util.

Another way (haven't tested) to 'signal' the FS as to the true state of the underlying storage is to have a sparse file that gets shrunk over time.

But either way if you have a sudden burst of I/O from competing interests in the thin-pool, what appeared to be a safe growth allocation at one instant of time is not likely to be true when actual writes try to get fulfilled. 

Mindless use of thin-pools is akin to crossing a heavily mined beach. Bring a long stick and say your prayers because you'r likely going to lose a limb.
