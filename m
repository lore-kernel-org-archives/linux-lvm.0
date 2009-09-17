Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HNR7tn026874
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 19:27:07 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8HNQvB4002518
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 19:26:58 -0400
Received: from ns1.futuresource.com ([10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n8HNQu9a001488
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:26:57 -0500
Received: from [10.207.193.131] (xplmikesell.esignalcorp.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n8HNQsC11172
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:26:55 -0500
Message-ID: <4AB2C5BC.5040804@gmail.com>
Date: Thu, 17 Sep 2009 18:26:52 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
References: <1253109566.5326.15.camel@delo.gdit>	<20090916181947.GB15438@us.ibm.com>	<1253127828.3243.1.camel@delo.gdit>	<1253181956.30299.25.camel@breeves.fab.redhat.com>	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>	<1253201655.2339.178.camel@pc.interlinx.bc.ca>
	<Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
>  
> Those with money to burn seem to favor SANs. (And cloning a PV with
> a SAN and importclone is an easy solution to the OP problem - if only they had
> a SAN.) I'm part of the Po' Fo'k contingent.

Is a SAN something you can emulate with an iscsi target on fairly normal 
equipment?

-- 
   Les Mikesell
    lesmikesell@gmail.com
