Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7DL0v69020204
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 17:00:57 -0400
Received: from santino.mail.tiscali.it (santino.mail.tiscali.it
	[213.205.33.245])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7DL0td3028825
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 17:00:56 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by spambox.assyoma.it (Postfix) with ESMTP id 1DCB8B60
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 23:00:55 +0200 (CEST)
Received: from spambox.assyoma.it ([127.0.0.1])
	by localhost (spambox.assyoma.it [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eR-5aPT2bY0T for <linux-lvm@redhat.com>;
	Tue, 13 Aug 2013 23:00:54 +0200 (CEST)
Received: from ceres.assyoma.it (mail.assyoma.it [1.1.8.246])
	by spambox.assyoma.it (Postfix) with ESMTP id 07DA4B53
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 23:00:54 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Aug 2013 23:00:53 +0200
From: g.danti@assyoma.it
Message-ID: <6dc995dfc593a1d581b7db5c19fb11ea@assyoma.it>
Subject: [linux-lvm] Retrieve changed block with snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,
I'm using LVM2 as VM backend and I am very happy with the result.

One thing that I feel useful but that I can't figure how to get working 
is to use snapshots to obtain the list of changed block after the 
snapshot was taken.

To be more clear:
- immagine to have a LV called "LV1"
- take a snapshot of "LV1" and name it "SNAP1"
- now "SNAP1" has a point-in-time image of "LV1", and by reading from 
it I can go "back in time" to when I issued the snapshot
- but how I can get the list of only the changed block between "LV1" 
and "SNAP1"?

Its my understanding that some Ruby/Python scripts can read the COW 
table and retrieve the list of the changed block, however I am not so 
inclined to use them on production server. So, we have a method _inside_ 
the current LVM tools that enable us to retrieve the changed block list?

Regards.
