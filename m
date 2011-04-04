Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p342daFM029698
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 22:39:36 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p342dWbD009789
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 22:39:33 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p342dVpF025555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 22:39:31 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p342dUo9004720
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 22:39:30 -0400
Date: Sun, 3 Apr 2011 22:39:30 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1104031834300.4034@bmsred.bmsi.com>
Message-ID: <alpine.LRH.2.00.1104032234030.4679@bmsred.bmsi.com>
References: <4D983971.6070006@abpni.co.uk>
	<alpine.LRH.2.00.1104031834300.4034@bmsred.bmsi.com>
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

On Sun, 3 Apr 2011, Stuart D. Gathman wrote:

> I have heard of hardware that raised NMI in normal operation as a kind
> of highest priority interrupt.  However, such hardware is generally
> equivalent to broken.

OT: the linux-ecc project trapped NMI from memory errors and mapped out bad
memory pages (with a persistent map) so that bad memory could be used
reliably.  So there are legitimate uses for NMI in normal operation. 
Debuggers can also use NMI.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
