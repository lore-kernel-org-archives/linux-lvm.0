Return-Path: <james@fr.clara.net>
Date: Fri, 2 Feb 2001 14:46:51 +0100 (CET)
From: JAmes <james@fr.clara.net>
Subject: Re: [linux-lvm] startup stuff an dnew question :-)
In-Reply-To: <20010202135316.A1353@srv.sistina.com>
Message-ID: <Pine.LNX.4.21.0102021438490.380-100000@munster.noc.fr.clara.net>
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

It works ! Thanks to everybody who helped. I am too used to debian
packages doing all for you.

/etc/rcS.d is the one that worked. So has init2 got anything to do with 
/etc/rc2.d ???

Another question I have is can anybody show me a good install plan, a
partition scheme for a machine where everything but the / is lvm'ed. I
haven't seen this discussed anywhere. At the moment I am just testing on a
box with a partition / a swap and a /home . 

If I did a standard installation using say 5 partitions / /usr /var/ /home
swap, it would be a pain transferring this to an lvm system. So how do you
lot do it ?

my partitions at the moment

 Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       608   4883728+  83  Linux
/dev/hda2           609       627    152617+  82  Linux swap
/dev/hda3           628       749    979965   83  Linux
/dev/hda4           750      1601   6843690    5  Extended
/dev/hda5           750       871    979933+  8e  Linux LVM
/dev/hda6           872       993    979933+  8e  Linux LVM
/dev/hda7           994      1601   4883728+  8e  Linux LVM

Thanks again.
 

On Fri, 2 Feb 2001, Heinz J. Mauelshagen wrote:

> 
> Please have a look at Holger Grothe's related comment and check,
> if Symlink etc. is set up correctly.
> 
> Heinz
> 
> On Fri, Feb 02, 2001 at 12:02:00PM +0100, JAmes wrote:
> > 
> > Hello
> > 
> > I did what you suggested but nothing happens attall! I may be wrong but I
> > have the impression that on a normal restart on rc2.d is 'looked' at.
> > 
> > > You surely mean "vgchange -ay".
> > 
> > yep :-)
> > 
> > help :-)
> > 
> > On Fri, 2 Feb 2001, Heinz J. Mauelshagen wrote:
> > 
> > > On Fri, Feb 02, 2001 at 10:02:17AM +0100, JAmes wrote:
> > > > 
> > > > Hello
> > > > 
> > > > I am using debian Linux, and have farely successfully installed LVM. I
> > > > have just to do the lvcreate -ay at startup. I assume that thi smust go in
> > > 
> > > You surely mean "vgchange -ay".
> > > 
> > > > 
> > > > /etc/rc2.d 
> > > > 
> > > > but using what S??
> > > 
> > > It must run after boot in order to activate VGs before any accesses to
> > > LVs (for eg. containing filesystems) take place and after modules were loaded.
> > > 
> > > Use one of the /etc/init.d/ scripts as a template to create
> > > /etc/init.d/lvm containing "vgscan;vgchange -ay".
> > > 
> > > Create a symlink /etc/rcS.d/S25lvm pointing to this file please.
> > > 
> > > > 
> > > > Any help extremely apreciated...
> > > > 
> > > > James
> > > > 
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > 
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
