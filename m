Return-Path: <alciocca@ecetra.com>
Date: Wed, 18 Jul 2001 11:46:26 +0200 (CEST)
From: Adam Cioccarelli <alciocca@ecetra.com>
Subject: Re: [linux-lvm] HUGE LVM log file...
In-Reply-To: <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208>
Message-ID: <Pine.LNX.4.33.0107181141480.25686-100000@vie-ac.office.ecetra.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

actually on AIX you can choose where the LV starts using PPs from

	edge
	middle
	center
	inner-middle
	inner-edge

middle is the default but I think this is more so the average performance
of the LVs are better, but maybe not...

-------------------------------------------------------------------------------
Adam Cioccarelli (B.E Mechanical)                Adam.Cioccarelli@ecetra.com
Database Administrator			         Phone: +43 1 536 89 7725
						 Fax:   +43 1 536 89 7719
ecetra Central European e-Finance AG             Mobile:+43 664 181 4195
-------------------------------------------------------------------------------

On Wed, 18 Jul 2001, Benoit SERRA wrote:

> At 18/07/01, you wrote:
> >We've not had much feedback on this, I guess that people don't really
> >notice much of a difference, I certainly haven't.  The allocation
> >policy for PE's is to start at the beginning of the disk (which tend
> >to have faster data transfer rates) and work back.  Anybody done any
> >benchmarking in this area ?
> >
>
> Are you sure ?
>
> In AIX, the system create PPS (PE) from the middle of the disk for
> performance reasons.
>
> I heard on this list or on Linux-raid list that it's the middle of the disk
> which is the faster area.
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
