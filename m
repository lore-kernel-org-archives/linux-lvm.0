Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3GExnjP011676
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 10:59:49 -0400
Received: from septimus.inrp.fr (septimus.inrp.fr [193.51.247.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3GExacL032750
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 10:59:36 -0400
Received: from septimus.inrp.fr (septimus.inrp.fr [127.0.0.1])
	by localhost.septimus.inrp.fr (Postfix) with ESMTP id 83EF0E322A
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 16:59:35 +0200 (CEST)
Received: from valerian.inrp.fr (valerian.inrp.fr [195.83.134.122])
	by septimus.inrp.fr (Postfix) with ESMTP id 7659BE31D6
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 16:59:35 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by valerian.inrp.fr (Postfix) with ESMTP id 646902BEAD
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 16:59:35 +0200 (CEST)
Received: from valerian.inrp.fr ([127.0.0.1])
	by localhost (valerian [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 20446-10 for <linux-lvm@redhat.com>;
	Wed, 16 Apr 2008 16:59:31 +0200 (CEST)
Received: from [195.83.134.19] (SCI004.inrp.fr [195.83.134.19])
	by valerian.inrp.fr (Postfix) with ESMTP id 7460C2C0E4
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 16:59:31 +0200 (CEST)
Message-ID: <48061439.6040001@gmail.com>
Date: Wed, 16 Apr 2008 16:59:05 +0200
From: Thomas Bellembois <thomas.bellembois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM snapshot - "dd" file size
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

Hi!

I am using LVM partitions on a Debian Xen system.
I use LVM snapshots to clone and backup my virtual machines.

I have noticed that the ISO file created with the "dd" command it much
bigger that the partition used space (actually 4.7GB for the ISO - 500MB
used space). No problem if I mount the LVM snapshot and "tar" all of the
data.

I have googled the question and read that "dd" also copy "not used space".
Why is the ISO file so big ? Is the "tar" method less safe ?
Is there a better solution ?

Thanks for your answers.

Regards,

Thomas
