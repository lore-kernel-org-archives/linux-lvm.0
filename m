Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p57FPpC3013710
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:25:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p57FPoHv019593
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:25:51 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p57FPikk028842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:25:44 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p57FPhvb012411
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 11:25:44 -0400
Date: Tue, 7 Jun 2011 11:25:43 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <BANLkTikGwknQ7r5P76UqifeCeFRkaX=G=g@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1106071124130.12374@bmsred.bmsi.com>
References: <BANLkTi=O_ua2rMCA3Cs4tvvExzjo5cxBOg@mail.gmail.com>
	<alpine.LRH.2.00.1106070822200.11302@bmsred.bmsi.com>
	<BANLkTikGwknQ7r5P76UqifeCeFRkaX=G=g@mail.gmail.com>
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

On Tue, 7 Jun 2011, Misc Things wrote:

>> Exporting the VG is *supposed* to prevent activation.  You can reverse this
>> with vgimport.  Why did you wish to prevent activation?  Normally,
>> vgexport is used prior to physically removing a VG from the system.
>> (And then vgimport after attaching the drives to the new system.)
>
> Well, I just want to keep my data intact while i'm playing with the
> installation. I understand that @ this point it's just easier to pull
> the power on the HDs with the VG in question. But i'm curious why this
> is a problem...

It isn't a problem, unless you expect the VG to be available at boot time,
which apparently you do.  Do you have a root FS on the VG?

vgexport is for physically removing the drives, not for rebooting.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
