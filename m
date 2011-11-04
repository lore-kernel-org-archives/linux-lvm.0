Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA4GGjUd024514
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2011 12:16:45 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA4GGilq002208
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2011 12:16:44 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id pA4GGF3T012078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2011 12:16:15 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id pA4GGFJa003961
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2011 12:16:15 -0400
Date: Fri, 4 Nov 2011 12:16:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CAD848EE.8BF1A%robinr@muohio.edu>
Message-ID: <alpine.LRH.2.00.1111041210390.3833@bmsred.bmsi.com>
References: <CAD848EE.8BF1A%robinr@muohio.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] TLER/CCTL/ERC
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

On Thu, 3 Nov 2011, Robin, Robin wrote:

> I know that a lot of RAID controllers require drives with TLER/CCTL/ERC
> support, so as not to prematurely presume a drive is dead (and put array in
> degraded mode).
> 
> Does LVM have such requirement as well ? I'm wondering if LVM will
> prematurely declare a non-TLER/CCTL/ERC drive dead prematurely and
> deactivates the entire volume group..
> Or is LVM configurable to operate reliably over a long time on
> non-TLER/CCTL/ERC drives ?

When a PV dies, only that PV dies (and any LV parts on the PV).  You should 
ensure that metadata is written to at least 2 drives (but not too many).

I use software RAID1 or RAID10 for PVs.  This also handles dead drives 
gracefully, and performance for raid1 and raid10 is better than hardware
RAID (which generally is better for raid5 and raid6).

I like software raid1 because mirrors can be removed and
activated directly on another system (being sure to change UUID in case
drive ever gets back on original system), and similarly, data 
is easy to see when things go south.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
