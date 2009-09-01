Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n81NRqvU009894
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 19:27:52 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n81NRf3m019135
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 19:27:42 -0400
Received: by wa-out-1112.google.com with SMTP id k34so62439wah.19
	for <linux-lvm@redhat.com>; Tue, 01 Sep 2009 16:27:41 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 1 Sep 2009 17:27:41 -0600
Message-ID: <f3177b9e0909011627kfc0b7c1t2a1ab35d217b522e@mail.gmail.com>
From: Chris Worley <worleys@gmail.com>
Subject: [linux-lvm] Does LVM have any multipath failover capabilities?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

For example, two iSCSI drives are actually the same drive provided via
two different subnets: if one of the drives becomes unresponsive, I
need LVM to seamlessly failover to the other one.

Otherwise, what's the right way to handle this?

Thanks,

Chris
