Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808235C882
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 14:59:22 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DBB030BC759
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 14:59:21 +0000 (UTC)
Date: Wed, 27 Feb 2019 09:59:15 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
Message-ID: <alpine.LRH.2.21.1902270958001.13312@fairfax.gathman.org>
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Cesare Leonardi <celeonar@gmail.com>

On Wed, 27 Feb 2019, Ingo Franzki wrote:

> The good thing about the example with encrypted volumes on loopback
> devices is that you can reproduce the problem on any platform, without
> having certain hardware requirements.

The losetup command has a --sector-size option that sets the logical
sector size.  I wonder if that is sufficient to reproduce the problem.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
