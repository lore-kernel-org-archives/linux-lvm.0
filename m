Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j37MeoO22647
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2005 18:40:50 -0400
Received: from server.pokotv.com (h64-5-222-28.gtcust.grouptelecom.net
	[64.5.222.28])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j37Mei9k013412
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2005 18:40:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by server.pokotv.com (Postfix) with ESMTP id CD72750F80
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2005 19:40:38 -0300 (ADT)
Received: from server.pokotv.com ([127.0.0.1])
	by localhost (server [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 11933-04 for <linux-lvm@redhat.com>;
	Thu,  7 Apr 2005 19:40:37 -0300 (ADT)
Received: from [192.168.1.99] (unknown [192.168.1.1])
	by server.pokotv.com (Postfix) with ESMTP id 3CDE250F76
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2005 19:40:37 -0300 (ADT)
Message-ID: <4255B6E4.7080707@halifaxfilm.com>
Date: Thu, 07 Apr 2005 19:40:36 -0300
From: "Troy D. Strum" <ts@halifaxfilm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Over-Allocated PE - LVM1
References: <4255ABE4.5090509@halifaxfilm.com>
In-Reply-To: <4255ABE4.5090509@halifaxfilm.com>
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

Please disregard. I'll flog myself on the way out. Stupid mistake.

- Troy


Troy D. Strum wrote:

> Hi folks,
>
> I'm hoping someone can help me help myself with this problem.
>
> Description:
>
> Running out of space on my volume group ("discpool"), I bought and 
> installed a new drive.
>
> Then came this error, which I can't find any info on, is as follows:
>
> vgscan -- ERROR "pv_check_consistency(): allocated PE" volume group 
> "discpool" is inconsistent
>
> The only thing I can find out of the ordinary is this:
>
> > pvdata /dev/hde
> --- Physical volume ---
> PV Name               /dev/hde
> VG Name               discpool
> PV Size               111.79 GB [234441648 secs] / NOT usable 32.19 MB 
> [LVM: 137 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes
> Cur LV                5
> PE Size (KByte)       32768
> Total PE              3576
> Free PE               4294967188
> Allocated PE          3684
>
> It's somehow over-allocated the PE on the PV. The other two drives of 
> the 3 in the VG report correctly.
>
> To make things odder, "pvdata -E /dev/hde" reports:
>
> --- List of physical extents ---
> PE: 00000  LV: 002  LE: 00028
> PE: 00001  LV: 002  LE: 00029
> ---snip---
> PE: 03555  LV: 004  LE: 00447
> PE: 03556  LV: ---  LE: -----
> PE: 03557  LV: ---  LE: -----
> PE: 03558  LV: ---  LE: -----
> PE: 03559  LV: ---  LE: -----
> PE: 03560  LV: ---  LE: -----
> PE: 03561  LV: ---  LE: -----
> PE: 03562  LV: ---  LE: -----
> PE: 03563  LV: ---  LE: -----
> PE: 03564  LV: ---  LE: -----
> PE: 03565  LV: ---  LE: -----
> PE: 03566  LV: ---  LE: -----
> PE: 03567  LV: ---  LE: -----
> PE: 03568  LV: ---  LE: -----
> PE: 03569  LV: ---  LE: -----
> PE: 03570  LV: ---  LE: -----
> PE: 03571  LV: ---  LE: -----
> PE: 03572  LV: ---  LE: -----
> PE: 03573  LV: ---  LE: -----
> PE: 03574  LV: ---  LE: -----
> PE: 03575  LV: ---  LE: -----
>
> The other drives are fine, and don't display this pattern. Really, 
> this one drive seems like the only issue preventing me from getting 
> the LVM back up and running.
>
> How can this be corrected?
>
> Thanks in advance for any help you can provide.
>
>
> - Troy
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
