Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lA7JZbFu015532
	for <linux-lvm@redhat.com>; Wed, 7 Nov 2007 14:35:37 -0500
Received: from smtp2.powertech.no (smtp2.powertech.no [195.159.0.177])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lA7JZUV2024456
	for <linux-lvm@redhat.com>; Wed, 7 Nov 2007 14:35:30 -0500
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by smtp2.powertech.no (Postfix) with ESMTP id 95E24C0F80
	for <linux-lvm@redhat.com>; Wed,  7 Nov 2007 20:35:24 +0100 (CET)
Received: from localhost.localdomain (webmail1.start.no [195.159.73.31])
	by smtp1.powertech.no (Postfix) with ESMTP id 6AA6882F4
	for <linux-lvm@redhat.com>; Wed,  7 Nov 2007 20:35:24 +0100 (CET)
Content-Disposition: inline
MIME-Version: 1.0
From: Frode Mangset <frodemed@start.no>
Date: Wed, 07 Nov 2007 20:35:24 +0100
Message-Id: <62884.1194464124@start.no>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Regarding full snapshot
Reply-To: frodemed@start.no,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello.

I managed to fill up a snapshot which (obviously) rendered it invalid and I know this topic 
has been touched several times. However, it was mentioned (post quoted below) that it might be 
possbile to recover some ciritcal files out of the snapshot.

---8<---------
On Thu, 23 Aug 2007, Hans C. Kaspersetz wrote:
...
full.  I.e., you might be able to pull out a critical file if you had to, but
it is a mess, and you are usually better off just deleting the snapsnot.

P.S.  If you need to recover a critical file, unmount (or mount readonly) the
source LV immediately so it stops overwriting the snapshot.
...
---8<---------

Can someone give me some hints about this? After a reboot the device-mapper fails to read the 
snapshot metadata.

best regards,
frodem

-------------------------------------------------------------------------
F� din egen, gratis e-postadresse p� Start.no
