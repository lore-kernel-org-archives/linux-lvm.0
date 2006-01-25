Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0P5O5110146
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 00:24:05 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0P5NuHi018749
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 00:23:56 -0500
Received: by xproxy.gmail.com with SMTP id r21so30011wxc
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 21:23:56 -0800 (PST)
Message-ID: <9ab217670601242123x482c67dbt@mail.gmail.com>
Date: Tue, 24 Jan 2006 21:23:56 -0800
From: "Devon H. O'Dell" <devon.odell@gmail.com>
Subject: Re: [linux-lvm] 8TB logical volumes with LVM2
In-Reply-To: <20060125043640.GA10792@goldfinger.local>
MIME-Version: 1.0
Content-Disposition: inline
References: <9ab217670601241950m711f3e0dn@mail.gmail.com>
	<20060125043640.GA10792@goldfinger.local>
Content-Transfer-Encoding: 8bit
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

2006/1/24, DGS <dgs@gs.washington.edu>:
> On Tue, Jan 24, 2006 at 07:50:04PM -0800, Devon H. O'Dell wrote:
> > Hello folks,
> >
> > I'm trying to configure a system with 2 12 port 3ware 9550SX SATA RAID
> > cards to join the two physical volumes exported by the cards into a
> > single logical volume. There are 24x400GB drives, so the total is just
> > above 8TB.
>
> I did pretty much the same thing on a Caos Linux system with two
> twelve-port 3ware 9000 SATA raid and twenty-four 250 GB disks,
> creating one big 6.6T file system.  No problems to report from
> here.  You did make GPT labels on the two SCSI devices, didn't
> you?
>
> David S.

Apparently not. I've got it now; I did indeed need to create the GPT
labels. Thanks for the reminder; I appreciate it.

--Devon
