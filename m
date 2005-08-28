Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SAlkV15976
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 06:47:46 -0400
Received: from gw.osk.ch (80-218-242-213.dclient.hispeed.ch [80.218.242.213])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SAld8B023924
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 06:47:40 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7SAlRK20524
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 12:47:27 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7SAlUFR015964
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 12:47:30 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7SAlUBI015960
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 12:47:30 +0200
Date: Sun, 28 Aug 2005 12:47:30 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM
Message-ID: <20050828104730.GC26065@gutek>
References: <20050828101721.GB26065@gutek>
	<200508281324.56314.mailinglist@krausam.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200508281324.56314.mailinglist@krausam.de>
Reply-To: lvm@osk.ch,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Aug 28, 2005 at 01:24:48PM +0200, mailinglist@krausam.de wrote:
> Try:
> filter = [ "r|/dev/cdrom|" ]

Have you tried it?

This doesn't work for me.

Does anybody know the solution?

Regards,
Chris

> 
> 
> 
> Am Sonntag, 28. August 2005 12:17 schrieb Chris Osicki:
> > Hi
> >
> > I seam not to be able to convince vgscan to let my cdroms alone.
> > In the file /etc/lvm/lvm.conf I have this filter:
> >
> > [ "r|/dev/cdrom.*" ]
> >
> > when I run vgscan -v -v I see the following:
> >
> >
> >       /dev/cdrom1: size is 31244 sectors
> >   /dev/cdrom1: read failed after 0 of 2048 at 0: Input/output error
> >       /dev/cdrom1: size is 31244 sectors
> >       /dev/cdrom1: No label detected
> >
> >
> > I tried other variants of this filter without luck.
> > On the laptop I'm writing this message on it took several minutes for
> > vgscan to finish. On another PC it doesn't take that long but is
> > annoying. How do I convince vgscan not to scan those devices?
> > I tried also such a filter as test:
> >
> > [ "r|/dev/pty.*" ]
> >
> > it didn't work either.
> >
> > I'm using
> >
> >   LVM version:     2.01.09 (2005-04-04)
> >   Library version: 1.01.00-ioctl (2005-01-17)
> >   Driver version:  4.4.0
> >
> > I would be very thankful for any help.
> >
> > Regards,
> > Chris
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> Micha Krause
> 
> Jabber:	SMS-King@jabber.org
> Email:	mailinglist@krausam.de



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Chris Osicki osk@osk.ch
Dipl. Informatik-Ing. HTL
