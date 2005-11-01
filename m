Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA1ESLV25672
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 09:28:21 -0500
Received: from bob.fastenal.com (bob.fastenal.com [205.243.112.24])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA1ESAlh028960
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 09:28:10 -0500
Received: from [172.17.4.44] (unknown [172.17.4.44])
	by bob.fastenal.com (Postfix) with ESMTP id 14D7C3402F
	for <linux-lvm@redhat.com>; Tue,  1 Nov 2005 08:28:01 -0600 (CST)
Message-ID: <43677B70.2010305@fastenal.com>
Date: Tue, 01 Nov 2005 08:28:00 -0600
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Creating snapshot causes processes hang?
References: <4366CE49.1000501@nttdata.co.jp>
In-Reply-To: <4366CE49.1000501@nttdata.co.jp>
Content-Transfer-Encoding: 7bit
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

Snapshots in RHEL 4 are broken.  We've had to move to veritas after Redhat told
us that they would not support snapshots in RHEL 4.

Satoshi Nagayasu wrote:
> Hi all,
> 
> I'm testing PostgreSQL(RDBMS) backup using LVM2 snapshot on RHEL4.
> 
> After creating a snapshot, some processes (kjournald,
> one PostgreSQL backend and others) go to iowait status,
> and they never come back. (see pid 8105 and 2973 in below)
> 
> In this situation, one PostgreSQL backend process is waiting
> in COMMIT processing(it generates fsync() on logical volume),
> and also kjournald is waiting something.
> 
> There is no kernel oops, and the processors are not used.
> 
> When I set an PostgreSQL option not to generate fsync
> on COMMIT, it looks work well. No process hangs.
> 
> I guess some race conditions is occured around kjournald.
> 
> Any comments and suggestions?
> 
> Thanks.
> ------------------------------------
> # uname -a
> Linux st17 2.6.9-5.ELsmp #1 SMP Wed Jan 5 19:30:39 EST 2005 i686 i686 i386 GNU/Linux
> # df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sda5             20161172   6717648  12419384  36% /
> /dev/sda1               202219     11423    180356   6% /boot
> none                   1037448         0   1037448   0% /dev/shm
> /dev/mapper/vg0-pgdata
>                        1032088    515532    464128  53% /pgdata
> # ps ax
>   PID TTY      STAT   TIME COMMAND
>     1 ?        S      0:00 init [3]
>     2 ?        S      0:00 [migration/0]
>     3 ?        SN     0:00 [ksoftirqd/0]
>     4 ?        S      0:00 [migration/1]
>     5 ?        SN     0:00 [ksoftirqd/1]
>     6 ?        S<     0:00 [events/0]
>     7 ?        S<     0:00 [events/1]
>     8 ?        S<     0:00 [khelper]
>     9 ?        S<     0:00 [kacpid]
>    30 ?        S<     0:00 [kblockd/0]
>    31 ?        S<     0:00 [kblockd/1]
>    44 ?        S<     0:00 [aio/0]
>    45 ?        S<     0:00 [aio/1]
>    32 ?        S      0:00 [khubd]
>    43 ?        S      0:11 [kswapd0]
>   118 ?        S      0:00 [kseriod]
>   186 ?        S      0:00 [scsi_eh_0]
>   201 ?        S      0:17 [kjournald]
>  1157 ?        S<s    0:00 udevd
>  1342 ?        S      0:00 [kjournald]
>  1761 ?        Ss     0:00 syslogd -m 0
>  1765 ?        Ss     0:00 klogd -x
>  1776 ?        Ss     0:00 irqbalance
>  1794 ?        Ss     0:00 portmap
>  1814 ?        Ss     0:00 rpc.statd
>  1913 ?        Ss     0:00 rpc.idmapd
>  1990 ?        Ss     0:00 /usr/sbin/acpid
>  2003 ?        Ss     0:00 cupsd
>  2042 ?        Ss     0:00 /usr/sbin/sshd
>  2116 ?        Ss     0:00 xinetd -stayalive -pidfile /var/run/xinetd.pid
>  2126 ?        Ss     0:00 gpm -m /dev/input/mice -t imps2
>  2169 ?        Ss     0:00 /usr/sbin/htt -retryonerror 0
>  2170 ?        S      0:00 htt_server -nodaemon
>  2182 ?        Ss     0:00 /usr/sbin/cannaserver -syslog -u canna
>  2233 ?        Ss     0:00 crond
>  2274 ?        Ss     0:00 xfs -droppriv -daemon
>  2293 ?        Ss     0:00 /usr/sbin/atd
>  2303 ?        Ssl    0:00 dbus-daemon-1 --system
>  2317 ?        Ss     0:00 cups-config-daemon
>  2328 ?        Ss     0:01 hald
>  2338 tty1     Ss+    0:00 /sbin/mingetty tty1
>  2339 tty2     Ss+    0:00 /sbin/mingetty tty2
>  2340 tty3     Ss+    0:00 /sbin/mingetty tty3
>  2341 tty4     Ss+    0:00 /sbin/mingetty tty4
>  2342 tty5     Ss+    0:00 /sbin/mingetty tty5
>  2343 tty6     Ss+    0:00 /sbin/mingetty tty6
>  2885 ?        Ss     0:00 sshd: snaga [priv]
>  2887 ?        S      0:00 sshd: snaga@pts/0
>  2888 pts/0    Ss     0:00 -bash
>  2908 ?        Ss     0:00 sshd: snaga [priv]
>  2910 ?        S      0:00 sshd: snaga@pts/1
>  2911 pts/1    Ss     0:00 -bash
>  2931 pts/1    S      0:00 su
>  2932 pts/1    S      0:00 bash
>  2973 ?        D      0:31 [kjournald]
>  2980 ?        S      0:54 [rpciod]
>  2981 ?        S      0:00 [lockd]
>  3016 pts/0    S      0:00 su
>  3017 pts/0    S      0:00 bash
>  3035 pts/0    S      0:00 su postgres
>  3036 pts/0    S      0:00 bash
>  7866 pts/0    S+     0:00 /bin/sh ./pgbench_lvm.sh
>  7906 pts/0    S+     0:00 /bin/sh ./pgbench_lvm.sh
>  7907 pts/0    S+     0:00 sed -e s/^/lvm:/
>  7915 pts/0    S+     0:00 /usr/local/pgsql81b3/bin/postmaster -D /pgdata/data
>  7917 pts/0    S+     0:03 postgres: writer process
>  7918 pts/0    S+     0:00 postgres: archiver process
>  7919 pts/0    S+     0:00 postgres: stats buffer process
>  7920 pts/0    S+     0:00 postgres: stats collector process
>  8015 ?        S      0:01 [pdflush]
>  8094 pts/0    S+     0:01 pgbench -s 10 -t 1000 -c 16 pgbench
>  8096 pts/0    S+     0:00 postgres: postgres pgbench [local] COMMIT
>  8097 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8098 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8099 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8100 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8101 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8102 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8103 pts/0    S+     0:00 postgres: postgres pgbench [local] COMMIT
>  8104 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8105 pts/0    D+     0:00 postgres: postgres pgbench [local] COMMIT
>  8106 pts/0    S+     0:00 postgres: postgres pgbench [local] COMMIT
>  8107 pts/0    S+     0:00 postgres: postgres pgbench [local] COMMIT
>  8108 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8109 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8110 pts/0    S+     0:00 postgres: postgres pgbench [local] UPDATE waiting
>  8111 pts/0    S+     0:00 postgres: postgres pgbench [local] COMMIT
>  8119 ?        S      0:00 [pdflush]
>  8147 ?        S<     0:00 [kcopyd]
>  8179 ?        S      0:00 [kjournald]
>  8188 pts/1    R+     0:00 ps ax
> # cat /etc/issue
> Red Hat Enterprise Linux ES release 4 (Nahant)
> Kernel \r on an \m
> 
> #
> ------------------------------------
> 
