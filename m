Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1E07fi02188
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 19:07:41 -0500
Received: from steelemr-loadb-nat-49.caltech.edu (SteeleMR-loadb-NAT-49.caltech.edu [131.215.49.69])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1E07eb19605
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 19:07:40 -0500
Received: from water-dog (water-dog [192.168.1.26])
	by earth-ox-postvirus (Postfix) with ESMTP id 41495109A7B
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 16:07:35 -0800 (PST)
Received: from caltech.edu (good.work.caltech.edu [131.215.164.3])
	by earth-ox.its.caltech.edu (Postfix) with ESMTP id 6AA62109A7B
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 16:07:34 -0800 (PST)
Message-ID: <402D66C6.5090906@caltech.edu>
From: Ling Li <ling@caltech.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm pvscan or vgscan very slow
References: <402C0D65.80905@caltech.edu> <20040212180824.O10533@homer.msp.redhat.com> <402D5D93.7040802@caltech.edu> <20040213173423.C14206@homer.msp.redhat.com>
In-Reply-To: <20040213173423.C14206@homer.msp.redhat.com>
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
Date: Fri Feb 13 19:07:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


Alasdair G Kergon wrote:
> On Fri, Feb 13, 2004 at 03:28:19PM -0800, Ling Li wrote:
> 
>>I guess the number of devices to be scanned is just too large (and my 
>>computer is also a very slow one). Is there some way to specify a 
>>narrower range of devices to be scanned in LVM2?
> 
>  
> The filter lines in lvm.conf.  See doc/example.conf and man lvm.conf.

Got it. The man page says lvm.conf is only loaded during the 
"initialization phase of LVM." Does this mean I have to reboot the 
computer for the new lvm.conf to be in effect? Can I just send some 
signal to some process?

--Ling
