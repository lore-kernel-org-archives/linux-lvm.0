Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9OHUP4t024235
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 13:30:25 -0400
Received: from ibsr002.ib.pl (ibsr002.ib.pl [164.40.241.6])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9OHUMYO030353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 13:30:23 -0400
Message-ID: <544A8CA4.2030506@ib.pl>
Date: Fri, 24 Oct 2014 19:30:12 +0200
From: IB Development Team <dev@ib.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Virtualization and LVM data security
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

Hello,

Is there any way to make LVM2 tools wipe added/freed LV space or plans to add such functionality?

When LVM based storage is used for guest virtual disks, it is possible that after 
resizing/snapshoting LV, disk data fragments from one guest will be visible to other guest, which 
may cause serious security problems if not wiped somehow; some pages with more info in this topic:

http://blog.brightbox.co.uk/posts/secure-virtual-disk-deletion-is-your-data-safe
http://brightbox.com/blog/2012/04/27/dirty-disks/
http://docs.openstack.org/security-guide/content/ch046_data-residency.html

Don't know LVM2 internals well but if there is no such functionality in LVM2 now, maybe adding 
options like --wipe and --wipe-bandwidth (to allow one to control I/O load while wiping) for 
create/resize/remove/snapshot commands (and other maybe if such risk exist there) will be possible 
in future LVM versions to better meet security requirements in virtualized environments?

Regards,
Pawel

IB Development Team
http://dev.ib.pl/
