Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HEboOo012853
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 10:37:50 -0400
Received: from smtp004.apm-internet.net (smtp004.apm-internet.net
	[85.119.248.54])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8HEbbsn016678
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 10:37:38 -0400
Received: from bernoulli.globalphasing.com (bernoulli.globalphasing.com
	[192.168.131.101])
	by mailserv1.globalphasing.com (Postfix) with ESMTP id 16B49125DF
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 15:37:36 +0100 (BST)
Date: Thu, 17 Sep 2009 15:37:36 +0100 (BST)
From: Peter Keller <pkeller@globalphasing.com>
Subject: Re: [linux-lvm] Snapshots
In-Reply-To: <515267.47209.qm@web51301.mail.re2.yahoo.com>
Message-ID: <alpine.LNX.2.00.0909171528570.24048@bernoulli.globalphasing.com>
References: <515267.47209.qm@web51301.mail.re2.yahoo.com>
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Dear John,

On Thu, 17 Sep 2009, Jon Hardcastle wrote:

> Hi,
>
> Do I need some free extents to create a READ ONLY snapshot? I dont have 
> free extents but require a read-only snapshot before doing an upgrade.

Extents are written to the snapshot when changes take place on the volume 
that the snapshot is based on. If you have no free extents, trying to create 
a snapshot strikes me as pointless: you may as well mount the origin volume 
read-only and back up its contents directly (or unmount it and back it up at 
the level of the volume). Or do you have some special circumstances?

If you make the snapshot read-only, as soon as changes occur on the origin 
volume the snapshot will become useless: some of the data that are required 
to make the snapshot usable (i.e. unchanged copies of altered blocks on the 
origin volume)  will no longer exist.

Regards,
Peter.


-- 
Peter Keller                                     Tel.: +44 (0)1223 353033
Global Phasing Ltd.,                             Fax.: +44 (0)1223 366889
Sheraton House,
Castle Park,
Cambridge CB3 0AX
United Kingdom
