Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9GA67r26530
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 06:06:07 -0400
Received: from sphinx.mythic-beasts.com (sphinx.mythic-beasts.com
	[212.69.37.6])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9GA5wec017258
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 06:05:58 -0400
Received: from pdw by sphinx.mythic-beasts.com with local (Exim 4.34)
	id 1CIlRb-0003wZ-OA
	for linux-lvm@redhat.com; Sat, 16 Oct 2004 11:05:47 +0100
Date: Sat, 16 Oct 2004 11:05:47 +0100
From: Paul Warren <pdw@ex-parrot.com>
Message-ID: <20041016110547.Q27758@sphinx.mythic-beasts.com>
Mime-Version: 1.0
Content-Disposition: inline
Sender: Paul Warren <pdw@sphinx.mythic-beasts.com>
Subject: [linux-lvm] "Cannot allocate memory" creating VGDA
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
To: linux-lvm@redhat.com

We've now downgraded our server to 2.4 so that we can use snapshotting
in lvm1.  Unfortunately:

woozle:~# lvcreate -s -L3000M -n rootsnapshot  /dev/mainvg/root 

lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/mainvg/rootsnapshot"
lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
"/dev/mainvg/rootsnapshot" in kernel

woozle:~# free
             total       used       free     shared    buffers cached
Mem:       4010688     149192    3861496          0       1824 22944
-/+ buffers/cache:     124424    3886264
Swap:            0          0          0

This is trying to create a snapshot of a 255GB LV.

Any ideas on this one?

cheers,

Paul
