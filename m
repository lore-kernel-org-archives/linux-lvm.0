Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i52Eib027482
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 10:44:37 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i52Eiai5004958
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 10:44:36 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C719821@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Date: Wed, 2 Jun 2004 17:44:30 +0300 
MIME-Version: 1.0
Subject: [linux-lvm] LVM problem on MD devices
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

I create an MD multipath device, and then a PV on it. 
Pvdisplay on the device fails with 
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical
volume "/dev/md/2"

The md device is fine, I can also see there's an LVM signature on it.


I am using LVM 1.0.3

I saw similar posts in the past, but no answers, so I'm posting the question
again.

Dan
