Received: from [10.36.4.167] (vpn1-4-167.ams2.redhat.com [10.36.4.167])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p06BxGhg018975
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 06:59:16 -0500
From: Joe Thornber <thornber@redhat.com>
In-Reply-To: <4082.44403.qm@web39301.mail.mud.yahoo.com>
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>
	<4082.44403.qm@web39301.mail.mud.yahoo.com>
Date: Thu, 06 Jan 2011 11:59:15 +0000
Message-ID: <1294315155.21712.91.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2011-01-05 at 10:34 -0800, Brian Neu wrote:
> So I'm seeing that this is actually 1 year to the day that Jonathan
> Brassow 
> f/Red Hat wrote that shared snapshots was the current priority.
> 
> http://www.redhat.com/archives/linux-lvm/2010-January/msg00012.html
> 
> I believe that's the term for what I'm seeking.  Any update? 

Shared snapshots is still top priority.  We ended up scrapping the first
design as it became apparent that people really wanted arbitrary depth
of recursive snapshots (snapshots of snapshots of snapshots ...) and we
hadn't allowed for that.

Currently myself and Heinz are working full time on the kernel side.
This includes a new metadata transaction library that will be used by
shared snaps, thin provisioning and hierarchical storage.  Expect an
experimental version of thin-provisioning sometime in January.  The
others should follow swiftly since they all have a lot of common code.
I'm not sure how long it will take to get from 'experimental' to
'production ready', obviously the more people that help us test, the
quicker this process will be.

- Joe
