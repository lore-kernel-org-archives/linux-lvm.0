Received: from [10.40.200.18] (ovpn-200-18.brq.redhat.com [10.40.200.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GGr6q0022610
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 12:53:07 -0400
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
	<56E89311.1030408@gmail.com> <D30DED20.19EAC%stdake@cisco.com>
	<56E913F2.60702@gmail.com> <D30EAF21.19F62%stdake@cisco.com>
	<56E97633.10009@gmail.com>
	<f32b76594fa14b509a7a196f0e626ebc@XCH-ALN-006.cisco.com>
	<22249.32509.637353.254269@quad.stoffel.home>
	<2bc132f8b3b94d41aaedec98332a4675@XCH-ALN-006.cisco.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56E98F71.5000706@redhat.com>
Date: Wed, 16 Mar 2016 17:53:05 +0100
MIME-Version: 1.0
In-Reply-To: <2bc132f8b3b94d41aaedec98332a4675@XCH-ALN-006.cisco.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] disabling udev_sync and udev_rules
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 16.3.2016 v 17:17 Serguei Bezverkhi (sbezverk) napsal(a):
> Hi John,
>
> At least in our situation, Dockers do not own LV and nothing prevents in theory LV created by a process in one container, to be removed by another process in another container. It is exactly the same if two processed are trying to do the same thing.  In both cases if a volume is busy no process will be able to remove it.
>
> In our case, dockers are more like process wrapper, it does not holds any resources other than it needs to run this one process.
>
> I hope it clarifies a bit the approach we took.
>

Giving docker container root privileges to execute lvm2 command (or in effect 
any other root commands!) is just not the docker is supposed to be used (IMHO).

You are just making the security hole bigger and bigger...

But I assume there is no way to convince you it's serious mistake with this 
approach...

Regards

Zdenek


>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of John Stoffel
> Sent: Wednesday, March 16, 2016 11:43 AM
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Subject: Re: [linux-lvm] disabling udev_sync and udev_rules
>
>
> So what's to keep a docker container from deleting all your other LVs that it shouldn't know about?
>
> If I have a VG called coontainers, with a bunch of LVs called c1, c2, ... , cN.
>
> What is to keep c1 from nuking the LV in c2?
>
> John
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
>
