Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7SLYX324852
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 17:34:33 -0400
Received: from grassmarket.ucs.ed.ac.uk (grassmarket.ucs.ed.ac.uk
	[129.215.166.64])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7SLYQ93025937
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 17:34:26 -0400
Received: from grassmarket.ucs.ed.ac.uk (localhost [127.0.0.1])
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.10) with ESMTP id
	i7SLYPcn016233
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 22:34:25 +0100 (BST)
Received: (from nobody@localhost)
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.9/Submit) id i7SLYPAH016231
	for linux-lvm@redhat.com; Sat, 28 Aug 2004 22:34:25 +0100 (BST)
Message-ID: <1093728865.4130fa61689cf@sms.ed.ac.uk>
Date: Sat, 28 Aug 2004 22:34:25 +0100
From: Rupert Hair <rupert.hair@ntlworld.com>
Subject: Re: [linux-lvm] pvmove wont work
References: <4130F495.90806@home.se>
In-Reply-To: <4130F495.90806@home.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Quoting Andreas Dahlgren <andreas.dahlgren@home.se>:

> Just upgraded to 2.6.8.1 and got much less errors but pvmove still wont
> work.
> # pvmove -t /dev/hdc
>   Test mode: Metadata will NOT be updated.
>   mirror: Required device-mapper target(s) not detected in your kernel
>
> anyone knows why this wont work?
Hi Andreas,

I think I posted exactly the same quiestion to the list some time ago.  The
answer is that you need the Device Mapper Mirror Target compiled into (or as a
module in) your kernel.  You will need to get the "unstable" patches from the
following URL:

http://sources.redhat.com/dm/patches.html

Feel free to mail me if you need any more info on this.

Rupert
