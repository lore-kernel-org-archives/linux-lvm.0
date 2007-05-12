Received: from [10.13.248.15] (vpn-248-15.boston.redhat.com [10.13.248.15])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4CJpaZd010890
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 15:51:37 -0400
Subject: Re: [linux-lvm] Restoring data after losing a drive
From: Ian Kent <ikent@redhat.com>
In-Reply-To: <230d1df80705112029w7b4b9fd0ncf7a733363b44705@mail.gmail.com>
References: <230d1df80705112029w7b4b9fd0ncf7a733363b44705@mail.gmail.com>
Date: Sun, 13 May 2007 03:51:34 +0800
Message-Id: <1178999494.4538.3.camel@shark.themaw.net>
Mime-Version: 1.0
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

On Fri, 2007-05-11 at 23:29 -0400, Saad Shakhshir wrote:
> I lost one of my drives that was a physical volume in my lvm.  The
> volume group spanned across all the drives and so did the logical
> volume.  I know that the data on the good drives is still intact I
> just don't know how to get the lvm up and running again to be able to
> read the data. 
> 
> I tried running 'vgreduce --removemissing fileserver' and that managed
> to restore my other small logical volume that was located entirely on
> one of the (still good) physical volumes.  The other large logical
> volume is still not showing up. 
> 
> I'm going to attach the last good configuration from /etc/lvm/archive
> The drive that died was pv0.  
> 
> I really hope that someone can help with this.  It's terrible losing
> so much data... 

I don't understand the question.
How will LVM know what was contained in the blocks on the failed disk?

I think you'll need to restore the damaged volume from backup.

Ian
