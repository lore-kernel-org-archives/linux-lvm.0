Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7DKsWAg023449
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 16:54:32 -0400
Received: from santino.mail.tiscali.it (santino.mail.tiscali.it
	[213.205.33.245])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7DKsTXI026009
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 16:54:30 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by spambox.assyoma.it (Postfix) with ESMTP id 3A449B60
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 22:54:27 +0200 (CEST)
Received: from spambox.assyoma.it ([127.0.0.1])
	by localhost (spambox.assyoma.it [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2uX4xdeQMUCA for <linux-lvm@redhat.com>;
	Tue, 13 Aug 2013 22:54:26 +0200 (CEST)
Received: from ceres.assyoma.it (mail.assyoma.it [1.1.8.246])
	by spambox.assyoma.it (Postfix) with ESMTP id 0EA2DB53
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2013 22:54:26 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Aug 2013 22:54:25 +0200
From: g.danti@assyoma.it
Message-ID: <c1bc88e1fd063ea0cdebb12ada3d673f@assyoma.it>
Subject: [linux-lvm] Discard of Volume Group free space
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
I have a question about discard (trim) feature and LVM2.

I wonder if there is a method to issue a discard (trim) operation on 
all free space inside a Volume Group (ie: in space not allocated to any 
LV).

My current understanding is that I can accomplish this by enabling the 
"issue_discard" parameter and then creating/removing a logical volume 
inside the target VG. Is this right? It can be accomplished in a simpler 
manner?

Regards.
