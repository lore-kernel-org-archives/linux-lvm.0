Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8J1ZOV10702
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2005 21:35:24 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8J1ZE0J018752
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2005 21:35:14 -0400
Received: by zproxy.gmail.com with SMTP id m7so495564nzf
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2005 18:35:09 -0700 (PDT)
Message-ID: <95bbd1905091818351226a9ec@mail.gmail.com>
Date: Mon, 19 Sep 2005 09:35:09 +0800
From: Bear Wolf <sportbear@gmail.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
In-Reply-To: <20050917191609.GE12882@barkeeper1.linbit>
Mime-Version: 1.0
Content-Disposition: inline
References: <95bbd190509111934b306235@mail.gmail.com>
	<20050912080543.GD25756@barkeeper1.linbit>
	<95bbd19050912014220e457b@mail.gmail.com>
	<95bbd1905091623272f7455ec@mail.gmail.com>
	<20050917191609.GE12882@barkeeper1.linbit>
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

Thank you Ellenberg.
now I learn more things..^_^

should I put this at Redhat Bugzila?
because it's always reproducible with RH-FC3,

"demsetup resume target &" still not work..

2005/9/18, Lars Ellenberg <Lars.Ellenberg@linbit.com>:
> / 2005-09-17 14:27:10 +0800
> it is not "dead", it is in "uninteruptible sleep".
> that is a big difference.
> 
> yes, those are the kernel threads responsible for the sync.
> there are initially two of them per cpu.
> if they (try to) sync to some device mapper target which is suspended,
> they themselves get suspended.
> this can hang the system: no io possible, nothing possible
> anymore that needs io...
> 
> > -bash-3.00# ps x
> >   PID TTY      STAT   TIME COMMAND
> >     1 ?        S      0:01 init [2]
> >     2 ?        S      0:00 [migration/0]
> >     3 ?        SN     0:00 [ksoftirqd/0]
> >     4 ?        S<     0:00 [events/0]
> >     5 ?        S<     0:00 [khelper]
> >     6 ?        S<     0:00 [kthread]
> >     8 ?        S<     0:00 [kacpid]
> >    70 ?        S<     0:00 [kblockd/0]
> >    73 ?        S<     0:00 [khubd]
> >   129 ?        S      0:00 [pdflush]
> >   130 ?        D      0:00 [pdflush]
> >   132 ?        S<     0:00 [aio/0]
> >   131 ?        S      0:00 [kswapd0]
> >   134 ?        S<     0:00 [xfslogd/0]
> >   133 ?        S      0:00 [cifsoplockd]
> >   135 ?        S<     0:00 [xfsdatad/0]
> >   136 ?        S      0:00 [xfsbufd]
> >   723 ?        S<     0:00 [kseriod]
> >   773 ?        S      0:00 [scsi_eh_0]
> >   777 ?        S<     0:00 [ata/0]
> >   801 ?        S<     0:00 [kcryptd/0]
> >   934 ?        S<     0:00 [kcopyd]
> >  1330 ?        Ss     0:00 syslogd -m 0
> >  1334 ?        Ss     0:00 klogd -x
> >  1343 ?        Ss     0:00 /usr/httpd/bin/httpd
> >  1353 ?        Ss     0:00 crond
> >  1359 ?        Ss     0:00 /bin/profamd
> >  1479 tty1     Ss     0:00 -bash
> >  1481 tty2     Ss+    0:00 -bash
> >  1483 tty3     Ss+    0:00 /sbin/mingetty tty3
> >  1485 tty4     Ss+    0:00 /sbin/mingetty tty4
> >  1487 tty5     Ss+    0:00 /sbin/mingetty tty5
> >  1903 ?        S      0:00 [xfssyncd]
> >  1915 tty1     D+     0:00 sync
> >  2037 pts/0    R+     0:00 ps x
> 
> --
> : Lars Ellenberg                                  Tel +43-1-8178292-0  :
> : LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
> : Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
>
