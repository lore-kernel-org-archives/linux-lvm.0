Message-ID: <1332005463.13726.2.camel@maxim-laptop>
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 17 Mar 2012 19:31:03 +0200
In-Reply-To: <20120317161220.GA12111@agk-dp.fab.redhat.com>
References: <CA+6TzyL_vM717b7Atw+Y9zN4tHeAqoisYmTwUAmJxPeB+zzv1w@mail.gmail.com>
	<4F645D81.3010002@redhat.com>
	<20120317161220.GA12111@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Subject: Re: [linux-lvm] lvm fails when /proc/devices contains "-1 smblk"
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: John Mesmon <jmesmon@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2012-03-17 at 16:12 +0000, Alasdair G Kergon wrote: 
> > Dne 16.3.2012 07:28, John Mesmon napsal(a):
> > > Block devices:
> > >  -1 smblk
> 
> That's outside the range of valid major numbers and surely shouldn't be getting
> exposed to userspace in /proc/devices.
> 
> static struct mtd_blktrans_ops sm_ftl_ops = {
>         .name           = "smblk",
>         .major          = -1,
> 
> Why's -1 being used?
> 
> Alasdair

Woops. I accidentally assigned it 4096 major.
I probably thought that it will get me dynamic major number, sorry!
Will fix soon!

Best regards,
Maxim Levitsky
