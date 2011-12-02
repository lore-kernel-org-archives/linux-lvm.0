Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2Nvb5Y011824
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 18:57:37 -0500
Received: from eastrmfepo103.cox.net (eastrmfepo103.cox.net [68.230.241.215])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2NvaDf013948
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 18:57:36 -0500
Received: from eastrmimpo109.cox.net ([68.230.241.222])
	by eastrmfepo103.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20111202235736.OFXF28068.eastrmfepo103.cox.net@eastrmimpo109.cox.net>
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 18:57:36 -0500
Message-ID: <4ED965EF.6050709@cox.net>
Date: Fri, 02 Dec 2011 17:57:35 -0600
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
	<6.2.5.6.2.20111202164221.063eb6d0@binnacle.cx>
In-Reply-To: <6.2.5.6.2.20111202164221.063eb6d0@binnacle.cx>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 12/02/2011 03:47 PM, starlight@binnacle.cx wrote:
> It just occurred to me that the system
> in question is a development box that
> is abused in stress testing and other
> scenarios.  It crashes in horrible ways
> fairly often.
>

Unless you're testing the kernel or libc, crashes aren't really supposed 
to happen, even when putting the system under heavy load.

-- 
Vegetarians eat vegetables, Humanitarians frighten me.
