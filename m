Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11Mme106508
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 17:48:40 -0500
Received: from smtpout03-04.mesa1.secureserver.net
	(smtpout03-04.mesa1.secureserver.net [64.202.165.74])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k11MmUh9024906
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 17:48:30 -0500
Message-ID: <43E1358C.2010005@starnetworks.us>
Date: Wed, 01 Feb 2006 16:26:20 -0600
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
References: <43E0E3E3.3030407@starnetworks.us>	<1138829354.26648.85.camel@seki.nac.uci.edu>
	<1138830708.15727.20.camel@pc.ilinx>
In-Reply-To: <1138830708.15727.20.camel@pc.ilinx>
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

Brian J. Murrell wrote:

> Indeed (and to keep quite on topic), perhaps rather than hardlink trees,
> LVM snapshots would be even more space efficient.  Maybe that is what
> this thread has been about.  I just jumped in.  Apologies if it was.

No, I'm using snapshots to make rsync backups onto removable drives (so 
the hardlink tree method won't work for me either).
