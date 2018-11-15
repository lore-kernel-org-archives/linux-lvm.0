Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBB66013F
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2018 16:40:00 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD489307D856
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2018 16:39:57 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	wAFGduPk028895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2018 17:39:56 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 15 Nov 2018 17:39:56 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
Message-ID: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
Subject: [linux-lvm] lvcreate from a setuid-root binary
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

I am calling lvcreate from a setuid-binary, which internally calls 
setreuid(), so that not only effective and saved UIDs, but also the real 
UID is set to 0. From _nonroot_warning() in lvmcmdline.c I see that LVM 
command line tools expect that.

Unfortunately - though these UIDs are all set to 0 - lvcreate still does 
not work for me. That is, it does work when I call my setuid-binary as a 
non-root user from the command line, but it does not work when I call my 
setuid-binary from PAM module pam_exec - and that is what I need my 
program for. I let my program send lvcreate output to a file and that 
file has the following content:

  device-mapper: version ioctl on  failed: Permission denied
   Incompatible libdevmapper 1.02.137 (2016-11-30) and kernel driver 
(unknown version).
   striped: Required device-mapper target(s) not detected in your kernel.
   Run `lvcreate --help' for more information.

What might be the problem here so that lvcreate gives these errors 
though all UIDs are 0?

Regards
   Christoph
