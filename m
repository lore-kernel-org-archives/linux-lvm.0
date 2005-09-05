Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j85KLfV19470
	for <linux-lvm@redhat.com>; Mon, 5 Sep 2005 16:21:41 -0400
Received: from mid-2.inet.it (mid-2.inet.it [213.92.5.19])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j85KLT4x023793
	for <linux-lvm@redhat.com>; Mon, 5 Sep 2005 16:21:35 -0400
Message-ID: <431C54A0.7090004@ngi.it>
Date: Mon, 05 Sep 2005 16:22:24 +0200
From: Bob Alexander <bob@ngi.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Please help with lvextend problems
References: <431C5034.6040604@ngi.it>
	<20050905201509.GA15141@agk.surrey.redhat.com>
In-Reply-To: <20050905201509.GA15141@agk.surrey.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> On Mon, Sep 05, 2005 at 04:03:32PM +0200, Bob Alexander wrote:
> 
>>Internal error: PV segments corrupted in vg1
> 
>  
> No - that's an assertion that triggers as the last thing
> *before* any metadata changes are made on disk.
> 
> First check you're using the latest lvm2 package.
> (Run 'lvm version')
> 
> Alasdair

Al,
thanks for trying to help.

Not sure I understand what you say (English is a bit exotic for me :->).

In any case here is what you request:

bob@t40:~$ sudo lvm version
   LVM version:     2.01.12 (2005-06-14)
   Library version: 1.01.03 (2005-06-13)
   Driver version:  4.4.0

FWIW I am using LVM2 on my customized Debian system with a 2.6.11 kernel 
(and need to resize my bloody /usr to go to 2.6.13 :-< ).

Take care,
Bob
