From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] offtopic but ...
In-Reply-To: <1263110000.1021300134@[192.168.200.4]>
Message-ID: <Pine.LNX.4.44.0205131053020.6095-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Mon May 13 10:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 13 May 2002, at 9:28am, Steven Lembark wrote:
> Depends on the size of a system.  If you have too much ... of data there
> is no effective way to back it up and restore it.

  In my experience, large systems are even more likely to require multiple
levels of data redundancy.  When you get into that space, though, you're not
talking about running "tar" on the filesystem at 2 AM.  :)  Instead, you're
talking application-level backups, storage-level snapshots, that sort of
thing.  Maybe the snapshots are dumped to tape, and the tapes kept offsite.  
Maybe they ship the whole storage array offsite.  I've heard of or seen
both.  There are plenty of even more sophisticated solutions.

> For a few tens of millions you can avoid tapes too :-)

  "Backup" does not have to mean "magnetic tape".  The essential element is
that the backup is offline, so that if the "live" system gets destroyed
somehow, all is not lost.  Yes, the downtime from such a disaster is
extremely painful -- but not having the data at all is orders of magnitude
more painful.

> Banks ... use multiple centers with multiple computers with multiple EMC
> systems with multiple volumes RAID-ed across multiple sets of duplicated
> drives connected by multiple controllers across multiple lans and
> heartbeat systems monitoring each of them.

  And offline backups kept in physically hardened offsite facilities on top
of that.  Banks sincerely believe they cannot have too many copies of their
data.  I've seen pictures of the offline and near-line facilities they use
for this sort of thing -- warehouses full of shelves and shelves of data
cartridges.

> Archiving data to tape is a wonderful thing but won't help you if hardware
> fails and you need quick access to the system.

  Offline backups are for disaster recovery, not availability.  I think
you're trying to say that, but the point is getting confused.  The
difference between a small office's and a large bank's disaster recovery
plans is the difference between their definitions of "disaster".  A small
office probably considers a hard drive failure or OS corruption a
"disaster".  A bank thinks more along the lines of "multiple terrorist
attacks".

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
