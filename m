Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IJPI6Z025762
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:25:18 -0400
Received: from ns3.lanforge.com (mail.candelatech.com [208.74.158.172])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8IJP4Aq030120
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:25:04 -0400
Received: from [192.168.100.195] (firewall.candelatech.com [70.89.124.249])
	(authenticated bits=0)
	by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id n8IJP28E013491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 12:25:03 -0700
Message-ID: <4AB3DE8E.9080301@candelatech.com>
Date: Fri, 18 Sep 2009 12:25:02 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question on compatibility with 2.6.31 kernel.
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
To: linux-lvm@redhat.com

Hello!

I recently tried to boot 2.6.31 on Fedora 8, and it couldn't
find the volume groups.  The same kernel works fine on F11.

Someone on LKML said they had similar problems on an old Debian Etch
system and to fix it they installed a new version of lvm2 and put
that in the initrd.

I am trying to package a general purpose 2.6.31, and part of the install
logic is to run mkinitrd on the end-user's system, so it will be a big
pain to also require users to install a non-standard lvm for their
platform.

So, does anyone have any ideas about what incompatibily I might be hitting,
and perhaps have some ideas on how to fix it in the kernel so that new
kernels will boot with older lvm installs?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com
