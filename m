Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8HJGjV00374
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 15:16:45 -0400
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8HJGiqA021261
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 15:16:45 -0400
Received: from barkeeper1 (213-229-1-138.sdsl-line.inode.at [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id A5D5F1400A
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 21:16:09 +0200 (CEST)
Date: Sat, 17 Sep 2005 21:16:09 +0200
From: Lars Ellenberg <Lars.Ellenberg@linbit.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
Message-ID: <20050917191609.GE12882@barkeeper1.linbit>
References: <95bbd190509111934b306235@mail.gmail.com>
	<20050912080543.GD25756@barkeeper1.linbit>
	<95bbd19050912014220e457b@mail.gmail.com>
	<95bbd1905091623272f7455ec@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95bbd1905091623272f7455ec@mail.gmail.com>
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
To: linux-lvm@redhat.com

/ 2005-09-17 14:27:10 +0800
\ Bear Wolf:
> I also found the process dead, that is "pdflush"
> there're 2 "pdflush" always running on my system,
> but one is dead after I create the 3rd snapshot volumes and access the
> source volume then sync

it is not "dead", it is in "uninteruptible sleep".
that is a big difference.

yes, those are the kernel threads responsible for the sync.
there are initially two of them per cpu.
if they (try to) sync to some device mapper target which is suspended,
they themselves get suspended.
this can hang the system: no io possible, nothing possible
anymore that needs io...

> -bash-3.00# ps x
>   PID TTY      STAT   TIME COMMAND
>     1 ?        S      0:01 init [2]
>     2 ?        S      0:00 [migration/0]
>     3 ?        SN     0:00 [ksoftirqd/0]
>     4 ?        S<     0:00 [events/0]
>     5 ?        S<     0:00 [khelper]
>     6 ?        S<     0:00 [kthread]
>     8 ?        S<     0:00 [kacpid]
>    70 ?        S<     0:00 [kblockd/0]
>    73 ?        S<     0:00 [khubd]
>   129 ?        S      0:00 [pdflush]
>   130 ?        D      0:00 [pdflush]
>   132 ?        S<     0:00 [aio/0]
>   131 ?        S      0:00 [kswapd0]
>   134 ?        S<     0:00 [xfslogd/0]
>   133 ?        S      0:00 [cifsoplockd]
>   135 ?        S<     0:00 [xfsdatad/0]
>   136 ?        S      0:00 [xfsbufd]
>   723 ?        S<     0:00 [kseriod]
>   773 ?        S      0:00 [scsi_eh_0]
>   777 ?        S<     0:00 [ata/0]
>   801 ?        S<     0:00 [kcryptd/0]
>   934 ?        S<     0:00 [kcopyd]
>  1330 ?        Ss     0:00 syslogd -m 0
>  1334 ?        Ss     0:00 klogd -x
>  1343 ?        Ss     0:00 /usr/httpd/bin/httpd
>  1353 ?        Ss     0:00 crond
>  1359 ?        Ss     0:00 /bin/profamd
>  1479 tty1     Ss     0:00 -bash
>  1481 tty2     Ss+    0:00 -bash
>  1483 tty3     Ss+    0:00 /sbin/mingetty tty3
>  1485 tty4     Ss+    0:00 /sbin/mingetty tty4
>  1487 tty5     Ss+    0:00 /sbin/mingetty tty5
>  1903 ?        S      0:00 [xfssyncd]
>  1915 tty1     D+     0:00 sync
>  2037 pts/0    R+     0:00 ps x

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
