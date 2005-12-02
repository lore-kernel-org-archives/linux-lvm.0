Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB2JWvV04236
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 14:32:57 -0500
Received: from aragorn.bbn.com (aragorn.bbn.com [128.33.0.62])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB2JWl5x005983
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 14:32:51 -0500
Received: from [128.89.72.74] (mgillen2.dsl.bbn.com [128.89.72.74])
	by aragorn.bbn.com (8.12.7/8.12.7) with ESMTP id jB2JWZIB015824
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 14:32:36 -0500 (EST)
Message-ID: <4390A153.90407@mattgillen.net>
Date: Fri, 02 Dec 2005 14:32:35 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Need to keep running fsck on LVM
References: <200512020907.52315.t-rigby@shaw.ca>
In-Reply-To: <200512020907.52315.t-rigby@shaw.ca>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Terry Rigby wrote:
> Once a week or so I am getting an issue with my volume where I can no longer 
> write to it  and I get "read only filesystem" errors.  I need to unmount it 
> and run an fsck.ext3 on it and it will fix errors and then will be fine for 
> awhile.  I assume that there is a drive that is dying in the array.  Is there 
> any way or telling which drive this might be?

Have you tried to use smartctl to access SMART data on the drives?
--Matt
