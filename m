Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i18C28a25642
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 07:02:08 -0500
Received: from yakka.services.adelaide.edu.au (yakka.services.adelaide.edu.au [129.127.41.32])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i18C27b19963
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 07:02:07 -0500
Message-ID: <1076241638.402624e656f43@pandani.services.adelaide.edu.au>
From: Chris Doherty <chris.doherty@adelaide.edu.au>
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au> <yw1xn07tu7w8.fsf@kth.se>
In-Reply-To: <yw1xn07tu7w8.fsf@kth.se>
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
Date: Sun Feb  8 07:01:14 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com, =?iso-8859-1?b?TeVucyA=?= =?iso-8859-1?b?UnVsbGflcmQ=?= <mru@kth.se>
Cc: linux-lvm@sistina.com

Quoting M�ns Rullg�rd <mru@kth.se>:

> Chris Doherty <chris.doherty@adelaide.edu.au> writes:
> 
> > I've been using LVM happily for several months without any
> > complaints or problems.  This morning that all changed.  The boot
> > process stopped cold when lvm-mod (w|c)ouldn't load.  My first
> > impulse was to fsck, which I did as a matter of course.  Eventually,
> > I stumbled across what appears to be the source of my problem:
> >
> > root@connect4:~# ls -la /dev/lvm
> > ?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm
> 
> Your filesystem seems to have taken some heavy blows.  You should fsck
> it properly.  You might need the -f flag to fsck to force a complete
> check if filesystem is marked clean.

the filesystem can't be mounted (which is the really worrying part) so i can't 
fsck it.

root@connect4:~# mount -t ext3 /dev/vg1/lv1 /data
mount: /dev/vg1/lv1 is not a valid block device
root@connect4:~# ls /dev/vg1/
total 124
dr-xr-xr-x    2 root     root         4096 Feb  6 18:46 ./
drwxr-xr-x   22 root     root       118784 Feb  8 14:19 ../
crw-r-----    1 root     disk     109,   0 Feb  6 18:46 group
brw-rw----    1 root     disk      58,   0 Feb  6 18:46 lv1

the fsck that i mentioned previously was run on the other (available) 
filesystems, thinking that perhaps the LVM binaries (or some other related tool)

had been corrupted.

> -- 
> M�ns Rullg�rd
> mru@kth.se
