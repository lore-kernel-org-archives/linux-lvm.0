Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3F2uKaI032415
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 22:56:20 -0400
Received: from pretender.frop.net (pretender.frop.net [70.85.16.90])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3F2uA96000559
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 22:56:10 -0400
Date: Mon, 14 Apr 2008 22:56:10 -0400
From: dave@frop.net
Message-ID: <20080415025610.GB8011@pretender.frop.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Increase LV size of snapshot (not COW table size)
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I want to use LVM snapshots as CoW filesystems for virtual machines.

Is it possible to increase the apparent size of the snapshot LV without increasing the COW table size?

Basically I want to have a minimally sized filesystem on a lv which I snapshot for each virtual machine.  I don't want to be restricted to having all the snapshots only be the size of the source lv.  I want to increase the LV size of the snapshots at will and then resize the underlying filesystems to fill it out (sparsely within the COW table of course).

It seems that lvresize only increases the cow table size for snapshots, am I correct that LVM can't do what I want? 

thanks alot!
