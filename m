From: Dale Gallagher <foobar@mighty.co.za>
Message-ID: <20040206124830.GA2127@samadhi.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] advice sought on setting up new system
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
Date: Fri Feb  6 07:52:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi there

I'm new to LVM2 and am considering using it on a production system,
but would welcome advice from experienced users out there, before
I set things up.  Your advice and comments would be appreciated.
Details follow.

Summary:

Primary function: mail system (pop3,smtp,http)
Scalable to 10's of thousands (and hopefully millions) of users ;-)
Applications: qmail, PostgreSQL, djbdns

Current system:

1GB RAM
4x U320 15k SCSI 72GB disks in hardware RAID1+0
All functions running on same host.

Future system to include external drive cage(s) and splitting of
functions onto separate hosts (DB/mail/DNS).  The external drive
cage(s) to be used for mail storage. qmail uses maildir, as opposed
to mbox delivery, so each message is a separate file... this means
I require performance for a vastly greater number of smaller files
as opposed to a single mbox file per user.  Another consideration is
a popular belief that mounting /var/qmail/queue with the sync option
set, or manually invoking sync() improves the queue's robustness
(that's another story).

At the moment the box has:

/       520MB           ext3
/boot   32MB            ext3
free    +/-130GB        LVM

There's a swap partition, but otherwise the rest is available.  I'm
considering something approximating the following.

/                       520MB           ext3
/boot                   32MB            ext3
/usr                    512MB           LVM/ext3
/var                    1GB             LVM/ext3
/var/lib/pgsql          512MB           LVM/ext3
/var/qmail/queue        512MB           LVM/ext3        sync
/home                   1GB             LVM/ext3
/home/mail              127GB+          LVM/ext3

All the file systems on LVs may require expansion/contraction as the
system grows, so I'd like as flexible a setup as possible.  The qmail
queue should probably be larger, rather than smaller, so that expansion
doesn't adversely affect performance.  What about adding swap space?

What size should the various PEs be, linear/striped?... what other
configurable LVM settings would suit this setup etc.  I'm a complete
newbie as far as LVM is concerned, so need valuable pointers.

The primary goal here is for flexibility and I/O performance - the
hardware RAID takes care of availability/redundancy, together with
backup media.

Thanks in advance
Dale
