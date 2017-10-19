Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E445C550
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 19:09:33 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99D1E1E328
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 19:09:30 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id D58265FBD0
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 15:09:24 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23016.63588.505141.142275@quad.stoffel.home>
Date: Thu, 19 Oct 2017 15:09:24 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Oleg> Recently I have decided to try out LVM cache feature on one of
Oleg> our Dell NX3100 servers running CentOS 7.4.1708 with 110Tb disk
Oleg> array (hardware RAID5 with H710 and H830 Dell adapters).  Two
Oleg> SSD disks each 256Gb are in hardware RAID1 using H710 adapter
Oleg> with primary and extended partitions so I decided to make ~240Gb
Oleg> LVM cache to see if system I/O may be improved.  The server is
Oleg> running Bareos storage daemon and beside sshd and Dell
Oleg> OpenManage monitoring does not have any other services.
Oleg> Unfortunately testing went not as I expected nonetheless at the
Oleg> end system is up and running with no data corrupted.

Can you give more details about the system.  Is this providing storage
services (NFS) or is it just a backup server?

How did you setup your LVM config and your cache config?  Did you
mirror the two SSDs using MD, then add the device into your VG and use
that to setup the lvcache?

I ask because I'm running lvcache at home on my main file/kvm server
and I've never seen this problem.  But!  I suspect you're running a
much older kernel, lvm config, etc.  Please post the full details of
your system if you can. 

Oleg> Initially I have tried the default writethrough mode and after
Oleg> running dd reading test with 250Gb file got system unresponsive
Oleg> for roughly 15min with cache allocation around 50%.  Writing to
Oleg> disks it seems speed up the system however marginally, so around
Oleg> 10% on my tests and I did manage to pull more than 32Tb via
Oleg> backup from different hosts and once system became unresponsive
Oleg> to ssh and icmp requests however for a very short time.

Can you run 'top' or 'vmstat -admt 10' on the console while you're
running your tests to see what the system does?  How does memory look
on this system when you're NOT runnig lvcache?

Do you have any swap space configured on the system?  It might make
sense to allocate 10-20gb of swap space.  

Oleg> I though it may be something with cache mode so switched to writeback 
Oleg> via lvconvert and run dd reading test again with 250Gb file however that 
Oleg> time everything went completely unexpected.  System started to slow 
Oleg> responding for simple user interactions like list files and run top. And 
Oleg> then became completely unresponsive for about half an hours.  Switching 
Oleg> to main console via iLO I saw a lot of OOM messages and kernel tried to 
Oleg> survive therefore randomly killed almost all processes.  Eventually I 
Oleg> did manage to reboot and immediately uncached the array.

Oleg> My question is about very strange behavior of LVM cache.  Well, I may 
Oleg> expect no performance boost or even I/O degradation however I do not 
Oleg> expect run out of memory and than OOM kicks in.  That server has only 
Oleg> 12Gb RAM however it does run only sshd, bareos SD daemon and OpenManange 
Oleg> java based monitoring system so no RAM problems were notices for last 
Oleg> few years running with our LVM cache.

Oleg> Any ideas what may be wrong?  I have second NX3200 server with similar 
Oleg> hardware setup and it would be switch to FreeBSD 11.1 with ZFS very time 
Oleg> soon however I may try to install CentOS 7.4 first and see if the 
Oleg> problem may be reproduced.

Oleg> LVM2 installed is version lvm2-2.02.171-8.el7.x86_64.


Oleg> Thank you!
Oleg> Oleg

Oleg> _______________________________________________
Oleg> linux-lvm mailing list
Oleg> linux-lvm@redhat.com
Oleg> https://www.redhat.com/mailman/listinfo/linux-lvm
Oleg> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
