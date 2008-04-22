Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MHkuIQ025086
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 13:46:56 -0400
Received: from rv-out-0506.google.com (rv-out-0708.google.com [209.85.198.242])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MHkkUP029376
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 13:46:46 -0400
Received: by rv-out-0506.google.com with SMTP id b17so1266093rvf.51
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 10:46:45 -0700 (PDT)
Message-ID: <a71bd89a0804221039s506bcb6ap27580106935549cf@mail.gmail.com>
Date: Tue, 22 Apr 2008 10:39:59 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Snapshot question...
In-Reply-To: <a71bd89a0804220954j7fc85c78md03999cd9a4b792d@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
	<chaz20080422163820.GB6559@artesyncp.com>
	<a71bd89a0804220954j7fc85c78md03999cd9a4b792d@mail.gmail.com>
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

On Tue, Apr 22, 2008 at 9:54 AM, Dan Kegel <dank@kegel.com> wrote:
>  >  Also, it seems that you can't snapshot a live (mounted) file
>  >  system as you would do with LVM2 unless you have setup that FS
>  >  beforehand as a virtual ddsnap device (LVM2 is able to suspend
>  >  the device, and reload it as a snapshot_origin for that, I
>  >  couldn't manage to do the same with ddsnap).
>
>  Hmm.  I'll bring up that use case with Dan Phillips, see what he says.

Heh.  You cheated.  You're snapshotting devices already
in LVM2, so it already has control.

Perhaps the thing to do is to integrate ddsnap into lvm;
that way one could choose between traditional lvm
snapshots for compatbility, or spiffy new shared-storage
ddsnap snapshots for scalability.

If people try ddsnap / zumastor and think it's worth it,
maybe we could have a look at merging it with lvm somehow.
That would be an interesting job.
- Dan
