Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2E97nOb032758
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 05:07:49 -0400
Received: from proxmox.maurer-it.com (www.maurer-it.com [213.129.239.114])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2E97amO004871
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 05:07:37 -0400
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 48CC23978162
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 10:07:33 +0100 (CET)
Received: from clara.maurer-it.com (clara.maurer-it.com [192.168.2.101])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 2B9DF397814E
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 10:07:33 +0100 (CET)
Subject: RE: [linux-lvm] fsync() and LVM
MIME-Version: 1.0
Date: Sat, 14 Mar 2009 10:07:31 +0100
Content-class: urn:content-classes:message
Message-ID: <7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
In-Reply-To: <20090313203812.GK7445@agk.fab.redhat.com>
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
From: "Dietmar Maurer" <dietmar@proxmox.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> Let's try to clear up the confusion.
> 
> Kernel device-mapper (which lvm uses) does not support write barriers
> except in very restricted circumstances (when only one device is
> involved and the mapping is trivial).  If dm receives a write barrier
> which is not supported it notifies the caller (typically a filesystem)
> so appropriate action can be taken if it wishes.

Does that mean I should never use more than one device if I have
applications depending on fsync (databases)?

- Dietmar
