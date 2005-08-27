Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7RGfEV19777
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 12:41:14 -0400
Received: from basie.internet2.edu (basie.internet2.edu [207.75.164.22])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7RGfBOv020625
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 12:41:11 -0400
Received: from localhost (unknown [127.0.0.1])
	by basie.internet2.edu (Postfix) with ESMTP id 580781CDAD0
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 12:41:11 -0400 (EDT)
Received: from basie.internet2.edu ([127.0.0.1])
	by localhost (basie.internet2.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29210-08 for <linux-lvm@redhat.com>;
	Sat, 27 Aug 2005 12:41:11 -0400 (EDT)
Date: Sat, 27 Aug 2005 12:41:11 -0400
From: Dan Pritts <danno@internet2.edu>
Subject: Re: [linux-lvm] Saving files from full failing volume
Message-ID: <20050827164111.GD28472@internet2.edu>
References: <fa61edfd0508200022235af787@mail.gmail.com>
	<1124806695.17889.22.camel@bats.omnifarious.org>
	<fa61edfd05082706007d36d221@mail.gmail.com>
	<1125154737.2225.54.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1125154737.2225.54.camel@pc7.dolda2000.com>
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

On Sat, Aug 27, 2005 at 04:58:57PM +0200, Fredrik Tolf wrote:
> > Thanks for the response Eric. Let me check that I understand this correctly:
> >  If I were to use LVM to create a file system that spans 2 hard disks,
> > of capacity 80G each (for simplicities sake), giving a total capacity
> > of 160G, if that filesystem grows to (say) 100G and then one of the
> > disks begins to fail, there is no way for me to backup the files that
> > would be endangered, short of backing up the entire 100G, to another
> > disk entirely.

effectively, all the files in the filesystem are "endangered" - i'd hate
to try to recover the data from the half of the filesystem that was on
the good disk.
