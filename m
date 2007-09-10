Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8AHHeUV023296
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 13:17:41 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8AHHGjW028093
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 13:17:21 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l8AHHAml002171
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 13:17:10 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l8AHHAEp470492
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 11:17:10 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l8AHHAGd016404
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 11:17:10 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	l8AHHAAd016384
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 11:17:10 -0600
Date: Mon, 10 Sep 2007 10:17:09 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
Message-ID: <20070910171709.GA5117@us.ibm.com>
References: <20070907121306.GA27457@heitec.net>
	<20070907175345.GA5931@racke.local>
	<20070910085921.GC22296@heitec.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070910085921.GC22296@heitec.net>
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

I don't think so. /dev/sdb will have the same partition table as
/dev/sda from the sfdisk command.  I bet you need to run pvcreate and
vgcreate before running the rest of the script.

Thanks, Malahal.

Holger Rauch [holger.rauch@heitec.de] wrote:
> Hi Lars (and all the other list members),
> 
> first of all, thanks for this nice little script (and I see nothing wrong
> with that :-))) ), but it assumes that VG backupvg and the underlying VG
> has already been created, right? I see no pvcreate and vgcreate invocations
> in there. Is this on purpose, i.e. is that already done just by duplicating
> the partition table using sfdisk?
> 
> Thanks in advance for clarifying things.
> 
> Kind regards,
> 
> 	Holger
> 
> On Fri, 07 Sep 2007, Lars Ellenberg wrote:
> 
> > [...]
> > what is wrong with
> >  sfdisk -d /dev/sda | sfdisk /dev/sdb
> >  lvs -o attr,name,size --noheadings rootvg |
> >  while read a n s; do
> >  	[[ $a == -* ]] || continue;
> > 	lvcreate -L $s -n $n backupvg ;
> > 	# dd bs=1M if=/dev/rootvg/$n of=/dev/backupvg/$n
> >  done
> > ?
> > [...]
