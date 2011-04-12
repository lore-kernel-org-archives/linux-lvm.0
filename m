Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3CKCKDA001317
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 16:12:20 -0400
Received: from mxip2i.isis.unc.edu (mxip2i.isis.unc.edu [152.2.2.193])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3CKCGRZ010077
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 16:12:17 -0400
Received: from orwell (triband-mum-59.183.57.126.mtnl.net.in [59.183.57.126])
	(authenticated bits=0)
	by smtp.unc.edu (8.14.4/8.14.3) with ESMTP id p3CKCCYt023692
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 16:12:15 -0400 (EDT)
Received: from faheem by orwell with local (Exim 4.72)
	(envelope-from <faheem@email.unc.edu>) id 1Q9jwZ-0000fD-Hc
	for linux-lvm@redhat.com; Wed, 13 Apr 2011 01:42:11 +0530
References: <alpine.DEB.2.00.1104121207130.11425@orwell.homelinux.org>
	<alpine.LRH.2.00.1104121214120.19728@bmsred.bmsi.com>
Date: Wed, 13 Apr 2011 01:42:07 +0530
Message-ID: <slrniq9cgq.mna.faheem@Chrestomanci.home.earth>
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
Hi Stuart,

Thanks for your reply.

On Tue, 12 Apr 2011 12:15:45 -0400 (EDT), Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Tue, 12 Apr 2011, Faheem Mitha wrote:

>> The symbolic links under /dev/mapper have gone missing. I don't
>> know why. I'm looking for advice on how to diagnose and fix this
>> (if necessary). I believe udev dynamically generates these links,
>> so in the best case scenario nothing needs to be done. But I don't
>> know if there might be other problems I'm not aware of.

> You might need "vgchange -ay myvg".

This activates volume groups. Is this the problem, and is so, why? I
thought the issue was that something had deleted my symbolic links
under /dev/mapper. Still no idea why.

                                                     Regards, Faheem

> --
>  	      Stuart D. Gathman <stuart@bmsi.com>
>      Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
