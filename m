Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6QMu0a32531
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2004 18:56:00 -0400
Received: from ms-smtp-03-eri0.southeast.rr.com
	(ms-smtp-03-lbl.southeast.rr.com [24.25.9.102])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6QMtwe1027191
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2004 18:55:58 -0400
Received: from ZACK2 (rdu163-116-062.nc.rr.com [24.163.116.62])
	by ms-smtp-03-eri0.southeast.rr.com (8.12.10/8.12.7) with ESMTP id
	i6QMtriB009598
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2004 18:55:55 -0400 (EDT)
Message-ID: <003701c47363$bb61ec90$6b02a8c0@ZACK2>
From: "Zachary Hamm" <zhamm@nc.rr.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
	<20040722153408.GG10840@tykepenguin.com>
	<001001c47021$9accc800$6b02a8c0@ZACK2>
	<20040723065607.GB9681@tykepenguin.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Date: Mon, 26 Jul 2004 18:56:04 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Changed the filter directed as suggested, no joy.  I still get the same
errors.  Any other suggestions, or should I post more config information?
There has to be something I'm missing.

Zack

----- Original Message ----- 
From: "Patrick Caulfield" <pcaulfie@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Friday, July 23, 2004 2:56 AM
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2


> On Thu, Jul 22, 2004 at 03:25:09PM -0400, Zachary Hamm wrote:
> > Thanks for the tip.  But "md_component_detection = 1" is already set in
my
> > lvm.conf file.   Any other tips?  Perhaps also linked to sometimes
getting
> > an "out of memory" message when running the user tools?
> >
>
> Did you try the filter? The OOM error is almost certainly caused by the
tools
> reading an incorrect or corrupt header from the disk, and if your PVs are
all MD
> devices then there's no reason for LVM to scan the underlying disks.
>
> patrick
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
