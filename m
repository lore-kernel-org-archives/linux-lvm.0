Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6GLPDvR026363
	for <linux-lvm@redhat.com>; Thu, 16 Jul 2009 17:25:13 -0400
Received: from e7.ny.us.ibm.com (e7.ny.us.ibm.com [32.97.182.137])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6GLOtYj003278
	for <linux-lvm@redhat.com>; Thu, 16 Jul 2009 17:24:55 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e7.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6GLBU2j029668
	for <linux-lvm@redhat.com>; Thu, 16 Jul 2009 17:11:30 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6GLOlo9255594
	for <linux-lvm@redhat.com>; Thu, 16 Jul 2009 17:24:47 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6GLOll3004551
	for <linux-lvm@redhat.com>; Thu, 16 Jul 2009 17:24:47 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6GLOkkJ004527
	for <linux-lvm@redhat.com>; Thu, 16 Jul 2009 17:24:46 -0400
Date: Thu, 16 Jul 2009 14:24:46 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Re: Parallel mirroring
Message-ID: <20090716212446.GA30411@us.ibm.com>
References: <5de034af0907121156s491df9cei264569333ea6a787@mail.gmail.com>
	<5de034af0907161407p5a3315f9r96104f4dd035de76@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5de034af0907161407p5a3315f9r96104f4dd035de76@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Diego Jacobi [jacobidiego@gmail.com] wrote:
> Hi.
> 
> Sry for retry but the lvm list is my last resource.

Try dm-devel mailing list. Linux LVM is based on device mapper
framework.

> Does Linux-LVM have Parallel scheduler mode for mirroring at all?
> If yes, how do you set it up, or check if it is enabled?

Writes happen in parallel, of course! At the moment it only reads from
the default mirror leg (unless the default leg is broken). There was
some patch for round-robin reading among mirrored legs, but it is not in
the upstream yet.

--Malahal.
