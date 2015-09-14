Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8EJGtHJ019730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2015 15:16:56 -0400
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mx1.redhat.com (Postfix) with ESMTPS id 11D97FA9CE
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2015 19:16:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8EJGsEi020797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2015 12:16:54 -0700 (PDT)
Message-ID: <55F71D24.9010903@windriver.com>
Date: Mon, 14 Sep 2015 13:16:52 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <55F70C58.5010205@windriver.com> <55F71650.7070907@redhat.com>
In-Reply-To: <55F71650.7070907@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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

On 09/14/2015 12:47 PM, Zdenek Kabelac wrote:
> Dne 14.9.2015 v 20:05 Chris Friesen napsal(a):
>> Hi,
>>
>> I'm running a 3.10 kernel with LVM 2.02.95.
>>
>> I'm running into a problem where activating snapshots can take quite a long
>> time, roughly one minute per 25GB of delta between the snapshot and the origin
>> volume.  (See below for my test procedure.)
>>
>> I realize that my kernel/LVM aren't exactly bleeding edge, and I wondering
>> whether more recent versions have done anything to speed up the activation
>> process (like maybe making it more lazy-loaded rather than reading in a bunch
>> of data up-front).
>>
>> If anyone is aware of such improvements, I'd appreciate it if you could point
>> me at the appropriate changes.
>
> Hi
>
> There is NO way to accelerate your existing setup, other then placing delta on
> SSD - the format of snapshot was meant to be used 'temporarily' - i.e. until you
> take backup of LV - but not for long-term multi-gigabyte case.
>
> This is major mis-use of this 'snapshot' feature - which repeats over and over...
>
> If you want to use long-living snapshots - you need to use thin-provisioning,

Thanks for the quick response.

Presumably we would still have multi-GB of delta between the original volume and 
the snapshot, so what would make the activation of a thin-provisioned snapshot 
faster?  Is the metadata stored differently?

Chris
