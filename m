Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBM7t9in018501
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2014 02:55:09 -0500
Received: from alukardd.org (alukardd.org [188.134.93.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBM7t7gQ023166
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2014 02:55:08 -0500
Received: from alukardd.org ([172.17.0.101]:55535 helo=mail.alukardd.org)
	by alukardd.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84) (envelope-from <alukardd@alukardd.org>)
	id 1Y2xpY-000209-Mb
	for linux-lvm@redhat.com; Mon, 22 Dec 2014 10:55:04 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 22 Dec 2014 10:55:04 +0300
From: Alexey <alukardd@alukardd.org>
Message-ID: <9b5a3431cb59fb31b37bf9e944a186cd@alukardd.org>
Subject: [linux-lvm] Thin Pull LV suspended
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

Hello.

I need help in understanding why we got LV in suspended state.

  16073      vg4  Vwi-sotz--  80.00g tp4           9.20

In syslog we have this line:
   device-mapper: thin: Creation of new snapshot 106 of device 105 
failed.

This is host with VM under KVM. Accordingly to suspend state we have 
`qemu-system-x86` and `kworker` processes in "D"(uninterruptible sleep) 
state.

We resume to normal state by entering "lvchange -ay /dev/vg4/16073".
