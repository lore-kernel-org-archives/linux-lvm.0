Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBOIrwB3005996
	for <linux-lvm@redhat.com>; Fri, 24 Dec 2010 13:53:58 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id oBOIrvuP012994
	for <linux-lvm@redhat.com>; Fri, 24 Dec 2010 13:53:57 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oBOIrtgv025124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 24 Dec 2010 13:53:55 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oBOIrst9023282
	for <linux-lvm@redhat.com>; Fri, 24 Dec 2010 13:53:54 -0500
Date: Fri, 24 Dec 2010 13:53:54 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1293091697.20485.12.camel@corn.betterworld.us>
Message-ID: <Pine.LNX.4.64.1012241347320.23184@bmsred.bmsi.com>
References: <1293091697.20485.12.camel@corn.betterworld.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgmerge with different physical extent sizes
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

On Thu, 23 Dec 2010, Ross Boylan wrote:

> What happens if you vgmerge 2 VG's and they have different physical
> extent sizes?

The man page says it should fail.  It's possible that if everything
lines up, it automatically changes the extent size of either the
source or destination VG.

It is possible to change the PE size with vgchange (some lvresizing/pvmoving
may be required and must be done manually).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
