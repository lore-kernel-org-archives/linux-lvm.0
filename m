Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1M8eXCA009523
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 03:40:33 -0500
Received: from web32913.mail.mud.yahoo.com (web32913.mail.mud.yahoo.com
	[209.191.69.113])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l1M8eVYK011180
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 03:40:32 -0500
Date: Thu, 22 Feb 2007 00:40:25 -0800 (PST)
From: k <shikam@yahoo.com>
Subject: Re: [linux-lvm] LVM - History
In-Reply-To: <20070221212318.GA8141@IUPUI.Edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <809419.63369.qm@web32913.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thaks for your help; my goal is to document LVM, from
an architecture, and source code point of views:
-The architecture will probably go back to 70�s or
early 80�s.
-The Source code will start from when LVM, started to
exist as an open source product (1998??) , and the
product that inspired the first release.

Do you know if IBM licensed, LVM to HP, and also
released it to the open source for linux developments?

Did Linux (Sistina) LVM derived from the IBM's LVM? Is
HP's LVM also drived from IBM's LVM? 

Regards
Shikam
--- "Mark H. Wood" <mwood@IUPUI.Edu> wrote:

> Maybe you should define the scope of "LVM" for your
> purposes.  The
> basic idea goes waaaaay back.  Netware 4 had the
> ability to divvy up a
> partition, slice off pieces, and stick them together
> into one or more
> logical volumes.  Most mainframe and mini OSes could
> at least paste
> multiple physical disk volumes together to form
> larger logical
> volumes.  The ANSI X3.27 tape label standard from
> the 1970s or so (my
> copy is at home now) (last edition is from 1987)
> defines a way to do
> this with *open-reel tapes*.
> 
> It's interesting to look at how the idea developed
> over time.  Logical
> volume management started out as a way to make a
> single large logical
> volume out of multiple rather dinky physical
> volumes.  Nowadays it's
> typically used in the opposite fashion:  take a huge
> physical volume
> and carve it into multiple smaller logical volumes. 
> You can still
> make logical volumes bigger than the biggest
> available physical
> volume, though, and there are sites which do.  (I
> haven't needed that
> much storage in a single block address space since
> the 1990s, but YMMV.)
> 
> -- 
> Mark H. Wood, Lead System Programmer  
> mwood@IUPUI.Edu
> Typically when a software vendor says that a product
> is "intuitive" he
> means the exact opposite.
> 
> > _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/
