Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8GI1LRR029143
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 14:01:21 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8GI1Bp8005907
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 14:01:12 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8GI0puQ015465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 14:00:51 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8GI0nja024580
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 14:00:49 -0400
Date: Fri, 16 Sep 2011 14:00:49 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CAJ=isdHtvSZ++vBpZ-ao4B4GOFSbsy_qDqF5yAWUyTMx682nLg@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1109161346070.24314@bmsred.bmsi.com>
References: <CAJ=isdHtvSZ++vBpZ-ao4B4GOFSbsy_qDqF5yAWUyTMx682nLg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Query regarding remote replication module
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 16 Sep 2011, Namrata Pawar wrote:

>  As suggested in http://markmail.org/message/bm7kvlcqbkahkigr thread, I need
>  to use remote replication module for setting up dual site mirror.
> 
> Where would I find that module; If its not in mainline?

Included in CentOS-5 is DRBD [drbd.org], which works great with LVM.  Use
iostat to measure average disk write bandwidth for the LV over a day and
highest average over 5 secs to give average and peak bandwidth.  If peak
bandwidth fits in your comm bandwidth, you can use DRBD directly with few
performance problems.

If peak doesn't fit, but average does, you can use a commercial smart buffer
proxy product from the company that sponsors the open source DRBD project.  The
smart buffer is an arbitrary size (using disk backup if needed) and optimizing
writes while maintaining effective write ordering.  There are no delays on the
primary system with the smart buffer, but the remote mirror can be delayed an
arbitrary amount of time (less than a day if your daily average finds in the
comm bandwidth).

We have a poor mans solution - we disconnect DRBD during working hours,
so their peak disk writes don't cause performance problems on their
T1 internet, then turn it back on again every evening.  DRBD syncs back up when
reconnected (you need to take an LVM snapshot first since consistency is not
maintained during the resync).

Disclaimer: I'm a happy user of the open source product - I've never tried the
smart buffering proxy, and our clients haven't needed it bad enough to pay for
it.  But it sounds great.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
