Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2GKjviJ018143
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2011 16:45:57 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2GKjluA009715
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2011 16:45:48 -0400
Message-ID: <4D812183.6000901@cfl.rr.com>
Date: Wed, 16 Mar 2011 16:45:55 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
In-Reply-To: <20110314171726.GA18249@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ron Johnson <ron.l.johnson@cox.net>, Mike Snitzer <snitzer@redhat.com>

On 3/14/2011 1:17 PM, Mike Snitzer wrote:
> Both LVM2 and Device Mapper have been updated to accommodate stacking
> such a mix of drives.
> 
> See this for a bit more detail:
> http://people.redhat.com/msnitzer/docs/io-limits.txt
> 
> Particularly, the "Stacking I/O Limits" section.
> 
> The concern raised for partial (4k) writes to the 512b drive was
> discussed a bit more here: http://lkml.org/lkml/2010/2/22/295

Unfortunately this does not help with the WD EARS model drives ( are
there any other 4kb sector drives on the market now? ), since they lie
and report that they have 512 byte sectors.
