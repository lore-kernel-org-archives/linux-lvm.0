Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o42MCaia003159
	for <linux-lvm@redhat.com>; Sun, 2 May 2010 18:12:36 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o42MCQBi024333
	for <linux-lvm@redhat.com>; Sun, 2 May 2010 18:12:26 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o42MCQTT013304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 2 May 2010 18:12:26 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o42MCPxW011414
	for <linux-lvm@redhat.com>; Sun, 2 May 2010 18:12:25 -0400
Date: Sun, 2 May 2010 18:12:25 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4BDDE17F.7090300@strike.wu.ac.at>
Message-ID: <Pine.LNX.4.64.1005021807360.11378@bmsred.bmsi.com>
References: <4BDDE17F.7090300@strike.wu.ac.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] logical volumes and raid alignment
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2 May 2010, Alexander 'Leo' Bergolth wrote:

> My raid chunk size is 64k and I am using 5 data-bearing discs (raid 5
> with 6 discs), so the raid stripe size should be 64k * 5 = 320k.
> 
> But unfortunately the --physicalextentsize must be a power of 2, so I
> cannot use a multiple of 320k as the physical extent size.
> 
> What are your experiences with tuning and properly aligning lvm + raid?
> Does anyone know a workaround?

Use 4 data bearing disks.  Let #6 be a spare.  You're supposed to have
a spare anyway.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
