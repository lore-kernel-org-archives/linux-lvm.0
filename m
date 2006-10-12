Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CJs05Z008853
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 15:54:00 -0400
Received: from mail.cs.drexel.edu (cheshire.cs.drexel.edu [129.25.6.194])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CJrvnJ021329
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 15:53:59 -0400
Received: from [129.25.6.204] (mockturtle.cs.drexel.edu [129.25.6.204])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.drexel.edu (Postfix) with ESMTP id 90BF920216C2
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 15:53:47 -0400 (EDT)
Message-ID: <452E9D4B.8020104@cs.drexel.edu>
Date: Thu, 12 Oct 2006 15:53:47 -0400
From: Gaylord Holder <gholder@cs.drexel.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to force lvm2 to remove volume group?
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

I created a volume group on a disk which was hot removed.

How can remove the volume group without replacing the drive or rebooting
my machine?

I've tried vgreduce --removemissing without any luck.

Thanks,
-Gaylord
