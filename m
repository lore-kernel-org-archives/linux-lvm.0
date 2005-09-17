Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8H6RNV23718
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 02:27:23 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8H6RFon031887
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 02:27:15 -0400
Received: by zproxy.gmail.com with SMTP id m7so462207nzf
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2005 23:27:10 -0700 (PDT)
Message-ID: <95bbd1905091623272f7455ec@mail.gmail.com>
Date: Sat, 17 Sep 2005 14:27:10 +0800
From: Bear Wolf <sportbear@gmail.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
In-Reply-To: <95bbd19050912014220e457b@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <95bbd190509111934b306235@mail.gmail.com>
	<20050912080543.GD25756@barkeeper1.linbit>
	<95bbd19050912014220e457b@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: sportbear@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I also found the process dead, that is "pdflush"
there're 2 "pdflush" always running on my system,
but one is dead after I create the 3rd snapshot volumes and access the
source volume then sync

-bash-3.00# ps x
  PID TTY      STAT   TIME COMMAND
    1 ?        S      0:01 init [2]
    2 ?        S      0:00 [migration/0]
    3 ?        SN     0:00 [ksoftirqd/0]
    4 ?        S<     0:00 [events/0]
    5 ?        S<     0:00 [khelper]
    6 ?        S<     0:00 [kthread]
    8 ?        S<     0:00 [kacpid]
   70 ?        S<     0:00 [kblockd/0]
   73 ?        S<     0:00 [khubd]
  129 ?        S      0:00 [pdflush]
  130 ?        D      0:00 [pdflush]
  132 ?        S<     0:00 [aio/0]
  131 ?        S      0:00 [kswapd0]
  134 ?        S<     0:00 [xfslogd/0]
  133 ?        S      0:00 [cifsoplockd]
  135 ?        S<     0:00 [xfsdatad/0]
  136 ?        S      0:00 [xfsbufd]
  723 ?        S<     0:00 [kseriod]
  773 ?        S      0:00 [scsi_eh_0]
  777 ?        S<     0:00 [ata/0]
  801 ?        S<     0:00 [kcryptd/0]
  934 ?        S<     0:00 [kcopyd]
 1330 ?        Ss     0:00 syslogd -m 0
 1334 ?        Ss     0:00 klogd -x
 1343 ?        Ss     0:00 /usr/httpd/bin/httpd
 1353 ?        Ss     0:00 crond
 1359 ?        Ss     0:00 /bin/profamd
 1479 tty1     Ss     0:00 -bash
 1481 tty2     Ss+    0:00 -bash
 1483 tty3     Ss+    0:00 /sbin/mingetty tty3
 1485 tty4     Ss+    0:00 /sbin/mingetty tty4
 1487 tty5     Ss+    0:00 /sbin/mingetty tty5
 1903 ?        S      0:00 [xfssyncd]
 1915 tty1     D+     0:00 sync
 2037 pts/0    R+     0:00 ps x

Rocky

2005/9/12, Bear Wolf <sportbear@gmail.com>:
> Dear Lars
> 
> I tried but not work,
> the process is still hang when I trying to copy some data in source
> volume or do sync command after create the 4rd snapshot volume.
> 
> should I patch the 8 and 9 of dm module?
> ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-rc2/2.6.12-rc2-udm1/
> 
> I saw that some discuss in previous mail-list
> 
> SportBear
> 
> 2005/9/12, Lars Ellenberg <Lars.Ellenberg@linbit.com>:
> > / 2005-09-12 10:34:15 +0800
> > \ Bear Wolf:
> > > Dear all
> > >
> > > I test snapshot function on my system.
> > > when I create the first snapshot, everything works fine.
> > > then I create more snapshot, everything works fine too.
> > > but when I access the source volume and do sync
> > > the sync command will be dead.
> > >
> > > and I test with a script file
> > >
> > > I=0
> > > for I in 1 2 3 4 5 6 7 8 9
> > > do
> > > cp -af /etc /mnt/volume1
> > > lvcreate -s -L 64 -n snaplv${I} /dev/VG01/volume1
> > > sleep 1
> > > done
> > >
> > > after create the 4th sn apshot volume, the system process hang without
> > > any error message.
> >
> > lvcreate calls into device mapper.
> > it suspends the affected targets, changes "tables", creates new targets,
> > and resumes the targets again.
> >
> > if it fails to create the new targets, or fails to adjust the "tables",
> >
> > then it unfortunately aborts, leaving the existing targets in suspended
> > state. I think that is a bug.
> >
> > to get the system working (sort of) again, you could try to
> > for d in /dev/mapper/* ; do
> >        [[ $d == control ]] && continue
> >        dmsetup resume $d &
> >                       # ^^^ important! background it!
> > done
> >
> > background it, because if you "resume" some target that depends on some
> > other target in suspended state, it will hang and wait for that other
> > target to be resumed... doh.
> >
> > worked for me... (well, to get the system back, at least).
> >
> > see also dmsetup ls, dmsetup info, dmsetp table etc.
> >
> > cheers,
> >
> > --
> > : Lars Ellenberg                                  Tel +43-1-8178292-0  :
> > : LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
> > : Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
