Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j91ABsV31246
	for <linux-lvm@redhat.com>; Sat, 1 Oct 2005 06:11:54 -0400
Received: from twinlark.arctic.org (twinlark.arctic.org [207.7.145.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j91ABlKv013943
	for <linux-lvm@redhat.com>; Sat, 1 Oct 2005 06:11:48 -0400
Date: Sat, 1 Oct 2005 03:11:42 -0700 (PDT)
From: dean gaudet <dean-list-linux-lvm@arctic.org>
Subject: Re: [linux-lvm] VFS lock patch and recent 2.4 kernels...
In-Reply-To: <20051001001458.GU29925@tristero.reed.edu>
Message-ID: <Pine.LNX.4.63.0510010308580.26632@twinlark.arctic.org>
References: <20051001001458.GU29925@tristero.reed.edu>
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

On Fri, 30 Sep 2005, Ben Poliakoff wrote:

> This must be in a FAQ somewhere, but I haven't found it yet.
> 
> Is the VFS lock patch is still required, to support lvm snapshots with
> journaling filesystems, for current 2.4 kernels (i.e. 2.4.31)?   If the
> patch *is* still required has anyone updated it for a recent 2.4
> release?  
> 
> The most recent versions of the patch that I've found seemed to go up to
> 2.4.20.  Has the patch been merged with the vanilla 2.4 kernel?

it hasn't been merged, it's still required... if you google for 
linux-2.4.22-VFS-lock.patch you'll find a version included in 
device-mapper tarballs.  it applies fine on recent kernels (modulo the 
dm.c file unless you've also applied device mapper patch).

-dean
