Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA1H5Xr10461
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 12:05:33 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA1H5LhR029506
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 12:05:32 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1COfcE-0004X7-00
	for <linux-lvm@redhat.com>; Mon, 01 Nov 2004 18:05:10 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 01 Nov 2004 18:05:10 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 01 Nov 2004 18:05:10 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Mon, 1 Nov 2004 18:02:30 +0100
Message-ID: <6q6i52-nl6.ln1@triangulo.it.uc3m.es>
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
	<41814060.4040400@mikebabcock.ca> <41851771.4060203@markus.org>
	<41865881.6060107@mikebabcock.ca>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Software raid on top of lvm logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Michael T. Babcock <mike@mikebabcock.ca> wrote:
> And how exactly does that allow me to easily change how much RAID-0 or 
> RAID-5 storage I have?

It doesn't. 

> 
> If I need more RAID-5 storage and I want to steal it from RAID-0 space, 
> I need to dissassemble LVM, then software RAID, then repartition, then 
> rebuild RAID, then restore LVM.

You have to anyway. You can't change the size of a raid on the fly.

Peter
