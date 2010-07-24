Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6O4e3hC032207
	for <linux-lvm@redhat.com>; Sat, 24 Jul 2010 00:40:03 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6O4drGs014930
	for <linux-lvm@redhat.com>; Sat, 24 Jul 2010 00:39:53 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6O4dqj8001452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 24 Jul 2010 00:39:52 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o6O4dqN8017256
	for <linux-lvm@redhat.com>; Sat, 24 Jul 2010 00:39:52 -0400
Date: Sat, 24 Jul 2010 00:39:52 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1279942095.12963.1386480183@webmail.messagingengine.com>
Message-ID: <Pine.LNX.4.64.1007240034370.17212@bmsred.bmsi.com>
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
 LVM Logical Volume Management ; jor
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

On Fri, 23 Jul 2010, giovanni_re wrote:

> What are the best tools (ie sw) for doing disk partitioning?  Preferably
> GUI. but, console mode suggestions welcome if that's best, or all there
> is.

This answer is perhaps a little snarky, but LVM is the best partitioning
tool. :-)  Just make the entire drive a PV.  

Reasons to still use the obsolete partition DOS table:

1) so other OSes know there is data on the drive
2) when using software RAID (md driver), partition type allows auto
   recognition and start of md devices.
3) you are using the grub boot loader, which doesn't speak LVM yet

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
