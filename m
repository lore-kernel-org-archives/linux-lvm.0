Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GLJ4u3026141
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:19:04 -0400
Received: from campbell-lange.net (no.rdns-yet.ukservers.com [78.110.169.69]
	(may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GLInxj008322
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:18:50 -0400
Date: Mon, 16 Jun 2008 22:18:44 +0100
From: Veselin Kantsev <veselin@campbell-lange.net>
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
Message-ID: <20080616211844.GL3765@campbell-lange.net>
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org>
	<20080616141907.GH3765@campbell-lange.net>
	<48567DF8.7080600@wpkg.org>
	<20080616151014.GJ3765@campbell-lange.net>
	<4856BC88.4060602@wpkg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4856BC88.4060602@wpkg.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Thomas,
I think I've misunderstood the concept of snapshots.

So If I have 7 snapshots of the same volume (created at different times)
and a file is changed, would the change affect all 7 snapshots or 
just the latest one created?

If the former, then I imagine changing a 1GB+ file, in my
situation will result in an unpleasant experience with the LVM snapshots.


Regards,
Veselin

On Mon, Jun 16, 2008 at 09:18:32PM +0200, Tomasz Chmielewski wrote:
> Veselin Kantsev schrieb:
>
>> The snapshots are 180GB each.
>
> So that makes 7 snapshots, each is 180GB? What percentage is filled?
>
>
>> The current writing process freezes and working with the LV becomes
>> impossible both locally and through the network.
>
> LVM-2 doesn't scale very well.
>
> If you have I/O intensive workloads, I'd discourage using (multiple)  
> snapshots.
>
> A single write to the origin mean additional writes to each and every  
> snapshot of that origin.
>
>
> -- 
> Tomasz Chmielewski
> http://wpkg.org
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
