Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3R3fQXL004644
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:41:26 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3R3fNW2031443
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:41:23 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p3R3fKHH006929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:41:20 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p3R3fJaX003411
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:41:20 -0400
Date: Tue, 26 Apr 2011 23:41:19 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1104262338440.3338@bmsred.bmsi.com>
References: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering Accidentally Destroyed LVM2 Information
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

On Tue, 26 Apr 2011, Chris Streeter wrote:

> So, I accidentally called lvremove instead of lvchange -a n Then I
> realized my mistake and tried to restore the logical volume. But that
> made the disk seem empty.

You didn't restore the LV, you created a new one.  That clears the first
block, so you likely will need recovery efforts on your erstwhile 
filesystem.

What you *should* have done is restore the metadata to the point before
your errant command.  You can still do that (if it is still in the archive),
but the several K of zeros written to the start of the LV you created will
require recovery.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
