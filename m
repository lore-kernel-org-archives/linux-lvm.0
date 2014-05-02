Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4242SeB004528
	for <linux-lvm@redhat.com>; Fri, 2 May 2014 00:02:28 -0400
Received: from mail.gathman.org (wsip-70-169-160-205.dc.dc.cox.net
	[70.169.160.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4242RV9008825
	for <linux-lvm@redhat.com>; Fri, 2 May 2014 00:02:27 -0400
Received: from melissa.gathman.org (ip72-205-26-231.dc.dc.cox.net
	[72.205.26.231]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id s4242XKP014991
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 May 2014 00:02:34 -0400
Message-ID: <536318D1.7050809@gathman.org>
Date: Fri, 02 May 2014 00:02:25 -0400
From: Stuart Gathman <stuart@gathman.org>
MIME-Version: 1.0
References: <20140417122315.4c3687ea@netstation>
	<53502CB5.3060109@gathman.org>	<20140418231417.7f10605d@netstation>
	<20140426204744.25b201e4@netstation>
In-Reply-To: <20140426204744.25b201e4@netstation>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM issues after replacing linux mdadm RAID5 drive
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 04/26/2014 02:47 PM, L.M.J would
write:
>
> I presume I still have data on my broken RAID5.
>
> I did a pvcreate --restorefile and vgcfgrestore.
Did you restore the raid 5, taking out the new drive, and add00ing it
back in properly?  I can't take the time right now to give you a step by
step.  The big warning on what you did wasn't a joke.  You should get
help from md driver people.  You do not have an LVM problem.

> I can see now my 2 LVM, but my EXT4 filesystem are empty, df reports
some realist disk usage, fsck (Read only) find ? tons of errors. Is
there a way to recover my data on the EXT4 FS ? Le Fri, 18 Apr 2014
23:14:17 +0200, "L.M.J"

None of that is relevant until you restore your raid 5.  Your problem
was that you told md that your new blank drive was good, in-sync data. 
Which is obviously isn't.  You need to degrade your raid back to the one
missing drive.  Then add the new drive normally - NOT using that experts
only shortcut with the big warning, which you used incorrectly.
