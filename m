Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p57FcgFc017553
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:38:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p57FceKb030515
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:38:40 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p57FcYL4029102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:38:34 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p57FcXI2012539
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:38:33 -0400
Date: Tue, 7 Jun 2011 11:38:33 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1106071124130.12374@bmsred.bmsi.com>
Message-ID: <alpine.LRH.2.00.1106071133440.12374@bmsred.bmsi.com>
References: <BANLkTi=O_ua2rMCA3Cs4tvvExzjo5cxBOg@mail.gmail.com>
	<alpine.LRH.2.00.1106070822200.11302@bmsred.bmsi.com>
	<BANLkTikGwknQ7r5P76UqifeCeFRkaX=G=g@mail.gmail.com>
	<alpine.LRH.2.00.1106071124130.12374@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Installation fails if VG is exported
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

On Tue, 7 Jun 2011, Stuart D. Gathman wrote:

>>> Exporting the VG is *supposed* to prevent activation.  You can reverse 
>>> this with vgimport.  Why did you wish to prevent activation?  Normally,
>>> vgexport is used prior to physically removing a VG from the system.  (And
>>> then vgimport after attaching the drives to the new system.)
>> 
>> Well, I just want to keep my data intact while i'm playing with the
>> installation. I understand that @ this point it's just easier to pull
>> the power on the HDs with the VG in question. But i'm curious why this
>> is a problem...
>
> It isn't a problem, unless you expect the VG to be available at boot time,
> which apparently you do.  Do you have a root FS on the VG?

I get it - you wanted to prevent your OS experimentation from activating and
possibly writing over your VG.  I can understand why vgexport seemed like
a solution, but it only prevents activation and removes references from
local LVM configuration (and prevents booting when that depends on the VG as
you discovered).

It doesn't prevent a rogue/buggy OS from scribbling on the disks.  So,
physically disconnecting (or powering off) the disks is the best way
to prevent that.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
