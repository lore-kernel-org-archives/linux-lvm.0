Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i18Dksa15222
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 08:46:54 -0500
Received: from yakka.services.adelaide.edu.au (yakka.services.adelaide.edu.au [129.127.41.32])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i18Dkrb25001
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 08:46:53 -0500
Message-ID: <1076247930.40263d7a87098@pandani.services.adelaide.edu.au>
From: Chris Doherty <chris.doherty@adelaide.edu.au>
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au> <yw1xn07tu7w8.fsf@kth.se> <1076241638.402624e656f43@pandani.services.adelaide.edu.au> <200402081354.15872.rainer@krienke.org>
In-Reply-To: <200402081354.15872.rainer@krienke.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm]Re: corrupt /dev/lvm - bizzare properties
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
Date: Sun Feb  8 08:46:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Rainer krienke <rainer@krienke.org>
Cc: linux-lvm@redhat.com, =?iso-8859-1?b?TeVucyA=?= =?iso-8859-1?b?UnVsbGflcmQ=?= <mru@kth.se>, linux-lvm@sistina.com

Quoting Rainer krienke <rainer@krienke.org>:

> Am Sonntag, 8. Februar 2004 13:00 schrieb Chris Doherty:
> > Quoting M�ns Rullg�rd <mru@kth.se>:
> > > Chris Doherty <chris.doherty@adelaide.edu.au> writes:
> > > > I've been using LVM happily for several months without any
> > > > complaints or problems.  This morning that all changed.  The boot
> > > > process stopped cold when lvm-mod (w|c)ouldn't load.  My first
> > > > impulse was to fsck, which I did as a matter of course.  Eventually,
> > > > I stumbled across what appears to be the source of my problem:
> > > >
> > > > root@connect4:~# ls -la /dev/lvm
> > > > ?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm
> > >
> > > Your filesystem seems to have taken some heavy blows.  You should fsck
> > > it properly.  You might need the -f flag to fsck to force a complete
> > > check if filesystem is marked clean.
> >
> > the filesystem can't be mounted (which is the really worrying part) so i
> > can't fsck it.
> >
> 
> A filesystem that is to be fscked can and may *never* be mounted when 
> performing an fsck. Usually all fsck tools won't do anything but stop if the

oops, sorry my last statement was ambiguous.  what i meant was that the 
filesystem can't be mounted *and* fsck refuses to acknowledge that it is (or 
was?) a filesystem.

root@connect4:~# fsck -cvf -t ext3 /dev/vg1/lv1
fsck 1.32 (09-Nov-2002)
e2fsck 1.32 (09-Nov-2002)
fsck.ext3: No such device or address while trying to open /dev/vg1/lv1
Possibly non-existent or swap device?

it looks like what i need is a non-destructive MAKEDEV which can repair /dev/lvm

(in a dream world) or, more realistically to create a new LVM device and 
reassign all of the logical volumes to it.  can any LVM gurus confirm whether 
this would work?

i've been trying to find a way to make a backup so i can start experimenting, so

far without success.

root@connect4:~# tar cvf lvm.tar /dev/lvm
tar: /dev/lvm: Unknown file type; file ignored
tar: Error exit delayed from previous errors

root@connect4:~# dd if=/dev/lvm of=lvm.dd
dd: reading `/dev/lvm': Invalid argument
0+0 records in
0+0 records out

root@connect4:~# man dump
mdoc warning: Empty input line #609
DUMP(8)                   BSD System Manager�??s Manual                  
DUMP(8)

NAME
     dump - ext2 filesystem backup
<snip>

two problems with dump:

1) the filesystem on the LV is (was?) ext3
2) /dev/lvm isn't a filesystem

> filesystem (fsck was called for)  is currently mounted! If your root 
> filesystem is corrupt boot from a rescue CD or similar and then check the 
> filesystem. 
