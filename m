Date: Tue, 7 Mar 2000 17:46:18 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: [linux-lvm] Snapshot documentation
Message-ID: <Pine.OSF.4.21.0003071740130.28917-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

Been playing with snapshots and am noticing I can create a snapshot with
less PE's than my source LV that I'm snapshotting, with the small side
effect of:

lvcreate -- WARNING: all snapshots will be disabled if more than 12 MB are
changed

Is the above message implying that if I change more than 12MB of data on
my source LV that the snapshot is then defunct/useless?  Does that include
deletes, etc?

Mainly a pointer to any information or documentation regarding how this
all works would be well appreciated.  I'm noticing LVM has some HP history
involved, so I'll go see if they have relevant data in their HPUX docs.

Maybe this is included in the recent EN-HOWTO I noticed mention of as
well?
