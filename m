Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0SGRBNa013082
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 11:27:11 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0SGQqM5017650
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 11:26:52 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n0SGOm83005793
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 09:24:48 -0700
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n0SGQbWE138156
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 09:26:38 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n0SGQbrw005815
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 09:26:37 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n0SGQajo005810
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 09:26:37 -0700
Date: Wed, 28 Jan 2009 08:26:36 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Size of the mirror log?
Message-ID: <20090128162636.GA12514@us.ibm.com>
References: <20090128085024.GA14023@lupe-christoph.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090128085024.GA14023@lupe-christoph.de>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Lupe Christoph [lupe@lupe-christoph.de] wrote:
> Hi!
> 
> I'm unable to find any information on how the size of the mirror log is
> determined. Right now I only have four volumes of 1GB each to test this,
> obviously too little. We will be getting a few 128GB volumes soon, but I
> would rather have a formula than some test results...
> 
> I presume the size will depend on the number of mirror regions, but how
> much log does a region require?

Currently the log size is fixed at 1 PE (4MB by default). It is always a
1 PE.
