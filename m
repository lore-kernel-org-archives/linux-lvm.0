Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2385cK07411
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 03:05:38 -0500
Received: from Datawav.net ([63.228.244.4])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2385a4I012660
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 03:05:37 -0500
Message-ID: <4226C549.6060803@theserrs.net>
Date: Thu, 03 Mar 2005 01:05:29 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount logical volume - super block error
References: <e5146c2a050302230579216b77@mail.gmail.com>
In-Reply-To: <e5146c2a050302230579216b77@mail.gmail.com>
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
To: Sasha Z <kleptophobiac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Sasha Z wrote:

>I had a functioning lvm using four hard discs, but found it necessary
>to rebuild my operating system. Since then, while the vg and lv come
>online are read available, I can't actually mount the filesystem or do
>anything with it. It says it cannot read the superblock at locations 2
>and 16.
>
>does anybody have any thoughts on this?
>  
>
I'm not sure what you mean by "the vg and lv come online are read 
available..."  Have you tried:
pvscan
pvdisplay [-v]
lvdisplay [-v]

All looks good? 

Are you sure you have your file system turned on in your kernel?  How 
about explicitly mounting it with "-t"?

I probably can't help other than have you describe more for the gurus.

>I've tried 2.00.25 and 2.00.33.
>  
>
I just went from kernel 2.4.27 with lvm 2.00.25 to 2.6.10 with 2.00.33, 
it worked ok for me, just to give you a data point.
