Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n279VJZr014390
	for <linux-lvm@redhat.com>; Sat, 7 Mar 2009 04:31:19 -0500
Received: from exodus.loho.co.uk (exodus.loho.co.uk [193.33.187.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n279Tx35005598
	for <linux-lvm@redhat.com>; Sat, 7 Mar 2009 04:29:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by exodus.loho.co.uk (Postfix) with ESMTP id 8E6E363D6C4
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2009 09:29:58 +0000 (GMT)
Received: from exodus.loho.co.uk ([127.0.0.1])
	by localhost (exodus.loho.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMr1PSTWtpz7 for <linux-lvm@redhat.com>;
	Sat,  7 Mar 2009 09:29:56 +0000 (GMT)
Received: from [192.168.169.2] (rb1.onefourone.loho [192.168.169.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alex.brett@loho.co.uk)
	by exodus.loho.co.uk (Postfix) with ESMTP id 01B856E8004
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2009 09:29:55 +0000 (GMT)
Message-ID: <49B23E93.6090004@alexbrett.net>
Date: Sat, 07 Mar 2009 09:29:55 +0000
From: Alex Brett <alex@alexbrett.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to enlarge a logical volume that is a virtual
	disk	of a virtual machine that uses lvm too?
References: <f9d0f9760903061911s6db14df3t1ac602afa411e7e1@mail.gmail.com>
In-Reply-To: <f9d0f9760903061911s6db14df3t1ac602afa411e7e1@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm not sure if you could do it online or not (I can't see any reason
why not, but there may be issues), but you should just be able to resize
the LV (lvresize) in dom0 (obviously make sure you enlarge it, not
shrink it), then do a pvresize in the VM to enlarge the PV to use all
the extra space.

Alex

Ricardo Funke Ormieres wrote:
> Hello,
> 
> I have a phisical machine with a xen vm installed and I'm using LVM in
> both. The Virtual Machine is using a LogVol (that belongs to the Dom0)
> as it's virtual hard disk.
> 
> It's possible to enlarge this LogVol in order to enlarge the vm's hard disk?
> 
> I know that I can just create another LogVol in the Dom0 and add it to
> the vm's PV, but I'm curious for that possible alternative.
> 
> Thanks in advance
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
