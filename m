Message-Id: <3C624EF1.41007537@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
References: <3YZU4ZCA1Z2YG72C3276A7F0MLTRF0.3c619374@kadzuki>
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Feb  7 03:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Anders Widman wrote:
> 
> Well, have you ever heard of diskcabbinettes? I use them alot wich means I don't have to have 10 disks in the same coputer at the same time. Then what, hot swap? Well this is very much possible, and secure
> (look at Promise.com).
> 
> IDE disk drives are very cheap and fast enough (Maxtor 160GB has a write performance of about 35MB/s in average) for most purposes and does not require special hardware or software.

I also developed a backup strategy based on a LVM Disk Array and it
works great.
I currently have to backup about 100GB of data. I build a mirroring
system copying
all data each night. Our traditional incremental backup showed, that
about 2Gb are
changed each day. So, for the next day, a new directory is created and
all backuped
data from yesterday are hard linked (cp -al) to the new destination.
Second, a cp -u
updates all files which have been changed. With 140Gb available I can
hold about 2 weeks
on disk. After that only one snapshot per week, later on one per month
is kept. I have
to see, how far I can go. In addition i make full backups from these
snapshots as an
disaster backup.

This procedure has a lot of advantages. Recent backups of single files
can be done
instantaneous. This took me hours of spooling DDS tapes back an forth
before. The backup
system can even be accessed by the users themselves. The backup mirror
is located on
an other building, an both systems see each other read only.

I think about saving the incremental data on tape too, to have a 3rd
stage, if the
backup disk fails. Any tape backup can now be done off-line from the
mirror. I don't
have to spend my weekends changing tapes to realize a fill backup from
the hot system.
I also may continue to use my old DDS4 backup drive, because it does not
really matter
if the tape backup is slow.

Recovering all data from DDS4 tape may take longer than using some fancy
LTO, this will
be necessary only if both buildings burned down, and I thing we have a
bigger problem then...

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
    stueken@conterra.de         stueken@qgp.uni-muenster.de
    http://www.conterra.de/     http://qgp.uni-muenster.de/~stueken
    (0)251-980-2027             (0)251-83-334974
