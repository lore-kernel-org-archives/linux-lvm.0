Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA1HXo9F031295
	for <linux-lvm@redhat.com>; Sat, 1 Nov 2008 13:33:50 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA1HXnbs012643
	for <linux-lvm@redhat.com>; Sat, 1 Nov 2008 13:33:49 -0400
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id mA1HXmjc010547
	for <linux-lvm@redhat.com>; Sat, 1 Nov 2008 12:33:49 -0500
Received: from Jill-Mikesells-Computer.local (les2-openvpn.futuresource.com
	[10.200.1.18])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id mA1HXlK14546
	for <linux-lvm@redhat.com>; Sat, 1 Nov 2008 12:33:48 -0500
Message-ID: <490C92FB.50701@gmail.com>
Date: Sat, 01 Nov 2008 12:33:47 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot cloning
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<FDC38507-D7B2-4876-ABD5-3D595692EAC1@redhat.com>	<490929E0.30301@hidden.domain.name>
	<34299.89.200.148.101.1225535249.squirrel@wmail.comarch.com>
In-Reply-To: <34299.89.200.148.101.1225535249.squirrel@wmail.comarch.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

marcin.kaluza@comarch.pl wrote:
> There's another subject I'd like to raise here - snapshot cloning.
> Since we use snapshots for copying our (large) oracle databases for
> development and crash-test(especially crash test:) purposes, we needed to
> come up with a way to clone snapshots.
> 
> By the way - it's a cool way to copy databases and it's being used in
> solaris/zfs.

Zfs has a send/receive with an incremental mode for remote cloning.  Is 
there anything like that for lvm?

-- 
   Les Mikesell
    lesmikesell@gmail.com
