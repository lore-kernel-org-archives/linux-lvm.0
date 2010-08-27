Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7RI6O7I023930
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 14:06:24 -0400
Received: from smtp.cbnco.com (smtp.cbnco.com [207.164.182.72])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7RI6DUQ020750
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 14:06:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 10356798D02
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 14:06:13 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07679-08 for <linux-lvm@redhat.com>;
	Fri, 27 Aug 2010 14:06:13 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C42FE798CD8
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 14:06:12 -0400 (EDT)
Message-ID: <4C77FE94.5090905@cbnco.com>
Date: Fri, 27 Aug 2010 14:06:12 -0400
From: Michael Smith <msmith@cbnco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] CLVM and LV activation
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

Hi,

When a CLVM cluster comes up, the LVs in the clustered volume groups are 
"not available". I can use the heartbeat LVM resource to trigger a 
"vgchange -aly", but I'm wondering if there's a way to configure it to 
happen automatically. It'd make my cluster config simpler.

I'm not positive, but I guess the volume_list directive in lvm.conf 
might be able to do it. Is there a way to tell it to activate all LVs on 
all VGs, or do I have to list the VGs by name?

Thanks,
Mike
