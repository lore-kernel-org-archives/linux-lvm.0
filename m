Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2EI2ocE015538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 14:02:51 -0400
Date: Mon, 14 Mar 2011 14:02:50 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110314180250.GA18622@redhat.com>
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D7E5144.7060200@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D7E5144.7060200@gmail.com>
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Mar 14 2011 at  1:32pm -0400,
Les Mikesell <lesmikesell@gmail.com> wrote:

> On 3/14/2011 12:17 PM, Mike Snitzer wrote:
> >
> >>Is there any concern with mixing 4KB-sector drives with 512-byte
> >>sector drives in the same LV?
> >
> >Both LVM2 and Device Mapper have been updated to accommodate stacking
> >such a mix of drives.
> >
> >See this for a bit more detail:
> >http://people.redhat.com/msnitzer/docs/io-limits.txt
> >
> >Particularly, the "Stacking I/O Limits" section.
> >
> >The concern raised for partial (4k) writes to the 512b drive was
> >discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
> 
> Are there any version-level hints about when/where these changes
> appear and come together in the real world (i.e. distributions like
> RHEL, debian, Ubuntu)?

For the kernel, the bulk of associated infrastructure (ata, scsi, block,
dm, md, etc) went in 2.6.31, 2.6.32 saw some improvements, and 2.6.33
and 2.6.34 saw a few bug fixes.

v2.6.32.11 saw a backport of the 2.6.33 and 2.6.34 bug fixes via commit
9b2ff97

RHEL6 has all this.  I cannot speak for debian and/or Ubuntu.

As for LVM2, you'd want >= 2.02.62.

Mike
