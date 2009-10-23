Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NHTXJf003199
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:29:33 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NHTKF2011014
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:29:20 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e37.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9NHSCpC008544
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:28:12 -0600
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n9NHTF7c239402
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:29:15 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n9NHTFVF030122
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:29:15 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n9NHTFck030109
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:29:15 -0600
Date: Fri, 23 Oct 2009 10:29:14 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LVs
Message-ID: <20091023172914.GA12748@us.ibm.com>
References: <4AE1B9FB.504@mortent.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4AE1B9FB.504@mortent.org>
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

Morten Torstensen [morten@mortent.org] wrote:
> Why cannot the mirrorlog be stored persistently in one or more LEs in 
> the LV? Why the need for a seperate PV for this?

For better redundancy...

> Since most servers I work with have two disks for the system, this force 
> me to use md for mirroring, adding unneeded complexity for a simple mirror.

Use "--alloc anywhere" to place the log LV on one of them when you
create your mirror.
