Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CFAbi13459
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 10:10:37 -0500
From: Douglas Kilpatrick <kilpatds@oppositelock.org>
Subject: [linux-lvm] Re: LVM2 on top of RAID1? (x86_64)
Message-Id: <20040212100955.3b79511c.kilpatds@oppositelock.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 10:10:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

=?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se> writes:

> Douglas Kilpatrick <kilpatds@oppositelock.org> writes:

> > complains about seeing 3 extra instances of the id, and decides that
> > the PV is actually on /dev/sda (or /dev/sdb, depending on boot), not
> > /dev/md1.

> I have a similar setup and ran into the same problem.  I solved it by
> placing this in /etc/lvm/lvm.conf:
>
> devices {
>         filter = [ "r,hd," ]
> }


That appears to have fixed it.  Thanks.

Doug
-- 
Doug Kilpatrick
kilpatds@oppositelock.org
