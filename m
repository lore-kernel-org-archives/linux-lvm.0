Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1BM5S4g002058
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 17:05:29 -0500
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1BM3sDk010372
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 17:03:54 -0500
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail2.stercomm.com (Postfix) with ESMTP id B1F8B34003
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 17:03:53 -0500 (EST)
Subject: Re: [linux-lvm] About fstab and fsck
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Date: Wed, 11 Feb 2009 16:03:53 -0600
Message-Id: <1234389833.8851.3.camel@geeko>
Mime-Version: 1.0
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

On Wed, 2009-02-11 at 21:58 +0000, David Robinson wrote:
...
> Usually you'd want to have fsck enabled for your root filesystem, but
> by the looks of it the LV and filesystem you grew _is_ your root
> filesystem... so considering its size, I'd turn it off. Hopefully the
> "fsck takes _forever_" problem will die when btrfs becomes the
> standard filesystem.

I'm not aware of any feature in btrfs that will prevent
the fsck time issue on very large fs's.

Until something fairly radical happens in fs design, I'd avoid
very large fs's.

But if you know differently about btrfs... please share.
