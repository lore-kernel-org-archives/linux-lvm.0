Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l39N0poQ009800
	for <linux-lvm@redhat.com>; Mon, 9 Apr 2007 19:00:51 -0400
Received: from smtp4.pacifier.net (smtp4.pacifier.net [64.255.237.174])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l39N0lUD004113
	for <linux-lvm@redhat.com>; Mon, 9 Apr 2007 19:00:47 -0400
Received: from bedroom.boskone (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp4.pacifier.net (Postfix) with ESMTP id 76A596A479
	for <linux-lvm@redhat.com>; Mon,  9 Apr 2007 16:00:46 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Subject: Re: [linux-lvm] bug in lvs reporting -- version  2.02.07 Debian
Date: Mon, 9 Apr 2007 16:00:43 -0700
References: <200704082223.42433.benscott@nwlink.com>
	<461A6EAE.5040008@ce.jp.nec.com>
In-Reply-To: <461A6EAE.5040008@ce.jp.nec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704091600.43491.benscott@nwlink.com>
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
To: linux-lvm@redhat.com

On Monday 09 April 2007 09:49:50 am Jun'ichi Nomura wrote:
> Hi,
>
> ben scott wrote:
> > I have found a couple of times in testing that lvs will sometimes report
> > the same logical volume 2 or more times when output options are used. It
> > seems to happen with volumes that are a large percentage of the total
> > group size. Below I give an example. Notice how "lvs" with no options
> > works fine but with options doesn't.

> With combination of LVM2 2.02.20 or newer and device-mapper 1.02.16
> or newer, you can see which field belongs to which category by
> 'lvs -o help'.

Thank you, I was unaware of that feature.
