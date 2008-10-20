Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9KFfriR024425
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 11:41:53 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9KFfgXw020246
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 11:41:43 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m9KFfgOr013258
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 11:41:42 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.13.8/8.13.8) with ESMTP id m9KFfffj014622
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 11:41:41 -0400
Date: Mon, 20 Oct 2008 11:41:41 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVs corrupted after pvresize
In-Reply-To: <1224221030.7772.17.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.64.0810201136250.14488@bmsred.bmsi.com>
References: <48F7AD78.1000002@knebb.de>
	<Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
	<48F80EFB.30404@knebb.de>
	<1224221030.7772.17.camel@localhost.localdomain>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 17 Oct 2008, Peter Larsen wrote:

> Again, you misunderstood Stuart's comment. He didn't say your RAID
> migration didn't work. He said it wasn't optimal.

Actually, I *was* hypothesizing that the RAID migration scrambled the data.
But apparently, that was not the problem because:

> > But after the deletion of the partion, recreation and pvcreate
> 
> That's the error. There's a pvresize for a reason. You also need to use

Yes, the pvcreate just hosed your metadata.  If you have a backup of the
metadata (somewhere other than an affected LV), you can restore it,
and then do the pvresize.  

> No - your use of LVM was wrong. Not LVM itself. 

Having used AIX LVM, I can say that Linux LVM has a way to go before
it reaches that level of ease of use.  But it keeps getting better,
and I get to participate!

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
