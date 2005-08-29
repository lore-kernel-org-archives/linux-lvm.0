Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7TIuVV25453
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 14:56:31 -0400
Received: from gw.osk.ch (80-218-244-161.dclient.hispeed.ch [80.218.244.161])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j7TJcAsK005289
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 15:38:11 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7TIu9005887
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 20:56:10 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7TIpWoM011309
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 20:52:08 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7TIpVmK011305
	for linux-lvm@redhat.com; Mon, 29 Aug 2005 20:51:31 +0200
Date: Mon, 29 Aug 2005 20:51:31 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM
Message-ID: <20050829185131.GA11271@gutek.swissptt.ch>
References: <20050828101721.GB26065@gutek>
	<1125227257.2225.63.camel@pc7.dolda2000.com>
	<1125229353l.13661l.6l@tangerine>
	<20050829175858.GC23960@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050829175858.GC23960@percy.comedia.it>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


Hi

It is hard to believe I'm the only person for whom the vgscan
filtering doesn't work as expected.
Would anybody of you do a small test for me and send the result:

    put an empty CD/DVD into the drive
    vgscan -v -v -v -d 2>&1 | grep cdrom
    lvm version

Provided your CD/DVD has a "cdrom" in the devicefile name.

Please note if there is no media in the drive you won't see cdrom
if you run vgscan, vgscan -v or vgscan -v -v

Thanks for your time.

Regards,
Chris

On Mon, Aug 29, 2005 at 07:58:59PM +0200, Luca Berra wrote:
> On Sun, Aug 28, 2005 at 11:42:33AM +0000, Jean-Luc Coulon (f5ibh) wrote:
> >Le 28.08.2005 13:07:37, Fredrik Tolf a �crit�:
> >>On Sun, 2005-08-28 at 12:17 +0200, Chris Osicki wrote:
> >>> Hi
> >>>
> >>> I seam not to be able to convince vgscan to let my cdroms alone.
> >>> In the file /etc/lvm/lvm.conf I have this filter:
> >>>
> >>> [ "r|/dev/cdrom.*" ]
> >>
> >>Try it without the dot:
> >>[ "r|/dev/cdrom*" ]
> >  [ "r|/dev/cdrom*|"] maybe ?
> >
> >You can even be more restrictive/explicit:
> >filter = [ "r|/dev/cdrom*|", "r|/dev/cdrw*|", "r|/dev/dvd*|",  
> >"r|/dev/hd[ab]|" ]
> >
> 
> i don't have the code at hand, but, if they are regular expression
> "/dev/cdrom*" would match
> /dev/cdrom
> /dev/cdromm
> /dev/cdrommm
> /dev/cdrommmm
> and so on..
> 
> see man 7 regex
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
