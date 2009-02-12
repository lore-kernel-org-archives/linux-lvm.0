Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1CKHIVG018345
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 15:17:19 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n1CKHFWE018581
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 15:17:16 -0500
Message-ID: <499483E1.3020509@redhat.com>
Date: Thu, 12 Feb 2009 20:17:37 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: About fstab and fsck
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>	<68c491a60902120038g6cede40ckaa5ae58600f5ff21@mail.gmail.com>
	<jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>
In-Reply-To: <jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Stefan Monnier wrote:
>>> filesystem... so considering its size, I'd turn it off. Hopefully the
>>> "fsck takes _forever_" problem will die when btrfs becomes the
>>> standard filesystem.
> 
>> Just a reminder: Linux has xfs since 2002. A full-blown fsck on xfs is
>> a rare thing.
> 
> Similarly, I don't know of any case where fsck on an ext3 partition
> turned out to be useful.  As a matter of fact, my home router's ext3

I wouldn't go that far. It all depends what messed the file system up 
in the first place. Ext3 bugs, minor scribbling and suchlike generally 
get tidied up reasonably well by e2fsck. It's quite true that with 
major corruption to the file system there's often not an awful lot 
left afterwards but that's true of many other file systems as well.

> partition is never fsck'd (it would take way too much time to this poor
> 266MHz thingy to fsck my 1TB filesystem).

/me wonders why a router needs a 1TB fs :-)

Bryn.
