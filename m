Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n13KDlLC003615
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 15:13:47 -0500
Received: from proxmox.maurer-it.com (www.maurer-it.com [213.129.239.114])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n13KDf9n010454
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 15:13:41 -0500
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 02283397811A
	for <linux-lvm@redhat.com>; Tue,  3 Feb 2009 21:13:41 +0100 (CET)
Received: from clara.maurer-it.com (clara.maurer-it.com [192.168.2.101])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id DF7373978112
	for <linux-lvm@redhat.com>; Tue,  3 Feb 2009 21:13:40 +0100 (CET)
MIME-Version: 1.0
Content-class: urn:content-classes:message
Date: Tue, 3 Feb 2009 21:13:35 +0100
Message-ID: <7B7881568CF40E4388B615CD06F87B98098A01@clara.maurer-it.com>
From: "Dietmar Maurer" <dietmar@proxmox.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] dm-loop and snapshots
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

Hi all,

is it possible to make a snapshot of a dm-loop device?

- Dietmar
