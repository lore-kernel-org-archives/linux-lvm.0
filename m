Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3ELvHAP031104
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:57:17 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3ELv5IX007263
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:57:06 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o3ELv5lZ001968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:57:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o3ELv5rb015108
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:57:05 -0400
Date: Wed, 14 Apr 2010 17:57:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20100414212845.GD13021@agk-dp.fab.redhat.com>
Message-ID: <Pine.LNX.4.64.1004141752130.14791@bmsred.bmsi.com>
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
	<Pine.LNX.4.64.1004141603170.14791@bmsred.bmsi.com>
	<4BC62FBF.6030302@cfl.rr.com>
	<20100414212845.GD13021@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems resizing physical volume
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

On Wed, 14 Apr 2010, Alasdair G Kergon wrote:

> On Wed, Apr 14, 2010 at 05:12:31PM -0400, Phillip Susi wrote:
> > Grub2.  
> 
> Dangerous code which can mis-process configurations it does not recognise.
> I advise people not to use it unless they've tested their specific metadata
> gets processed by it correctly.

AIX had a clever way of integrating their LVM with boot.  There was a specially
marked boot LV that was required to have exactly one extent, and was not 
allowed to move (without updating the boot code).  The "boot" flag
caused the userspace tools to prevent operations that might leave the
system unbootable.

This reduces LVM to the equivalent of a partition as far as the
boot code is concerned.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
