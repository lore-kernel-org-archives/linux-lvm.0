Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HDZ4ho027544
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 09:35:04 -0400
Received: from perpugilliam.csclub.uwaterloo.ca
	(postfix@perpugilliam.csclub.uwaterloo.ca [129.97.134.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HDYw3L028279
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 09:34:58 -0400
Date: Wed, 17 May 2006 09:34:56 -0400
Message-ID: <20060517133456.GD23933@csclub.uwaterloo.ca>
References: <446A36B8.1060707@cmu.edu> <20060516203917.GQ11191@w.ods.org>
	<446A418E.3070307@cmu.edu> <20060517034814.GA25818@w.ods.org>
	<446B2523.1040800@cmu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <446B2523.1040800@cmu.edu>
From: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Subject: [linux-lvm] Re: need help booting from SATA in 2.4.32
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
To: George Nychis <gnychis@cmu.edu>
Cc: linux-lvm@redhat.com, linux-kernel@vger.kernel.org, Willy Tarreau <willy@w.ods.org>

On Wed, May 17, 2006 at 09:29:07AM -0400, George Nychis wrote:
> Good suggestion on disabling IDE, it does not show up as SATA, it simply
> doesn't show up... after some googling, it seems as though no one has
> gotten it as SATA in 2.4:
> http://wip.powerblogs.com/posts/1124302626.shtml
> http://www.linuxquestions.org/questions/showthread.php?t=400521
> 
> Ok so, lets just assume we can't get SATA, and lets just try to get it
> to boot as /dev/hda ... so now i know nothing about LVM, can anyone
> provide me any insight on how to get this to boot with LVM?
> 
> So in 2.6.9, it loads VolGroup00/LogVol00 from /dev/sda5 which shows up
> in fdisk as LVM.  How can i get this to load from /dev/hda5 instead?

You don't.  SATA is using scsi style interface now, and with Alan Cox's
current work, IDE drives soon will too.  It will all go through libata
and show up as scsi disks.

It will be nice to have everything nice and consistent (except for the
few oddball raid cards that insist on being completely different) for
accessing disks.

SATA is not IDE, so why expect it to show up as an old style IDE disk?

Len Sorensen
