Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11IdV109124
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 13:39:31 -0500
Received: from mail7.amherst.edu (mail7.amherst.edu [148.85.136.41])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k11IdN0j018050
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 13:39:23 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(
Date: Wed, 1 Feb 2006 13:39:22 -0500
Message-ID: <0456A130F613AD459887FF012652963F33ED0C@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
Content-Transfer-Encoding: 8bit
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

Hi,

I apologize for looking up your machine. I have reported this problem
sometime ago in November of last year.  

https://www.redhat.com/archives/linux-lvm/2005-November/msg00044.html

We currently deployed an iscsi-target (from sourceforge) server on FC4
which functions well, until we utilize snapshots. The way I currently
remove snapshots is to stop the iscsi-target daemon for 5 seconds, to
let everything settle, then remove the snap, the restart the
iscsi-target and all is ok (of course this is not how I would like to do
things.. :).

I have tried several patches dm and lvm in late December and they did
not help. I have specifics at my house. I will email those later on.
Thank you for responding to this issue.

Steffen

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Alasdair G Kergon
Sent: Wednesday, February 01, 2006 1:31 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(

On Wed, Feb 01, 2006 at 01:07:20PM -0500, Steffen Plotner wrote:
> cd to a directory on an lv that has an active snapshot dd if=/dev/zero

> of=test bs=1M count=10000
 
> And see how hard it is to remove a live active snapshot. 

Strange - I don't recall anyone reporting that problem before.

I've just tried it here and the machine locked up:-(

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
