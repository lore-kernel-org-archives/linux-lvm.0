Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8KUAr17913
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:30:10 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.206])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA8KU5rG002861
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:30:05 -0500
Received: by rproxy.gmail.com with SMTP id j1so463277rnf
	for <linux-lvm@redhat.com>; Mon, 08 Nov 2004 12:29:48 -0800 (PST)
Message-ID: <87f94c370411081229655123d6@mail.gmail.com>
Date: Mon, 8 Nov 2004 15:29:46 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] xfs freeze nad snapshot problem
In-Reply-To: <418F831B.5030500@e-liberty.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <418F831B.5030500@e-liberty.pl>
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 08 Nov 2004 15:30:51 +0100, Piw <piw@e-liberty.pl> wrote:
> Hello
> 
> I got following problem:
> Trying to make snapshot of lv with xfs filesystem:
> # xfs_freeze -f /data
> # lvcreate -L20G --snapshot --name snap /dev/VG/LV
> 
> and system lock...
> 
> (kill -9 doesnt work)
> 
> I have to create another session and remowe lockup with:
> # xfs_freeze -u /data
> 
> If I try to create snapshot without freezeng xfs, it works (bo no
> cohesion is guaranteed).
> 
> kernel: 2.6.9
> lvm:    2.00.25
> dm:     1.00.19
> 
> Anyone can help?
> TIA
> 
> PS.
> This problem is mentioned in:
> http://www.netsys.com/suse-linux-e/2002/08/msg01933.html
> but no sloution
> --
> Piw

I have not tried it with 2.6 kernel series and LVM2 userland, but
snapshots were (and are) working fine with later 2.4.x kernels and LVM
1 userland.

I wrote xfstests/068 a couple years ago to confirm they were working
reliably then.
 
Hopefully it still works?  But 068 may need updating for LVM2?

http://oss.sgi.com/cgi-bin/cvsweb.cgi/xfs-cmds/xfstests/

Greg
-- 
Greg Freemyer
