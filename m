Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p61IbsCX006809
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 14:37:54 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p61IbrhU020165
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 14:37:53 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p61IbefY011117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 14:37:43 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p61IbaDQ005547
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 14:37:36 -0400
Date: Fri, 1 Jul 2011 14:37:36 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <5d9860.22c.130e47547b4.Coremail.chaimvy@163.com>
Message-ID: <alpine.LRH.2.00.1107011432440.5493@bmsred.bmsi.com>
References: <5d9860.22c.130e47547b4.Coremail.chaimvy@163.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] why 'lvcreate' command blocked?
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

On Fri, 1 Jul 2011, Busby.Cheung wrote:

>        When I used the lvcreate cmd in my system, it blocked for a long
> time. My OS kernel version is linux-2.6.29, is there any bug?

There is a bug somewhere.  Your block device is hanging.  You don't
mention what kind of block device and what driver are used for your
PVs.  It would only be an LVM problem if the block device was itself
an LVM device. :-)

For instance, if your block device is iSCSI, and the SAN server is
down, or your block device is DRBD and the link is slow (has
happened to me), or your block device is a disk that is frantically
playing with bad sectors (has happened to me also), then LVM
would "hang".

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
