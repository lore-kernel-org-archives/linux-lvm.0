Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11Kt3131042
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 15:55:03 -0500
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k11KstXk023349
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 15:54:55 -0500
Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <0456A130F613AD459887FF012652963F33ED0C@mail7.amherst.edu>
References: <0456A130F613AD459887FF012652963F33ED0C@mail7.amherst.edu>
Date: Wed, 01 Feb 2006 15:54:36 -0500
Message-Id: <1138827276.4762.88.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

i can confirm this. iet runs well with heavy io until you create many
snapshots. lvresize will be slow as well, though not hang. i think that
is because the outstanding bio? not quite since i faced that several
months ago.

ps, not lvm related, but if u stop iet for 5 seconds. i guess iscsi ini
will be unhappy? :P we can discuss in iet list.

ming

 
On Wed, 2006-02-01 at 13:39 -0500, Steffen Plotner wrote:
> Hi,
> 
> I apologize for looking up your machine. I have reported this problem
> sometime ago in November of last year.  
> 
> https://www.redhat.com/archives/linux-lvm/2005-November/msg00044.html
> 
> We currently deployed an iscsi-target (from sourceforge) server on FC4
> which functions well, until we utilize snapshots. The way I currently
> remove snapshots is to stop the iscsi-target daemon for 5 seconds, to
> let everything settle, then remove the snap, the restart the
> iscsi-target and all is ok (of course this is not how I would like to do
> things.. :).
> 
> I have tried several patches dm and lvm in late December and they did
> not help. I have specifics at my house. I will email those later on.
> Thank you for responding to this issue.
> 
> Steffen
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alasdair G Kergon
> Sent: Wednesday, February 01, 2006 1:31 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
> 
> On Wed, Feb 01, 2006 at 01:07:20PM -0500, Steffen Plotner wrote:
> > cd to a directory on an lv that has an active snapshot dd if=/dev/zero
> 
> > of=test bs=1M count=10000
>  
> > And see how hard it is to remove a live active snapshot. 
> 
> Strange - I don't recall anyone reporting that problem before.
> 
> I've just tried it here and the machine locked up:-(
> 
> Alasdair
> --
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
