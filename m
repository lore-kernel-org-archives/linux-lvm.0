Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8NL4Zjh027225
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 17:04:35 -0400
Received: from mail.brunson.com (www.brunson.com [72.249.20.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8NL4N1S008904
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 17:04:23 -0400
Received: from [172.20.11.103] (unknown [12.109.229.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.brunson.com (Postfix) with ESMTP id 8E7C16C38F
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 15:04:22 -0600 (MDT)
Message-ID: <4ABA8D56.8060803@brunson.com>
Date: Wed, 23 Sep 2009 15:04:22 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot rollback
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I remember seeing somewhere discussion of adding the ability to roll 
back to a snapshot.  I think of how cool this would be about ever six 
months, usually coinciding with an impending Fedora release.  ;-)

I know it's possible to copy the snapshot to restore the data, but what 
would it take to simply "abandon" the modified blocks and revert the 
volume to the snapshot state?  Is it being worked on?  Can I help?

Thanks,
e.
