Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MG3elG015221
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 12:03:40 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3MG3XTl028212
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 12:03:33 -0400
Subject: Re: [linux-lvm] LVM. Do i loose everything?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <200604211712.42503.sgrover@open2space.com>
References: <4442C7D0.40206@ee.duth.gr>
	<200604211712.42503.sgrover@open2space.com>
Date: Sat, 22 Apr 2006 12:03:14 -0400
Message-Id: <1145721795.22776.36.camel@localhost.localdomain>
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

On Fri, 2006-04-21 at 17:12 -0600, Shawn wrote:
> On Sunday 16 April 2006 16:40, kyr wrote:
> > Hello,
> >
> >      I wound be thankful if you can answer one simple question that I
> > haven't found the answer in all the LVM manuals, FAQ, howtos.
> >
> > I have a continuous (not stiped) VG consisting of 3 PV (Hard Disks) with
> > one LV on EXT3.
> >
> > If one hard disk fails (hardware) will i loose everything on all disks?

depends on how we define "disk fails" then.

> 
> I'm far from an expert with LVM, but I think the answer is a safe No.  And 
> even further, you could possibly recover the data on the damaged drive (see 
> http://grover.open2space.com/node/17).

if disk has some bad sectors but most other places are readable, then
dd_rescue will be more than enough and follow this link should be ok.
thanks for pointing out this link.


> 
> The data stored on that particular drive might become in accessible (without 
> any recovery efforts), but the data sitting on the other drives should still 
> be there.  

yes, data is there.

> 
> I'm taking a guess based on what I saw during a data recovery process, but...  
> It looks like the drive/partition is tagged as being part of a volume, and 
> then the appropriate file system is applied.  If this is the case, then 
> loosing a drive should not corrupt your filesystem on the remaining drives.  

if it is single file system over all 3 HDs, then will the file system
runs ok? i do not think so.


> 
> I am not comfortable enough with my knowledge to say this is anywhere near 
> authoritative.  But I do hope I helped...
> 
> Shawn
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
