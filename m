Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r68G1V6s005930
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 12:01:31 -0400
Received: from mailserver (75-145-250-211-Connecticut.hfc.comcastbusiness.net
	[75.145.250.211])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r68G1TBt006048
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 12:01:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by mailserver (Postfix) with ESMTP id E44643F349
	for <linux-lvm@redhat.com>; Mon,  8 Jul 2013 12:05:49 -0400 (EDT)
Received: from mailserver ([127.0.0.1])
	by localhost (mail.mohawksoft.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxSWDC3BJvCS for <linux-lvm@redhat.com>;
	Mon,  8 Jul 2013 12:05:48 -0400 (EDT)
Received: from mail.mohawksoft.com (localhost [127.0.0.1])
	by mailserver (Postfix) with ESMTP id 834913B09B
	for <linux-lvm@redhat.com>; Mon,  8 Jul 2013 12:05:48 -0400 (EDT)
Message-ID: <731d217f00b6d8f6c16a75cbe167baed.squirrel@mail.mohawksoft.com>
Date: Mon, 8 Jul 2013 12:05:48 -0400
From: markw@mohawksoft.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshots of snapshots are not supported yet
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I'm trying to get a snapshot of a snapshot. I know the new thin
provisioning stuff supports this, but I'm not sure the release state is
something I can use at a customer.

Using LVM2, the snapshot format is tried and true, but inefficient if you
want to take multiple snapshots.

Looking at dmsetup, there doesn't seem like there would be an issue taking
a snapshot of a snapshot, but it is disabled in the tools.

I guess my question is this: Can it be done? Is there any reason why it
should not work?
