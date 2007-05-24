Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4OLg2Nv004886
	for <linux-lvm@redhat.com>; Thu, 24 May 2007 17:42:02 -0400
Received: from [10.11.14.103] (vpn-14-103.rdu.redhat.com [10.11.14.103])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l4OLg1OW031244
	for <linux-lvm@redhat.com>; Thu, 24 May 2007 17:42:02 -0400
Subject: Re: [linux-lvm] f*cked up metadata on 1of3 LVM-disks
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <1179763074.3696.28.camel@linux-cxyg>
References: <4641F72E.6050907@sas-clan.de>  <4651769C.6050007@sas-clan.de>
	<1179763074.3696.28.camel@linux-cxyg>
Date: Thu, 24 May 2007 17:42:02 -0400
Message-Id: <1180042922.3288.24.camel@linux-cxyg>
Mime-Version: 1.0
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

On Mon, 2007-05-21 at 11:57 -0400, Dave Wysochanski wrote:
> On Mon, 2007-05-21 at 12:38 +0200, BigMac wrote:
> > Nobody an idea how to recover the lvm meta data on the disk?
> > The data itself an the other disks are fine, just the first sectors of
> > /dev/hdc are gone by installing grub on it.
> > 
> > I had a deeper look on the disk with one of those low level disk editors
> > and there are still parts of the meta-data stored on the disk.
> > It seems to be that grub messed up just the first 17 sectors of the disk.
> > 
> > Regards,
> > 
> > BigMac
> > 
> 
> I am working on a tool to do recovery and pull metadata out of the
> disks.  Maybe this will help you.  
> 
> You can try "pvck -v" in the latest upstream LVM code.  It does not
> extract metadata to a file yet but makes an attempt at identifying areas
> on the disk that contain metadata and prints the offsets and lengths
> (you can then just dd to a file).  Since you have other PVs that are
> valid you could at least get the latest metadata off one of those, then
> use vgcfgrestore with this file and uuid option.
> 

Here is a nasty awk cmdline you could use for example (just replace
loop1 with whatever your device is named).  Remember you should run this
on one of your good PVs.

pvck -v /dev/loop1 2>&1 | grep "metadata record" | awk '{print "dd
if=/dev/loop1 bs=1 skip="substr($6,8,length($6)-8) "
count="substr($7,6,length($7)-6) " of=/tmp/dev-loop1-" NR ".bin" }'
> /tmp/doit.sh

Working on a real extract option to pvck though as this is certainly a
bit rough (some NULL chars still at the end of each file, etc).
