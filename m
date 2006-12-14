Received: from [192.168.1.2] (vpn-68-2.surrey.redhat.com [10.32.68.2])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBEDnVwd002425
	for <linux-lvm@redhat.com>; Thu, 14 Dec 2006 13:49:32 GMT
Message-ID: <45815669.5000107@redhat.com>
Date: Thu, 14 Dec 2006 13:49:29 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgimport/vgexport commands when logically moving
	disks between systems
References: <298476.26347.qm@web51103.mail.yahoo.com>
In-Reply-To: <298476.26347.qm@web51103.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dave wrote:
> Hi Patrick,
> 
> Thanks for clarifying the status of LVM1 (ie. *not* a clustering tool).  That's
> somewhat surprising since it does include an LVM script in the resource.d directory.
>  In any case, we're not in a huge rush to upgrade to LVM2 unless it really is
> necessary, as these are RH AS3 boxes running the 2.4.21-47.ELsmp kernel, and the
> docs I've read suggest LVM2 really needs/wants to run under a 2.6.x kernel.

Yes. there are device-mapper patches for 2.4 but it's really recommended to run 2.6.

> If direct-io to metadata could be set as an option under LVM1, assuming that isn't
> the default, that would be helpful.  But, it sounds like no one really wants to
> support LVM1 anymore?!

That's true. lvm1 is in maintenance mode for RHEL3.

> Assuming we want to go forward with an upgrade to LVM2 on the current systems, how
> involved is that procedure?  Do we risk losing all our data?

No. lvm2 can read and write lvm1 metadata. you can upgrade it to lvm2 format metadata with a single command (vgconvert)
-- 

patrick
