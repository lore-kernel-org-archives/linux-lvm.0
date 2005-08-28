Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SJ5UV28977
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 15:05:30 -0400
Received: from gw.osk.ch (80-218-242-213.dclient.hispeed.ch [80.218.242.213])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7SJ5Ik3014684
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 15:05:29 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7SJ5Hr03540
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 21:05:17 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7SJ5GGI015640
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 21:05:16 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7SJ5GZd015635
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 21:05:16 +0200
Date: Sun, 28 Aug 2005 21:05:16 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM
Message-ID: <20050828190516.GA25137@gutek>
References: <20050828101721.GB26065@gutek>
	<200508281324.56314.mailinglist@krausam.de>
	<20050828104730.GC26065@gutek>
	<200508281354.40370.mailinglist@krausam.de>
	<20050828115618.GE26065@gutek>
	<20050828183614.GD13825@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050828183614.GD13825@percy.comedia.it>
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


Hi Luca

I tried your idea:


grep cdrom /etc/lvm/lvm.conf
     filter = [ "r|/dev/hdb|", "r|/dev/hdc|", "r|/dev/cdrom|" ]

vgscan -v -v 2>&1 | grep cdrom

      /dev/cdrom1: size is 31244 sectors
  /dev/cdrom1: read failed after 0 of 2048 at 0: Input/output error
      /dev/cdrom1: size is 31244 sectors
      /dev/cdrom1: No label detected
      /dev/cdrom: size is 4 sectors

Regards,
Chris

On Sun, Aug 28, 2005 at 08:36:14PM +0200, Luca Berra wrote:
> On Sun, Aug 28, 2005 at 01:56:18PM +0200, Chris Osicki wrote:
> >OK, that are my filters now:
> >
> >   filter = [ "r|/dev/hdb|" ]
> >   filter = [ "r|/dev/hdc|" ]
> >   filter = [ "r|/dev/cdrom|" ]
> >   filter = [ "r|/dev/cdrom1|" ]
> >   filter = [ "r|/dev/cdrom*|" ]
> >   filter = [ "r|/dev/cdrom.*|" ]
> >
> i tought the syntax was:
> filter = [ "r|/dev/hdb|", "r|/dev/hdc|", "r|/dev/cdrom|" ]
> 
> you should not need the last 3, since "r|/dev/cdrom|" being a regexp
> matches all of them.
> 
> 
> btw, i believed "sysfs_scan = 1" was enough to skip cdroms
> 
> L.
> 
> 
> 
> 
> -- 
> Luca Berra -- bluca@comedia.it
>        Communication Media & Services S.r.l.
> /"\
> \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
> / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Chris Osicki osk@osk.ch
Dipl. Informatik-Ing. HTL
