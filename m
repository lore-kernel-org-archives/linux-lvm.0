Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36EMRj11666
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:22:27 -0400
Received: from bucket.localnet (dsl-202-72-149-28.wa.westnet.com.au
	[202.72.149.28])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36EMN5D019753
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:22:25 -0400
Received: from [127.0.0.1] (6to4-localhost [127.0.0.1] (may be forged))
	by bucket.localnet (8.12.8/8.12.8) with ESMTP id i36EMnx4016898
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 22:22:49 +0800
Subject: Re: [linux-lvm] snapshots and 2.6 kernel
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <OFDA4623E8.BF7156E4-ON80256E62.004D4E4D-80256E62.004DBAD7@philips.com>
References: <OFDA4623E8.BF7156E4-ON80256E62.004D4E4D-80256E62.004DBAD7@philips.com>
Message-Id: <1081260082.6908.12.camel@albert.localnet>
Mime-Version: 1.0
Date: Tue, 06 Apr 2004 22:01:22 +0800
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2004-03-25 at 22:07, darren.miller@philips.com wrote:
> Getting the volume active is a pain I found that you have to reboot the 
> system and when it comes back you need to create a link your volume group 
> directory for the snapshot you create, atleast after the reboot the 
> snapshot device showup in /dev/mapper which is a start right.

It would be _really_ good if LVM2 would fail gracefully when a snapshot
fails, or try to discover whether or not it can take the snapshot before
trying. At the very least a big **WARNING** in the _LVM2_ docs and in
lvcreate would help a lot.

I found LVM1 snapshots so perfect that I never thought about them
anymore; LVM2 on 2.6 was a nasty shock that I'd love to see others saved
from.

Craig Ringer
