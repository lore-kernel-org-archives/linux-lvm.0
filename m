Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CBD62B5B8
	for <linux-lvm@redhat.com>; Thu, 22 Nov 2018 18:05:18 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A84210DE3
	for <linux-lvm@redhat.com>; Thu, 22 Nov 2018 18:05:16 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	wAMI5Eq6024277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 22 Nov 2018 19:05:14 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 22 Nov 2018 19:05:14 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
Message-ID: <c04c4a5930e3a676d3a1f2a667385b16@cs.uni-dortmund.de>
Subject: [linux-lvm] lvm_vg_create_lv_linear() returns error though device
	was created
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

Hello,

I am now trying to not call external LVM commands, but to use LVM 
library calls instead. Now I have another problem:


lvm_vg_create_lv_linear(vg, pam_user, LVSIZE) returns NULL, what means 
an error. Normally I would think that I made a mistake, but when I 
manually call lvdisplay, I can see the LV and I can activate it with 
lvchange. How can it happen that lvm_vg_create_lv_linear() returns NULL 
though the LV was created?

And a minor problem: The LVM library logs with syslog(), but I use my 
own syslog() calls in my program and as soon as lvm_init() has been 
called, both the identifier and the log facility change, so that logs go 
to another file. Can I somehow disable that?

Regards
   Christoph
