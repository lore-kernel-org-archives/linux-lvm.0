Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25IJrHE026113
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 13:19:53 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l25IJbtg030621
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 13:19:37 -0500
Message-ID: <45EC5F32.1060100@davidb.org>
Date: Mon, 05 Mar 2007 10:19:30 -0800
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] WARNING: Ignoring duplicate config node:
	filter	(seeking filter)
References: <20070305180020.005367576E@mailer.at.ds9>
In-Reply-To: <20070305180020.005367576E@mailer.at.ds9>
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
To: cisco66@gmx.de, LVM general discussion and development <linux-lvm@redhat.com>

Cisco wrote:
>  
>  Hi all,
>  
>  after upgrading (compiling from source)LVM2 and device
>  mapper, i always get the warning message "WARNING: Ignoring
>  duplicate config node: filter (seeking filter)" when doing
>  "lvm version" or any other lvm command.
>  
>  Does anyone know what's going on and if i should be
>  concerned about this, or even better: What is the meaning of
>  this message and how can i get rid of it.

You have multiple "filter = " lines in your lvm config file.  Previous
versions ignored this (but appeared to only use one of them).  You
need to specify all of the filtering you want in one list.

Dave
