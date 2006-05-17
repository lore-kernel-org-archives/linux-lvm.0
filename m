Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HGs5on023590
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:54:05 -0400
Received: from mta10.adelphia.net (mta10.adelphia.net [68.168.78.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HGs04S004196
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:54:00 -0400
Received: from web28 ([68.168.75.72]) by mta10.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20060517165352.XBAR27996.mta10.adelphia.net@web28>
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:53:52 -0400
Message-ID: <5972158.1147884832350.JavaMail.root@web28>
Date: Wed, 17 May 2006 12:53:52 -0400
From: tkb9@adelphia.net
Subject: RE: [linux-lvm] Problem doing basic LVM functions
MIME-Version: 1.0
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

---- Ricardo Sanchez <sanchez.ricardo@gmail.com> wrote: 
> Toby
> 
> Thanks for the reply. I am not using nbd nodes...the kernel started throwing
> out those messages I have never worked with nbd nodes. How can I destroy the
> nbd nodes? I just want to start all over again but can't. Every time I try
> to do lvm functions, it hangs on those messages.
> 

Try editing the filters in the devices section of your lvm.conf so lvm will only try to use the disks you want. Valid for lvm version 2 only. 

I use lvm on many systems ( all RH or RH clones ) and the only system that had your same problem is the one on which I played with nbd. 


-Toby
