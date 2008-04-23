Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NBoFxk009927
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 07:50:15 -0400
Received: from exprod7og103.obsmtp.com (exprod7og103.obsmtp.com [64.18.2.159])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NBnvXG004045
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 07:49:58 -0400
Received: from stephane by ant.artesyncp.com with local (Exim 4.69)
	(envelope-from <stephane@artesyncp.com>) id 1JodU2-0006dp-Fy
	for linux-lvm@redhat.com; Wed, 23 Apr 2008 12:49:54 +0100
Date: Wed, 23 Apr 2008 12:49:54 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] Snapshot question...
Message-ID: <chaz20080423114954.GE6559@artesyncp.com>
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
	<chaz20080422163820.GB6559@artesyncp.com>
	<a71bd89a0804220954j7fc85c78md03999cd9a4b792d@mail.gmail.com>
	<a71bd89a0804221039s506bcb6ap27580106935549cf@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a71bd89a0804221039s506bcb6ap27580106935549cf@mail.gmail.com>
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

2008-04-22 10:39:59 -0700, Dan Kegel:
> On Tue, Apr 22, 2008 at 9:54 AM, Dan Kegel <dank@kegel.com> wrote:
> >  >  Also, it seems that you can't snapshot a live (mounted) file
> >  >  system as you would do with LVM2 unless you have setup that FS
> >  >  beforehand as a virtual ddsnap device (LVM2 is able to suspend
> >  >  the device, and reload it as a snapshot_origin for that, I
> >  >  couldn't manage to do the same with ddsnap).
> >
> >  Hmm.  I'll bring up that use case with Dan Phillips, see what he says.
> 
> Heh.  You cheated.  You're snapshotting devices already
> in LVM2, so it already has control.
> 
> Perhaps the thing to do is to integrate ddsnap into lvm;
> that way one could choose between traditional lvm
> snapshots for compatbility, or spiffy new shared-storage
> ddsnap snapshots for scalability.
> 
> If people try ddsnap / zumastor and think it's worth it,
> maybe we could have a look at merging it with lvm somehow.
> That would be an interesting job.
[...]

Hi Dan,

What I meant is that, with LVM2 snapshots, before you create
your first snapshot, you have your LV A created as a "linear"
(or stripe or mirror) mapping of a /physical/ block device.

So you have for instance:

$ sudo dmsetup table
vg-A: 0 199991296 linear 9:0 384

And possibly the /dev/mapper/vg-A is mounted on /.

In order to be able to do a snapshot of that, you have to change
it to a "snapshot-origin" type. That's what lvcreate -s does.

if you do a lvcreate -s -n snap /dev/vg/A

- it creates a /dev/mapper/vg-snap-cow volume
- it creates a copy (a dm device with the same table) of
  /deb/mapper/vg-A as /dev/mapper/vg-A-real
- it suspends /dev/mapper/vg-A (as if doing dmsetup suspend
  vg-A)
- it does the equivalent of:
  echo <start> <end> snapshot /dev/mapper/vg-A-real \
  /dev/mapper/vg-A-cow P 16 | dmsetup reload vg-A
  So that vg-A is changed on the fly. That step wouldn't work
  without the suspend.
- resumes /dev/mapper/vg-A

I tried to do something similar (not on / but on a /dev/loop
test) with ddsnap, but it didn't work, the commands were
successful, but the vg-A was still seen as a "linear" device in
the output of dmsetup table.

I think this is different from having ddsnap integrated in LVM2.
An advantage of making LVM2 aware of ddsnap would be so that
ddsnap devices can be more easily brought back up upon startup.
But that would mean "vgchange -ay" would have to start the agent
and server which would still raise a number of issues when run
in initrds.

Cheers,
Stephane
