Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4TGYA4l030120
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 12:34:10 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4TGXV31015473
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 12:33:54 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m4TGXPSU019246
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 12:33:25 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m4TGXGmF025832
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 10:33:21 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m4TGXGHG015606
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 10:33:16 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m4TGXGgZ015554
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 10:33:16 -0600
Date: Thu, 29 May 2008 09:33:15 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Veritas/Symantec Backup Exec Remote Agent prevents
	removal of LVM snapshot
Message-ID: <20080529163315.GA14958@us.ibm.com>
References: <7a65a83a0805290913v51e3f230s1f2f0aa80de9ad30@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a65a83a0805290913v51e3f230s1f2f0aa80de9ad30@mail.gmail.com>
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

Richard Edward Horner [rich@richhorner.com] wrote:
> Hi,
> 
> msa1--r5-u03snap 253   4 L--w    1    1      0
> LVM-YCyBjQE0Ffm10Fv82uZsRUvRH9oSvdBjYXzas7drqorLjkV4BUPklzXxAgvVpzKq
> 
> So, something is open apparently even though the filesystem is
> unmounted. Well:

If a file system object is opened, you won't be able to unmount it
(unless you force it). I imagine that no file in the file system is in
use. But I think that the logical volume itself is in use.
