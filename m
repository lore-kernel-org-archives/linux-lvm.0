Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4D9Vh328231
	for <linux-lvm@redhat.com>; Thu, 13 May 2004 05:31:43 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4D9VfAX010727
	for <linux-lvm@redhat.com>; Thu, 13 May 2004 05:31:42 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C7197B7@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Date: Thu, 13 May 2004 12:31:35 +0300
MIME-Version: 1.0
Subject: [linux-lvm] problem with disks on different major device
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

I have a problem with LVM 1.03. 
It fails to pv_create_name_from_kdev_t with devices that use a major number
different from the first one.
My disks are mapped to major 8, then to major 65 66 etc as can be seen in
/proc/devices:

Block devices:
  1 ramdisk
  7 loop
  8 sd
 31 mtdblock
 58 lvm
 65 sd
 66 sd
 67 sd

LVM won't work with the disks on the majors 65 and on.

I'm using devfs, I have no idea if that matters.
Maybe someone knows if this issue is fixable, if it was fixed, or how to
work around it.

Thanks,
Dan
