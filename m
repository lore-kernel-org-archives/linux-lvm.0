Return-Path: <bluca@comedia.it>
Date: Sun, 5 Aug 2001 09:58:11 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805095811.A4626@colombina.comedia.it>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010805003257.A2728@glines.org>; from mark@glines.org on Sun, Aug 05, 2001 at 12:32:57AM -0700
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

On Sun, Aug 05, 2001 at 12:32:57AM -0700, Mark Glines wrote:
> On Sun, Aug 05, 2001 at 09:12:01AM +0200, Luca Berra wrote:
> > there is an (*horrible*) piece of code in pv_read_all_pv.c
> > that deals with multiple entries for the same PV, so all duplicate
> > PV are skipped, so the md will be the obly one detected.
> > what probably happened to John is, that his PV was killed by
> > this routine (they were duplicate and not md devices)
> 
> I would only think this is a problem when md isn't being used.  In the
> above described situation, vgscan would see 2 devices which have md
> headers (and ignore them), and one LVM signature (and use it)?

Correct!

> If the code does what you say, and LVM was using the dual-path SCSI
> device directly, then it would detect one and ignore the other, and it
> would still work as if there was only one route to the drive.

this is also correct, i was just guessing there might be another dragon
in this code, but we would need an output of vgscan -d from John to check.

> However, in this case, md is in the middle, and its md's job to handle
> multi-path.  LVM should be ignoring md's lowlevel volumes anyway, and
> act solely on the virtual device md exports.  Am I missing something?
John is not using md yet, you are correct in all you say.

Regards,
L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
