Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n0SGujFI023694
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 11:56:46 -0500
Message-ID: <49808E4B.7080804@redhat.com>
Date: Wed, 28 Jan 2009 17:56:43 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Size of the mirror log?
References: <20090128085024.GA14023@lupe-christoph.de>
	<20090128162636.GA12514@us.ibm.com>
In-Reply-To: <20090128162636.GA12514@us.ibm.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

malahal@us.ibm.com wrote:
> Lupe Christoph [lupe@lupe-christoph.de] wrote:
>> I'm unable to find any information on how the size of the mirror log is
>> determined. Right now I only have four volumes of 1GB each to test this,
>> obviously too little. We will be getting a few 128GB volumes soon, but I
>> would rather have a formula than some test results...
>>
>> I presume the size will depend on the number of mirror regions, but how
>> much log does a region require?
> 
> Currently the log size is fixed at 1 PE (4MB by default). It is always a
> 1 PE.

Since LVM2 2.02.44 release mirror log size is properly calculated and can
be higher, it is not fixed to 1 PE anymore.


Milan
--
mbroz@redhat.com
