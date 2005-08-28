Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SBuaV25036
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 07:56:36 -0400
Received: from gw.osk.ch (80-218-242-213.dclient.hispeed.ch [80.218.242.213])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SBuIEa000425
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 07:56:28 -0400
Date: Sun, 28 Aug 2005 13:56:18 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM
Message-ID: <20050828115618.GE26065@gutek>
References: <20050828101721.GB26065@gutek>
	<200508281324.56314.mailinglist@krausam.de>
	<20050828104730.GC26065@gutek>
	<200508281354.40370.mailinglist@krausam.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200508281354.40370.mailinglist@krausam.de>
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
To: micha@krausam.de, LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Aug 28, 2005 at 01:54:38PM +0200, mailinglist@krausam.de wrote:
> Works for me.

Even if you put an empty CD-ROM or DVD into the drive and run
vgscan -v -v -v 2>&1 | grep cdrom ?

Then we must be using different lvm versions.

> 
> but my dev is /dev/cdrom if yours is /dev/cdrom1 try filter = 
> [ "r|/dev/cdrom1|" ]

OK, that are my filters now:

    filter = [ "r|/dev/hdb|" ]
    filter = [ "r|/dev/hdc|" ]
    filter = [ "r|/dev/cdrom|" ]
    filter = [ "r|/dev/cdrom1|" ]
    filter = [ "r|/dev/cdrom*|" ]
    filter = [ "r|/dev/cdrom.*|" ]

I have two DVD writers /dev/hd[ab] /dev/cdrom and /dev/cdrom1 are
softlinks to them.
vgscan still access them both.

Could anyone who knows the code comment on this?
Looks like I will be going to read it.

Thanks,
Chris

> 
> Am Sonntag, 28. August 2005 12:47 schrieb Chris Osicki:
> > On Sun, Aug 28, 2005 at 01:24:48PM +0200, mailinglist@krausam.de wrote:
> > > Try:
> > > filter = [ "r|/dev/cdrom|" ]
> >
> > Have you tried it?
> >
> > This doesn't work for me.
> >
> > Does anybody know the solution?
> >
> > Regards,
> > Chris
> >
> > > Am Sonntag, 28. August 2005 12:17 schrieb Chris Osicki:
> > > > Hi
> > > >
> > > > I seam not to be able to convince vgscan to let my cdroms alone.
> > > > In the file /etc/lvm/lvm.conf I have this filter:
> > > >
> > > > [ "r|/dev/cdrom.*" ]
> > > >
> > > > when I run vgscan -v -v I see the following:
> > > >
> > > >
> > > >       /dev/cdrom1: size is 31244 sectors
> > > >   /dev/cdrom1: read failed after 0 of 2048 at 0: Input/output error
> > > >       /dev/cdrom1: size is 31244 sectors
> > > >       /dev/cdrom1: No label detected
> > > >
> > > >
> > > > I tried other variants of this filter without luck.
> > > > On the laptop I'm writing this message on it took several minutes for
> > > > vgscan to finish. On another PC it doesn't take that long but is
> > > > annoying. How do I convince vgscan not to scan those devices?
> > > > I tried also such a filter as test:
> > > >
> > > > [ "r|/dev/pty.*" ]
> > > >
> > > > it didn't work either.
> > > >
> > > > I'm using
> > > >
> > > >   LVM version:     2.01.09 (2005-04-04)
> > > >   Library version: 1.01.00-ioctl (2005-01-17)
> > > >   Driver version:  4.4.0
> > > >
> > > > I would be very thankful for any help.
> > > >
> > > > Regards,
> > > > Chris
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@redhat.com
> > > > https://www.redhat.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > >
> > > --
> > > Micha Krause
> > >
> > > Jabber:	SMS-King@jabber.org
> > > Email:	mailinglist@krausam.de
> > >
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@redhat.com
> > > https://www.redhat.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> Micha Krause
> 
> Jabber:	SMS-King@jabber.org
> Email:	Micha@krausam.de
> 
> PGP:
> -----BEGIN PGP PUBLIC KEY BLOCK-----
> Version: GnuPG v1.4.1 (GNU/Linux)
> 
> mQGiBEKdhB0RBACNN7m5cfwk5NwowfHoqTDtPwPMikXmbrxAvsu9LPcs14lag3wt
> 0FsnGtHT0SUFRmSmz2YLJ0puLdKHmNrO+rItnjdgu/vVBLbCme39jSERjTO4OC/2
> bRoB21SAKFoxV8oGNgxrwhjk4MNdyGcGw/UbtI5MxplZyZXOGAV3TDS4rwCgpYwc
> 4PWDV1a5zYu+X5NPoo0XNFcD/3wFKxa4HHBQvstL8CcIEoapvHl0fczAy/4ZIxxJ
> KeJ1p6xoY6JfelfhhGSt7yzXPGljC1FxC7KQXUNCiUvKHO2vuz/X5jU+671nSGDz
> 6WUap1/NOkDBqDu9x3gjq7KpCdESK4KnULcf4tjqE1B6jU2Vfq3ebq/+AceQWP31
> uN5CA/9Wv4hQCMnJ+NwMLgjecA1PNQa3kPNQsuRbxYypUbg1IozfRh0sSqzbFGf+
> 88BUjY75jkm54IIV7olorF3t1zzYTs8weI13GP6ECV5juacYZ3+tNNW3AJfBNK5f
> zbJWSZ85wxdruwoUtk6ujE0XQN8VNUCS6FFFeFve3pE8DEr7+bQfTWljaGEgS3Jh
> dXNlIDxtaWNoYUBrcmF1c2FtLmRlPoheBBMRAgAeBQJCnYQdAhsDBgsJCAcDAgMV
> AgMDFgIBAh4BAheAAAoJEHwEeObQNvC4QncAoIgvjvIA68p2ekxktb8OQ0ATKnKQ
> AJ0Upj7UEzRLvuvZRnoefj/16lPmIbkCDQRCnYQjEAgA+CuAzxaEPyG3/fjOa54Z
> SiAMt2UBNj/8opoFM+tamX60KJIa03EqIafuKE/1tLGbL4936AKIIavoFIfDZBcl
> enYK/cb738H0e30FGvUl+SS2xuw4yNLbJRFMvR/U2XrjwRnwWrOV8FSX46UsaFoL
> a6yLAFMuxQI33mpd2GuInDLALM7IAxpER04MECynTqLD0kkNHC5XcnlASXMpJoeH
> w/ThHqoxT4GF5y3Fr8j1ujt0xA12eRxErAoHKMX1HDMmSAh2LA4VFoFCfnELBFJu
> cBnGCU10pYVCHy3qo0r6/iLB/etyLEOZM4mzAS8sUM+GfkA7mYFUtaMKUMRuVSPB
> ZwADBQgAvMPCaPC2Dmrj1HNSE1WQlA/TagkVOru8E3PoBgjbRSRgFS2WQKIJ+yAw
> drO2eX/eG+q4blVCQZD8QM17IMuKSRQj9YGxWbEMn/am5BnUA4W9THi4IHREFj/7
> 3rrLeER7y00KUvXc9grGe5BprjFrkbkbNbDz+N4PhX6D/5LKzrQ6c8yLQgKYCPf/
> GCXb+6aB3myvTMy0QaxiW/z59are5o5tjQRZXU1QoPnMcArK8Yk38StrU8efIjeu
> v6OgVau2pPF3PTSpl50TWXHVL1+yhBhYJRt08bXHRLwyDbAHL5EfunR+/gXN9bFy
> x15YdErTKjZkJCmdfOQHhICiMPTAc4hJBBgRAgAJBQJCnYQjAhsMAAoJEHwEeObQ
> NvC44JAAn092/z/Oe4FsFKmVGryK1hgbjTfLAJ9lYqKX52FmTbOF2Y5ci/il8Igs
> 2g==
> =G0+3
> -----END PGP PUBLIC KEY BLOCK-----
> 



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Chris Osicki osk@osk.ch
Dipl. Informatik-Ing. HTL
