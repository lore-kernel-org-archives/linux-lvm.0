Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1D0Eri11018
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 19:14:53 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i1D0Eq330576
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 18:14:52 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 full disk & Grub
Message-ID: <20040212181452.P10533@homer.msp.redhat.com>
References: <402C0BF4.3000102@caltech.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402C0BF4.3000102@caltech.edu>; from ling@caltech.edu on Thu, Feb 12, 2004 at 03:27:48PM -0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 19:14:10 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 12, 2004 at 03:27:48PM -0800, Ling Li wrote:
> However, grub needs more than 3 sectors (in my system, 16 sectors), 

The number 4 is a compile time parameter - you could make it bigger if
you wanted to.

  lib/label/label.h:   #define LABEL_SCAN_SECTORS 4L

I wonder if it's sensible to add an offset parameter, so it skips the
first X sectors, or if it could recognise grub.

> By the way, is there an LVM2 howto available somewhere?
Not yet.  But we've just started to update the existing HOWTO to
cater for LVM2.
 
Alasdair
-- 
agk@redhat.com
