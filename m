Return-Path: <root@srv.sistina.com>
Date: Fri, 13 Jul 2001 13:07:33 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Oops ...
Message-ID: <20010713130733.B32198@sistina.com>
References: <003601c10af5$102a56c0$0f01a8c0@ws1> <20010713093946.C1563@btconnect.com>
Mime-Version: 1.0
In-Reply-To: <20010713093946.C1563@btconnect.com>; from thornber@btconnect.com on Fri, Jul 13, 2001 at 09:39:46AM +0100
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

On Fri, Jul 13, 2001 at 09:39:46AM +0100, Joe Thornber wrote:
> All,
> 
> Do not use the current CVS code on existing VG's, and certainly not on
> production systems.  I thought this had been mentioned on the list
> before.

Yes it has!

Please be aware, that actual CVS represent the project under construction
and that you are on your own if you retrieve LVM from there.

There's rare cases in which we'll recommend to use it in order to address
paricular problems you face.

Rule is: get CVS on your own risk unless told by us.

Thanks for your understanding :-)

Regards,
Heinz    -- The LVM Guy --



> 
> Changes have been made to the PE locations !
> 
> Bas: you need to roll back your tools to beta7, the CVS kernel driver
> should be ok.
> 
> - Joe
> 
> On Thu, Jul 12, 2001 at 07:06:59PM +0200, Bas wrote:
> > Hi,
> > 
> > I'm afraid I'm not able to get more details right now, if necessary I'll get
> > 'm later on, but I don't like playing with my filesystems ...
> > 
> > Kernel 2.4.6
> > CVS LVM of 11 July 2001
> > an XFS enabled kernel
> > devfs 1.82.
> > 
> > Boots fine, loads the LVM driver, but after it oopses after running
> > vgchange -a y (line 4, linuxrc).
> > 
> > What can I do ?
> > 
> > Thanks,
> > Bas.
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
