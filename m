Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2FL2FS14271
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 16:02:15 -0500
Received: from p15124399.pureserver.info (p15124399.pureserver.info
	[217.160.182.169])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2FL2E07026263
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 16:02:15 -0500
Received: from rockley.barbados (81-5-142-175.dsl.eclipse.net.uk
	[81.5.142.175]) (authenticated (0 bits))
	by p15124399.pureserver.info (8.11.6/8.11.6) with ESMTP id i2FL28V23075
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 21:02:08 GMT
Subject: Re: [linux-lvm] LVM Problems when moving data off a PV
From: Nick Gushlow <nick@gushlow.com>
In-Reply-To: <20040315123445.GA17078@redhat.com>
References: <1079271129.2414.7.camel@rockley.barbados>
	<20040315123445.GA17078@redhat.com>
Message-Id: <1079384528.2369.17.camel@rockley.barbados>
Mime-Version: 1.0
Date: Mon, 15 Mar 2004 21:02:08 +0000
Content-Transfer-Encoding: 7bit
Reply-To: nick@gushlow.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Thanks for your reply Heinz.

On Mon, 2004-03-15 at 12:34, Heinz Mauelshagen wrote:
> what exactly were those 'things' ?

I can't remember :-( but there was very little of help, most of it was
running some of the tools with different switches to try to find the
error being reported in more detail, but none of it made much sense to
me! :-)


> 
> You need to select the last valid metadata backup of vg2 from /etc/lvmconf
> (check it with vgcfgrestore -ll -f /etc/lvmconf/vg2.conf[.#.old]; see
> 'man vgcfgrestore for metadata archive file names) and restore it.
> 
> Say vg.conf.1.old is the valid one:
> 
> for dev in AllPVsOfVG2 # list all PVs reported by vgcfgrestore -ll above
> do
> 	pvcreate -ff $dev
> 	vgcfgrestore -f /etc/lvmconf/vg.conf.1.old $dev
> done
> vgscan
> vgchange -ay vg2
> 

I'll give that a go, a quick scan of the lvmconf directory shows two
files with recent timestamps, I assume that vg2.conf is not good
otherwise all would work, so vg2.conf.1.old must be the one.  All the
others are dated months ago before I transferred one of the partitions.

Time to hit those man pages! :-)

> The LVM2 tools support LVM1 metadata format.
> What went wrong running vgreduce --removemissing ?
> 
> In order to activate LVM1 VGs with LVM2, you need a kernel with device-mapper.

Off the top of my head I don't remember, but a quick look at my kernel
config shows no device mapper support, so I guess that's it.


What would you recommend doing first? your suggestion about the metadata
backup or recompiling the kernel and running the lvm2 tools?

> <preach>
> You need backups in order to be able to survive user/sw/hw failure.
> </preach>

Yeah I know, fortunately the critical drives are backed up, this is none
important stuff that can be replaced (but would be a pain in the
backside.)


Say I don't manage to recover the vg, is it possible to create a new vg
out of the pvs on the good disks and recover the data that's on those?

Nick.
