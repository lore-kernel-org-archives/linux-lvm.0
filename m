Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8MLtmQO005483
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 17:55:48 -0400
Received: from relay03.mail-hub.dodo.com.au (relay03.mail-hub.dodo.com.au
	[123.2.6.238])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8MLtTVg031351
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 17:55:30 -0400
Received: from 123-2-156-143.static.dsl.dodo.com.au ([123.2.156.143]
	helo=fc11-64.localdomain)
	by relay03.mail-hub.dodo.com.au with esmtp (Exim 4.68)
	(envelope-from <whobedobe@dodo.com.au>) id 1MqDKK-0004kd-OG
	for linux-lvm@redhat.com; Wed, 23 Sep 2009 07:55:26 +1000
From: Hugh <whobedobe@dodo.com.au>
Subject: Re: [linux-lvm] grow lv bug
Date: Wed, 23 Sep 2009 07:55:09 +1000
References: <200909220808.16458.whobedobe@dodo.com.au>
	<200909222316.02416.whobedobe@dodo.com.au>
	<20090922132330.GO1210@agk-dp.fab.redhat.com>
In-Reply-To: <20090922132330.GO1210@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <200909230755.09752.whobedobe@dodo.com.au>
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
Content-Type: Text/Plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday 22 September 2009 23:23:30 Alasdair G Kergon wrote:
> On Tue, Sep 22, 2009 at 11:16:02PM +1000, Hugh wrote:
> > pvresize - success
> 
> Do you recall what command line you used?
> Did you just do pvresize <device>
> or did you use the --setphysicalvolumesize argument?
> 
> Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
Yes I did. I used --setphysicalvolumesize
it responded that it was successful.
