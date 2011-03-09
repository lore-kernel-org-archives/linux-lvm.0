Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p292xZ8p015098
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2011 21:59:35 -0500
Received: from account3.iohost.com (account3.iohost.com [72.44.90.34])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p292xNYW019958
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2011 21:59:23 -0500
Message-ID: <4D76ED00.1050305@simplicityhosting.com>
Date: Tue, 08 Mar 2011 18:59:12 -0800
From: Randy Katz <rkatz@simplicityhosting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] drive crash question
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

My main system drive crashed. The second drive (drive1) was pd0 with vg1 
and logical volumes
in operation. If I replace the drive0 will a vgscan and lvdisplay 
automatically "see" the volumes
on the drive or is there something that must be done first?

Thank you in advance,
Randy
