Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p33MdpdU030624
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 18:39:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p33MdmmO019772
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 18:39:48 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p33Mdk7Z023307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 18:39:46 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p33MdjjT004076
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 18:39:46 -0400
Date: Sun, 3 Apr 2011 18:39:45 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D983971.6070006@abpni.co.uk>
Message-ID: <alpine.LRH.2.00.1104031834300.4034@bmsred.bmsi.com>
References: <4D983971.6070006@abpni.co.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Server Crashes Sometimes
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

On Sun, 3 Apr 2011, Jonathan Tripathy wrote:

> still respond to ping), and dmseg is flooded with
> 
> Uhhuh. NMI received. Dazed and confused, but trying to continue
> You probably have a hardware problem with your RAM chips
> ...
> This issue is very rare, and has only happened to me maybe 3 times over the
> past 7 months, each time being when I issued an LVM command
> 
> Has anybody experienced this before?

Yes.  The message means just what it says.  NMI is a hardware interrupt
usually reserved for machine errors such as an uncorrectable memory error.
In my case, it was a defective PCI card (with USB ports) raising the NMI.
(Which I determined by process of elimination.)  Note that many system buses,
including PCI, have error checking and will raise NMI on failure.

I have heard of hardware that raised NMI in normal operation as a kind
of highest priority interrupt.  However, such hardware is generally
equivalent to broken.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
