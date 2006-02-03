Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k13Dwg123620
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 08:58:42 -0500
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k13Dwasb015502
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 08:58:36 -0500
Subject: Re: [linux-lvm] Question about hardware LVM
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <200602022341.46808.krakrjak@volumehost.net>
References: <7cce3190602021308n184bcc43m@mail.gmail.com>
	<1138917679.7774.148.camel@localhost.localdomain>
	<200602022341.46808.krakrjak@volumehost.net>
Date: Fri, 03 Feb 2006 08:58:16 -0500
Message-Id: <1138975096.10549.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
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
To: Zac Slade <krakrjak@volumehost.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2006-02-02 at 23:41 -0600, Zac Slade wrote:
> On Thursday 02 February 2006 16:01, Ming Zhang wrote:
> > linux seems can not handle the read_capacity data changed msg from san.
> > so probably u will need to grow it, reconnect from linux, find the
> > changed size, then run fs tools to grow it.
> Neither can many other *nix hosts.  Usually growing is handled at the host 
> level after the LUNs have been increased in size on the SAN.

the point here is whether host can handle it on the fly, or need a
reboot&re-detect.


> 
> > > I have been successfully using LVM on RedHat Linux Server with no
> > > hassle. We are now deploying a $BIGVENDOR expensive FiberChannel SAN.
> > > One of the main features of this SAN is that is able to grow a
> > > filesystem
> Not exactly your terminology is wrong here.  What you mean to say is that one 
> of the main features of a SAN environment is that you can grow LUNs you 
> present to hosts.

think so, unless some $bigname san is file system aware and can do that.
but i do not see any point to do that file system grow from a san point
of view. the sole purpose of san is to export a disk like device.

> 
> > > How does Linux handle this? Do I still have to use LVM? If I still
> > > have to use LVM I do NOT see the point of "hardware base growing".
> > > Simply, create a new LUN in the SAN and I can join to our LVM setup.
> Well to put it bluntly no you don't need LVM just to grow a filesystem from a 
> presented LUN on a SAN.  However if you'd like to use the SAN storage for 
> many filesystems or as a way to offset local storage than you do need volume 
> management.  Enter LVM.

i think this is where to do volume management, or where to do storage
virtualization. if you use linux lvm, it is host based. if u use san
ability, it is array/san based.

> 
> Other considerations in this setup are growing filesystems.  These include 
> JFS, XFS, Reiserfs and some consider ext3 capable for this job (it does have 
> resizing tools check your distros docs).  If you need to shrink filesystems 
> your only real option is Reiserfs.  I will not go into more detail about 
> these filesystems, because you need to evaluate each systems needs and 
> application requirements to determine a filesystem to utilize.  There are 
> plenty of docs on the web with benchmarks and explanations of each.  Do your 
> homework here this is important.
> 
> > > Maybe this is a "Storage 101" questio, but I do not fully understand
> > > expensive SAN "hardware based"  filesystem grow.
> This is Storage 101.  Something you must understand is that LUNs on a SAN 
> might as well be hard disks in a server.  They are block devices that are 
> underneath volume management that is also underneath filesystems.  You will 
> have to maintain the systems on their own.  When a systems needs more space 
> you grow the LUN, then you grow the volume under your volume management 
> software (LVM here) then you grow your filesystem.  Read up on the tools you 
> are using and get a firm understanding of how each one works in the ways you 
> need.

if can grow the lun at san side, a linux lvm might not be needed. so the
layer is file system on top of san exported lun already.

> 
> I hope this sheds some light on what you are getting into.  SANs can be 
> complicated.  Volume management can be a complicated subject.  However, you 
> will have to understand how these fit together in your environment to make 
> good decisions moving forward.

ps, we still misuse LU and LUN. LUN = LU Number. so in most place, we
should use LU instead of LUN. but everybody know this, another storage
101.

ming
