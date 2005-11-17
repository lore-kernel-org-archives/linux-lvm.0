Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAHGdvV00793
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 11:39:57 -0500
Received: from jade.spiritone.com (jade.aracnet.com [216.99.193.136])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAHGdpql008528
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 11:39:55 -0500
Received: from tinman.seitzassoc.com (helium.seitzassoc.com [216.99.217.243])
	by jade.spiritone.com (8.13.4/8.12.8) with ESMTP id jAHGdjEB011092
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 08:39:45 -0800
Received: from tinman.seitzassoc.com (localhost [127.0.0.1])
	by tinman.seitzassoc.com (Postfix) with ESMTP id D9356BE8E
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 08:39:44 -0800 (PST)
Subject: Re: [linux-lvm] Not allowed to fill filesystem to 100%??? 
In-Reply-To: Your message of "Thu, 17 Nov 2005 11:10:44 EST."
	<1d219a6f0511170810g7dda5266j830bf5d2d22e1313@mail.gmail.com> 
Date: Thu, 17 Nov 2005 08:39:39 -0800
From: Galen Seitz <galens@seitzassoc.com>
Message-Id: <20051117163944.E08C58F12@tinman.seitzassoc.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Chris Hoover <revoohc@gmail.com> wrote:

> Question,
> 
> We have created some 300 GB lvm2 (RH 4.0 AS)  filesystems for our
> PostgreSQL databases.  However, we tried to copy one of the larger
> filesystems over to the new lvm filesystem and the copy abended due to
> being.  The system was reporting that the file system was 100% full
> with 0 blocks free.  However, a df reported almost 16GB free.
> 
> What's up with this?  Why is this large amount of space unavailable to
> a normal user?

If it's an ext2/3 filesystem, the default reserved space is 5%.  Check
the man pages for mke2fs and tune2fs.

galen
