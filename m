Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i82LosJ0006931
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 22:50:54 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C2zTq-00083R-LV
	for linux-lvm@redhat.com; Thu, 02 Sep 2004 22:50:54 +0100
Date: Thu, 2 Sep 2004 22:50:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] fc2 & lvm2 MAX LV
Message-ID: <20040902215054.GK6264@agk.surrey.redhat.com>
References: <1094161325.2396.22.camel@lnx2k>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1094161325.2396.22.camel@lnx2k>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Sep 02, 2004 at 04:42:05PM -0500, Dan Fleischer wrote:
> a MAX LV of 255 GB, as follows:

>   MAX LV                255

A configurable maximum of 255 logical volumes, not GB.

Try out
  vgchange -l

Alasdair
-- 
agk@redhat.com
