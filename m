Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3UNXvjt025031
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 19:33:57 -0400
Received: from eastrmmtao107.cox.net (eastrmmtao107.cox.net [68.230.240.59])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3UNXf2U014531
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 19:33:41 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090430233342.CGZZ29053.eastrmmtao107.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Thu, 30 Apr 2009 19:33:42 -0400
Message-ID: <49FA355A.3060408@cox.net>
Date: Thu, 30 Apr 2009 19:33:46 -0400
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Random file system errors
References: <200904290352.XAA08424@out-of-band.media.mit.edu>
In-Reply-To: <200904290352.XAA08424@out-of-band.media.mit.edu>
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

On 04/28/2009 11:52 PM, f-lvm@media.mit.edu wrote:
> Btw, one way to proceed on the test-your-hardware angle without
> yanking disks (or even opening the case) and possibly turning this
> into a heisenbug if it really -is- something like cabling would be
> to do something like this:
>
>     dd if=/dev/hda bs=1M count=1000 | md5sum
>
> <snip>
>
> And report back; it'd be good to close the loop on this if it's proven
> -not- to be an LVM issue.
>
>    

Frequent mismatched sha1sums on /dev/sdf which has the PV for the 
problem LV.  All other /dev/sd* ran clean.

Thanks for the valuable debugging method.  Looks like a SIL 680 card, or 
cable, or Seagate drive problem, but will be easy to isolate.
