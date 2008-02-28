Received: from [10.13.248.156] (vpn-248-156.boston.redhat.com [10.13.248.156])
	by mail.boston.redhat.com (8.13.1/8.13.1) with ESMTP id
	m1SIWvCS016579
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2008 13:32:58 -0500
Subject: Re: [linux-lvm] I have started writing a KDE program for LVM
From: jim parsons <jparsons@redhat.com>
In-Reply-To: <a9e5040802281016g9497567vf1332f42791f8501@mail.gmail.com>
References: <269300.77497.qm@web57704.mail.re3.yahoo.com>
	<200802162126.09898.benscott@nwlink.com>
	<1203613838.3540.1.camel@localhost.localdomain>
	<200802221850.18136.benscott@nwlink.com>
	<a9e5040802281016g9497567vf1332f42791f8501@mail.gmail.com>
Date: Thu, 28 Feb 2008 13:32:57 -0500
Message-Id: <1204223577.3343.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Have you seen the gnome application system-config-lvm? There is also a
web based version which is part of conga...just thought you may wish to
know for due diligence purposes. 

-j

On Thu, 2008-02-28 at 13:16 -0500, Rob West wrote:
> In the version we use (2.02.21), there is a library interface
> (lvm2_run) that essentially allows one to run any LVM command and get
> its output without having to fork. The problem, of course, is the
> effort of parsing the output well.
> 
> - Rob
> 
> On Fri, Feb 22, 2008 at 9:50 PM, ben scott <benscott@nwlink.com> wrote:
> > On Thursday 21 February 2008 9:10:38 am Dave Wysochanski wrote:
> >  > On Sat, 2008-02-16 at 21:26 -0800, ben scott wrote:
> >  > >
> >
> > > > Also, has there been any progress towards an lvm library?
> >  >
> >  > Slow progress so far but it is being worked on.
> >  >
> >  > Do you have specific requirements and/or use cases you can share?  Are
> >  > they straightforward things such as pvcreate, vgcreate, lvcreate, and
> >  > displaying of PVs, VGs, and LVs, or are there more complicated things?
> >  >
> >  > Anything you can share would be appreciated.
> >
> >  Ultimately I would like to have a GUI interface that can do anything
> >  the CLI can do. However just having a library for reading the information
> >  like vgs, pvs and lvs would be really nice.
> >
> >  Thank you.
> >
> >
> >
> >  _______________________________________________
> >  linux-lvm mailing list
> >  linux-lvm@redhat.com
> >  https://www.redhat.com/mailman/listinfo/linux-lvm
> >  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
