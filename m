Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p14EC3ge031813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2011 09:12:04 -0500
Message-ID: <4D4C0933.80107@redhat.com>
Date: Fri, 04 Feb 2011 14:12:03 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2: zeroing free space
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Folks,

Recently had a query from someone using an array supporting thin provisioning
with zero page reclaim[1].

They wanted a method to write zeros to all the unallocated space in a VG to
trigger a reclaim of unused regions in the VG's PVs.

My suggestion was to lvcreate a -l100%FREE LV named "filler" and overwrite it
from /dev/zero.

It seems like this might something a lot of users want as this functionality
gets to be more common.

I wondered if it could be worth adding a script to automate this or even an
option to vgchange (e.g. --zero-free-space)?

Didn't have time to try putting anything together yet but it seems such a
feature could be useful.

Regards,
Bryn.

[1] http://blogs.hds.com/hu/2009/03/zero-page-reclaim.html
