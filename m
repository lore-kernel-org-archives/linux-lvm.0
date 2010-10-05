Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95Eeg23009472
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:40:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95EeU6I018430
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:40:30 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o95EeUmT025538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:40:30 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o95EeTYU029377
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 10:40:29 -0400
Date: Tue, 5 Oct 2010 10:40:29 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTimSuJmsruAbN5K+s8=DcrcVqB6BAbcyFhdTauF+@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010051036320.29065@bmsred.bmsi.com>
References: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	<1286249478.12105.27@raydesk1.bettercgi.com>
	<AANLkTimSuJmsruAbN5K+s8=DcrcVqB6BAbcyFhdTauF+@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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

On Tue, 5 Oct 2010, Tapas Mishra wrote:

> I want to break one LVM into 2 one of which I want to populate with a
> root filesystem
> and another with swap.

If you want people to understand your questions, stop talk about "one LVM"
as if it was a storage device (virtual or real).  LVM is a software
package, and the objects you manipulate using it include

LV	Logical Volume
PV	Physical Volume
VG	Volume Group

In addition, kpartx creates virtual block devices.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
