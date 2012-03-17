Date: Sat, 17 Mar 2012 16:12:20 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120317161220.GA12111@agk-dp.fab.redhat.com>
References: <CA+6TzyL_vM717b7Atw+Y9zN4tHeAqoisYmTwUAmJxPeB+zzv1w@mail.gmail.com>
	<4F645D81.3010002@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F645D81.3010002@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: John Mesmon <jmesmon@gmail.com>, maximlevitsky@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> Dne 16.3.2012 07:28, John Mesmon napsal(a):
> > Block devices:
> >  -1 smblk

That's outside the range of valid major numbers and surely shouldn't be getting
exposed to userspace in /proc/devices.

static struct mtd_blktrans_ops sm_ftl_ops = {
        .name           = "smblk",
        .major          = -1,

Why's -1 being used?

Alasdair
