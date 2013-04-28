Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3S2CpFp019059
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 22:12:51 -0400
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3S2ClXf022502
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 22:12:48 -0400
Received: by mail-vc0-f182.google.com with SMTP id ht10so1043921vcb.41
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 19:12:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+_JKzoggNBBKNoD5GZpkJmVjc1t0NUghTavLs-9McQDo0UfkA@mail.gmail.com>
References: <51791E1A.8020903@libertytrek.org>
	<CA+_JKzoggNBBKNoD5GZpkJmVjc1t0NUghTavLs-9McQDo0UfkA@mail.gmail.com>
Date: Sat, 27 Apr 2013 19:12:47 -0700
Message-ID: <CAA3XVTw=VBigFUhk_dNPx-XQOAyp5wWRtbCmyr_x5i6Q8typKw@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Subject: Re: [linux-lvm] LVM snapshots and filesystem quiescence
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

lt;dr You can safely use LVM for most modern DB's.

To start, a SQL dump is cool and all, but will not scale. Once your DB
is ~300GB (or 30GB depending on the data), the dump takes a day and a
restore takes even longer (much longer).

Databases should write to a journel, log, whatever, so a replay of
transactions can happen if a filesystem snapshot was taken. Basically
the same methods that keep a filesystem functional when the power is
pulled also applies to a modern database (note: filesystems often only
journel metadata - a DB will journel the entire transaction). The DB
will startup, see the database files are dirty and replay its journel.
The journel should have metadata, data, etc... and the databases
store/files (sitting on the filesystem) should have internal
versioning so rows can be consistant before a replay.

Using MySQL as an example along with InnoDB, the transaction
journel/buffer is written to and can be replayed - making this buffer
huge will result in long recovery times but has its benefits. Can some
transactions not make it to the buffer/log? Sure. But your DB will be
consistant and clean (and not just consistant with missing data). If
that snapshot needs to be promoted because someone ran DROP DATABASE
myapp; and your master/slaves all deleted everything - you are good.
Use a snapshot from LVM as new master, remove the bad SQL from the log
(this is different from the internal innodb buffer/journel), and
replay logs. You are now caught up. Take another snapshot for safety,
make new slaves, restart business.

I've only had to do this twice.

To make this longer, if you DB is garbage (think MySQL with MyISAM)
you are basically completely hosed and can just run repair_table on
each table. That is like running fsck which will probably just remove
rows half-written and leave a mess behind. That sucks. I've don't that
also. To use a crappy DB like that (using MySQL/MyISAM as an example),
you'd run "flush tables with read lock", this might take 0-25mins to
return, take snapshot, run "unlock tables". This works. But your
should do this on a dedicated slave.

PS. if you are using MySQL just use hotbackup on a slave.

On Thu, Apr 25, 2013 at 8:05 AM, Clay Gerrard <clay.gerrard@gmail.com> wrote:
> I love this question.  I always thought the only way to guarantee a
> consistent snap of a block was to unmount it before taking the snap, mostly
> just cause of un-fsynced data in the page cache.  Any other answer would be
> very welcome.
>
> -Clay
>
>
> On Thu, Apr 25, 2013 at 5:14 AM, Tanstaafl <tanstaafl@libertytrek.org>
> wrote:
>>
>> Hello,
>>
>> I'm totally new to LVM snapshots. I've have read the FAQ and docs and
>> searched the list archives and can't find an answer to my question...
>>
>> I know that you have to quiesce SQL databases using their own native tools
>> if you want to have a consistent snapshot of the raw db files, but what
>> about other programs like postfix or dovecot that are constantly (on a busy
>> server) writing to disk? Do you need to stop these, take the snapshot, then
>> restart them? Or will the filesystem itself handle this (similar to how VSS
>> works on windows)?
>>
>> I'm fairly certain the answer is no, I don't have to worry about these
>> kinds of programs, only SQL databases.
>>
>> I engage a script that simply performs a native dump of my databases
>> immediately preceding the snapshot (my db's are very small and the dumps
>> only take a few seconds, and this just seems much simpler to me) and places
>> these files into a sql_dumps directory on the filesystem that will be
>> snapshotted so these will be included in my backups, so am not worried about
>> them being in a consistent state.
>>
>> Thanks in advance...
>>
>> Charles
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
