Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB7JYdLF015593
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 14:34:39 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB7JYN2q014492
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 14:34:23 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nB7JYNiY003538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 14:34:23 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nB7JYMxH001688
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 14:34:22 -0500
Date: Mon, 7 Dec 2009 14:34:22 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when mounting
	(Stuart D. Gathman)
In-Reply-To: <691e2b620912071047jaf3e752m3a49fadbf6a3ae5f@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0912071431030.1595@bmsred.bmsi.com>
References: <691e2b620912071047jaf3e752m3a49fadbf6a3ae5f@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 7 Dec 2009, Johan Gardell wrote:

> Ok, added a filter to remove /dev/fd0. But i still get
> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
> lookup failed
> [22723.980395] device-mapper: ioctl: error adding target to table
> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
> lookup failed
> [22724.001158] device-mapper: ioctl: error adding target to table

Well, the 'd' in the lvs output means "device present without tables".
I googled on the error msg, and see that a bunch of Ubuntu and Debian
people had to remove evms for lvm to work properly after a certain
kernel upgrade.  If that is not the problem, then I would have to start
looking at the source, but perhaps a real guru here could help.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
