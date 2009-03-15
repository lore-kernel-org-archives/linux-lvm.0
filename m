Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2F8pG3d029134
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 04:51:16 -0400
Received: from proxmox.maurer-it.com (www.maurer-it.com [213.129.239.114])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2F8p3uh023044
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 04:51:03 -0400
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 19F053978165
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 09:51:03 +0100 (CET)
Received: from clara.maurer-it.com (clara.maurer-it.com [192.168.2.101])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id EBC5B3978163
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 09:51:02 +0100 (CET)
Subject: RE: [linux-lvm] fsync() and LVM
MIME-Version: 1.0
Date: Sun, 15 Mar 2009 09:51:02 +0100
Content-class: urn:content-classes:message
Message-ID: <7B7881568CF40E4388B615CD06F87B98098BDD@clara.maurer-it.com>
In-Reply-To: <Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com><20090313203812.GK7445@agk.fab.redhat.com><7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
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

> > Does that mean I should never use more than one device if I have
> > applications depending on fsync (databases)?
> 
> It just means that write barriers won't get passed to the device.
> This is only a problem if the devices have write caches.

But fsync is implemented using 'write barriers' - so fsync does not
work?

After fsync, all data should be sent from the OS to the disk controller:

a.) this work perfectly using LVM?

b.) this does not work at all using LVM?

c.) it works when you use one single physical drive with LVM?

I am confused. The thread on the postfix list claims that it does not
work at
all?

- Dietmar
