Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o42KXERM025560
	for <linux-lvm@redhat.com>; Sun, 2 May 2010 16:33:15 -0400
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o42KX4M2005569
	for <linux-lvm@redhat.com>; Sun, 2 May 2010 16:33:05 -0400
Message-ID: <4BDDE17F.7090300@strike.wu.ac.at>
Date: Sun, 02 May 2010 22:33:03 +0200
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] logical volumes and raid alignment
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi!

I am using LVM on a hardware RAID 5 and I'd like to tune the alignment
of lvm extents to match the raid stripe size.

My raid chunk size is 64k and I am using 5 data-bearing discs (raid 5
with 6 discs), so the raid stripe size should be 64k * 5 = 320k.

I have already managed to properly align the partition to a multiple of
this value and I am able to align the beginning of the first extent by
specifying --dataalignment 320k to pvcreate.

But unfortunately the --physicalextentsize must be a power of 2, so I
cannot use a multiple of 320k as the physical extent size.

What are your experiences with tuning and properly aligning lvm + raid?
Does anyone know a workaround?

Thanks,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
