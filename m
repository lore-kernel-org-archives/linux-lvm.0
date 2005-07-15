Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6FK7EV29446
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:07:14 -0400
Received: from ahmler3.mail.eds.com (ahmler3.mail.eds.com [192.85.154.74])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6FK79Q5001497
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:07:10 -0400
Received: from ahmlir3.mail.eds.com (ahmlir3-2.mail.eds.com [192.85.154.133])
	by ahmler3.mail.eds.com (8.13.4/8.12.10) with ESMTP id j6FK72Th010239
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:07:02 -0400
Received: from ahmlir3.mail.eds.com (localhost [127.0.0.1])
	by ahmlir3.mail.eds.com (8.13.4/8.12.10) with ESMTP id j6FK6cBV023002
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:06:38 -0400
Received: from USAHM013.amer.corp.eds.com ([130.175.214.154])
	by ahmlir3.mail.eds.com (8.13.4/8.12.10) with ESMTP id j6FK6ctN022997
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:06:38 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvm and reducing vols/ext3
Date: Fri, 15 Jul 2005 16:06:37 -0400
Message-ID: <5A14AF34CFF8AD44A44891F7C9FF4105046D643A@usahm236.amer.corp.eds.com>
From: "Post, Mark K" <mark.post@eds.com>
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

I've always recommended not having the root file system on a logical
volume.  For reasons other than this, but my advice still stands.


Mark Post

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Philip Rhoades
Sent: Friday, July 15, 2005 4:02 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] lvm and reducing vols/ext3


People,

I have looked around at the docs and googled and it seems if I want to  
reduce a root vol/partition I have to:

- boot on an emergency CD

- resize the root ext3 partition

- reduce the lv

Isn't this process just making the exercise more complicated than it  
would have been if I didn't have LVs?

Thanks,

Phil.
