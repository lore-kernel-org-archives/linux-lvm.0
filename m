Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5FHkhjx013319
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2010 13:46:43 -0400
Received: from EXHUB016-2.exch016.msoutlookonline.net
	(exhub016-2.exch016.msoutlookonline.net [207.5.72.164])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5FHkWlA020356
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2010 13:46:33 -0400
Message-ID: <4C17BC76.7090506@cfl.rr.com>
Date: Tue, 15 Jun 2010 13:46:30 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4C179B03.2000102@cfl.rr.com>
	<20100615164709.GG15698@agk-dp.fab.redhat.com>
In-Reply-To: <20100615164709.GG15698@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does every lvm command insist on touching	every
 pv?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 6/15/2010 12:47 PM, Alasdair G Kergon wrote:
> It shouldn't normally scan unless it detects something might have changed, but
> if you know the volume group name(s) already, put them on the command line: 
>   lvs vg1 vg2
> 
> (As always -vvvv may give you clues as to what is triggering the scan.)

I can see from the output with -vvvv that it is indeed trying to find a
pv label on every block device in /dev.  I thought that I had figured
out this was because lvm.conf was setting scan = [ "/dev" ] in the
devices section, but I tried removing /dev, and just setting it to "",
as well as "none" and lvs -vvvv STILL is opening every block device in /dev.

Shouldn't this not happen if you leave the value of scan empty, and
shouldn't it be left empty when you have udev running lvscan
automatically on block devices that contain physical volumes?
