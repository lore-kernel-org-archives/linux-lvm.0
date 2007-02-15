Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1FI53Im009351
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 13:05:03 -0500
Received: from mail2.lefthandnetworks.com (mail2.lefthandnetworks.com
	[63.251.177.227])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1FI4xkE007431
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 13:05:00 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 15 Feb 2007 11:04:52 -0700
Message-ID: <44E94AC31873BC43A74D040A9C113522971A4B@SOLVISTA.corp.lefthandnetworks.com>
From: "Brian Auld" <Brian.Auld@lefthandnetworks.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Linux LVM and iSCSI
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

Can you please respond directly to my email address as I do not
subscribe to the LVM mailing list.

Is there an understood way to deal with LVM volumes with iscsi disks
discovered through the native iscsi intiator?  LVM startup takes place
in rc.sysinit prior to networking being up, and thus the iscsi
initiator.  I found that I needed to run vgscan and vgchange by hand
after booting for these volumes to persist.  

Do admins typically do their own customization to achieve something
similar, or is there a way to achieve this through some configuration
file?

Regards,
Brian Auld
