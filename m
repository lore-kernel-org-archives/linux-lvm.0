Received: from localhost (vpn1-5-17.ams2.redhat.com [10.36.5.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1S9wNti001808
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2013 04:58:24 -0500
Date: Thu, 28 Feb 2013 09:58:23 +0000
From: thornber@redhat.com
Message-ID: <20130228095822.GA3013@raspberrypi>
References: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
	<20130227100446.GB2459@raspberrypi>
	<CAEZ+n-gv=9Gdg8b3xKW5JraNVvRhc3fqiYUvL+6vt4Wrdda02A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEZ+n-gv=9Gdg8b3xKW5JraNVvRhc3fqiYUvL+6vt4Wrdda02A@mail.gmail.com>
Subject: Re: [linux-lvm] How does LVM-Cache work?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Feb 27, 2013 at 03:30:47PM -0300, Leo Antonio wrote:
> Thanks for answers.
> 
> 
> I take a look in dm-cache-target, I really dont knew this project.
> 
> Joe, what is the best way to continue this discussion?
> 
> Do you have some documentation besides what is into kernel source, like
> Papers, Architecture Projects etc?
> What is the best way to start to understand this?

The best place to start is by reading
Documentation/device-mapper/cache.txt and trying it out a bit.  Then
read drivers/md/dm-cache-policy.h which defines the interface that
policies use.  Finally look at dm-cache-policy-mq.c (multiqueue
policy).  This should give you a good idea of the responsibilities of
a policy.

An alternative project would be creating a framework for assessing
cache policies.  Not just providing a range of different cache loads
(though that is a big important part), but also providing feedback to
the policy developer as to how their policy could be improved.  I'd like
to see a tool that calculates the optimimum series of
promotions/demotions for a given io load and so comes up with a
theoretical 'best' performance.

- Joe
