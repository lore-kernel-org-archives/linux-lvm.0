Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DNSQi25330
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 18:28:26 -0500
Received: from steelemr-loadb-nat-49.caltech.edu (SteeleMR-loadb-NAT-49.caltech.edu [131.215.49.69])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DNSQb09517
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 18:28:26 -0500
Received: from earth-dog (earth-dog [192.168.1.3])
	by water-ox-postvirus (Postfix) with ESMTP id 8D4F426AC7E
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 15:28:20 -0800 (PST)
Received: from caltech.edu (good.work.caltech.edu [131.215.164.3])
	by earth-ox.its.caltech.edu (Postfix) with ESMTP id B9A00109BF7
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 15:28:19 -0800 (PST)
Message-ID: <402D5D93.7040802@caltech.edu>
From: Ling Li <ling@caltech.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm pvscan or vgscan very slow
References: <402C0D65.80905@caltech.edu> <20040212180824.O10533@homer.msp.redhat.com>
In-Reply-To: <20040212180824.O10533@homer.msp.redhat.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 18:27:06 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Alasdair G Kergon wrote:
> It shouldn't be that slow!
> Look at your system log and/or run with -vvv to see why it's so slow.

# lvm pvscan -vvv > ~/pvscan-list
# grep "Added to device cache" pvscan-list  | wc -l
   15813

I guess the number of devices to be scanned is just too large (and my 
computer is also a very slow one). Is there some way to specify a 
narrower range of devices to be scanned in LVM2?

> We've a couple of speed-ups that might help (one uses sysfs to reduce
> the number of devices to scan) - they're in the queue of things waiting
> to be checked into CVS after the repository move.
> I'll try to get them imported tomorrow.
This kind of patch will definitely help!

--Ling
