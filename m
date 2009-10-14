Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9E1pAwx025361
	for <linux-lvm@redhat.com>; Tue, 13 Oct 2009 21:51:10 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9E1p0fA012822
	for <linux-lvm@redhat.com>; Tue, 13 Oct 2009 21:51:00 -0400
Date: Tue, 13 Oct 2009 21:50:54 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to Fix Bad PV Allocation
In-Reply-To: <4AD52D2D.70202@attglobal.net>
Message-ID: <Pine.LNX.4.64.0910132150130.1055@bmsred.bmsi.com>
References: <4AD52D2D.70202@attglobal.net>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stunnel@attglobal.net, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 13 Oct 2009, Eddie wrote:

> How can I correct the PV allocations, so that they reflect the actual device,
> not the "incorrect" sizes, that were present when PVCREATE was originally run.

pvresize

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
