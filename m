Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105151708.f4FH8NaR019248@webber.adilger.int>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
In-Reply-To: <m2n18eygvs.fsf@isnogud.escape.de> "from Urs Thuermann at May 15,
 2001 01:46:15 pm"
Date: Tue, 15 May 2001 11:08:22 -0600 (MDT)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs writes:
> Sorry, I hadn't time to test your patch earlier.  I wanted to try it
> yesterday but lvm-0.9.1-beta7 with your patch applied doesn't compile.

Sorry, I must have missed some parts of the patch for the user-space
tools.  Even so, I don't think the patch will help.

> I also did some tests with another hard disk drive.  My previous tests
> were with a IBM DCAS-34330W SCSI-U2W.  I now did some tests with a NEC
> DSE2100S SCSI2 drive.  Again, LVM is much slower with the standard
> 512 byte block size:

One other person had a similar problem.  It was because they were
using PIO mode instead of DMA mode on their (IDE) drive.  However,
I see you are using a SCSI disk, so I don't know what to suggest...

What SCSI controller are you using?

> And am I really the only one who sees this?  I would really be
> interested to hear from some more people about performance for their
> LVM.

I have never seen more than a few percent difference between LVM and
non-LVM performance.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
