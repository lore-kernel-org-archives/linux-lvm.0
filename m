Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6MKVoXw002474
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 16:31:50 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6MKVK6P032576
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 16:31:20 -0400
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <1c748a490807220907x19fa0990occ05853440884fcb@mail.gmail.com>
References: <1216674096.7888.5.camel@corn.betterworld.us>
	<1216674897.20588.14.camel@behemoth.csg.stercomm.com>
	<1216700602.7888.37.camel@corn.betterworld.us>
	<1c748a490807220907x19fa0990occ05853440884fcb@mail.gmail.com>
Date: Tue, 22 Jul 2008 13:31:14 -0700
Message-Id: <1216758674.20426.12.camel@iron.psg.net>
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

On Tue, 2008-07-22 at 09:07 -0700, Larry Dickson wrote:
> Perhaps I'm being unfair, but making valuable stuff depend on md raid1
> scares me. We've had trouble when an event happens (i.e. primary goes
> bad) and have had to do stuff by hand. 
I thought raid 1 handled that kind of situation automatically. Am I
under a mistaken impression, or is it just that other things can go
wrong easily?  I know raid 1 and 5 are both vulnerable until the
redundancy is reconstructed.
> For real peace of mind, I would think of a backup strategy involving
> another system; snapshot is nice for that. Perhaps your unused big
> disk could go on that system. Just a practical note.
It won't be unused for long, and since some stuff to backup goes there,
I think I need to put the on-disk backup somewhere else.  Spreading
things out across disks should also speed up the backup, which is
sometimes very slow.
Ross
