Received: from dhcp-lab-182.englab.brq.redhat.com
	(dhcp-lab-182.englab.brq.redhat.com [10.34.33.182])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mACEggPD015521
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 09:42:43 -0500
Message-ID: <491AEB62.1080704@redhat.com>
Date: Wed, 12 Nov 2008 15:42:42 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] minor gcc warnings for fixing
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi

Here is a short list of gcc warnings which should be probably fixed over the 
time to pass the c99 standards.

libdm-report.c:598: warning: pointer of type 'void *' used in arithmetic
mm/dbg_malloc.c:199: warning: pointer of type 'void *' used in arithmetic
mm/dbg_malloc.c:201: warning: pointer of type 'void *' used in arithmetic
mm/dbg_malloc.c:204: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:978: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:989: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:995: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1133: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1146: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1146: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1153: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1153: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1184: warning: pointer of type 'void *' used in arithmetic
ioctl/libdm-iface.c:1404: warning: pointer of type 'void *' used in arithmetic
activate/activate.c:385: warning: pointer of type 'void *' used in arithmetic
device/dev-io.c:109: warning: pointer of type 'void *' used in arithmetic
device/dev-io.c:208: warning: pointer of type 'void *' used in arithmetic
device/dev-io.c:215: warning: pointer of type 'void *' used in arithmetic
device/dev-io.c:584: warning: pointer of type 'void *' used in arithmetic
format_text/text_label.c:53: warning: pointer of type 'void *' used in arithmetic
format_text/text_label.c:208: warning: pointer of type 'void *' used in arithmetic
mm/memlock.c:63: warning: pointer of type 'void *' used in arithmetic
mm/memlock.c:63: warning: pointer of type 'void *' used in arithmetic
mm/memlock.c:67: warning: pointer of type 'void *' used in arithmetic
dmsetup.c:766: warning: pointer of type 'void *' used in arithmetic
dmsetup.c:1101: warning: pointer of type 'void *' used in arithmetic


Zdenek
