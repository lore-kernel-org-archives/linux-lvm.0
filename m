Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3HDNhDJ023957
	for <linux-lvm@redhat.com>; Sun, 17 Apr 2011 09:23:43 -0400
Received: from mxip0i.isis.unc.edu (mxip0i.isis.unc.edu [152.2.0.72])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3HDNgBI016204
	for <linux-lvm@redhat.com>; Sun, 17 Apr 2011 09:23:42 -0400
Received: from orwell (triband-mum-59.183.27.142.mtnl.net.in [59.183.27.142])
	(authenticated bits=0)
	by smtp.unc.edu (8.14.4/8.14.3) with ESMTP id p3HDNbwk011569
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Sun, 17 Apr 2011 09:23:41 -0400 (EDT)
Received: from faheem by orwell with local (Exim 4.72)
	(envelope-from <faheem@email.unc.edu>) id 1QBRwu-0004Sd-H9
	for linux-lvm@redhat.com; Sun, 17 Apr 2011 18:53:36 +0530
References: <alpine.DEB.2.00.1104121207130.11425@orwell.homelinux.org>
	<alpine.LRH.2.00.1104121214120.19728@bmsred.bmsi.com>
	<slrniq9cgq.mna.faheem@Chrestomanci.home.earth>
	<alpine.LRH.2.00.1104121916450.23161@bmsred.bmsi.com>
Date: Sun, 17 Apr 2011 18:53:34 +0530
Message-ID: <slrniqlqen.k4e.faheem@Chrestomanci.home.earth>
From: Faheem Mitha <faheem@email.unc.edu>
Subject: Re: [linux-lvm] lvm devices under /dev/mapper missing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

[This message has also been posted.]
On Tue, 12 Apr 2011 19:18:05 -0400 (EDT), Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Tue, 12 Apr 2011, Faheem Mitha wrote:
>
>>> You might need "vgchange -ay myvg".
>>
>> This activates volume groups. Is this the problem, and is so, why? I
>> thought the issue was that something had deleted my symbolic links
>> under /dev/mapper. Still no idea why.
>
> One of the things activating a VG does is create the symlinks in /dev/mapper.

I see. Thanks, I'll bear that in mind if this situation recurs.

                                               Regards, Faheem

> --
>  	      Stuart D. Gathman <stuart@bmsi.com>
>      Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.

Ah yes. Mozart's Requiem.

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
