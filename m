Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAEDpFV12163
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 08:51:15 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAEDp4k4016078
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 08:51:09 -0500
Received: by xproxy.gmail.com with SMTP id r21so2364896wxc
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 05:50:59 -0800 (PST)
Message-ID: <64c763540511140550t4de2bbc8scdc58e4d38717a15@mail.gmail.com>
Date: Mon, 14 Nov 2005 19:20:59 +0530
From: Block Device <blockdevice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Standard Linux Framework for Snapshot Notification
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
To: linux-lvm@redhat.com

Hi,

  I  want to know whether Linux provides any standard interface for
volume managers etc so that applications can register themselves to be
notified when a snapshot needs to be taken.
Something similar to VSS on Windows.

If there isnt any such interface how is consistency guaranteed for
application data when a snapshot is taken ? eg. How does one take
(consistent) snapshots of database instances w/o  first quiescing them
?

If this not the right place to ask this, can someone point me in the
right direction ?

Thanks & Regards
BD.
