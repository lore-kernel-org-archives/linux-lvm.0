Message-ID: <38A1CE1E.49BCA063@tkg.com>
Date: Wed, 09 Feb 2000 15:29:18 -0500
From: Christopher Shaulis <shaulis@tkg.com>
MIME-Version: 1.0
Subject: [linux-lvm] AIX JFS dual-mount
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

There is something called clvm (concurrent logical volume manager) for
AIX which ships as part of HACMP (high availability clustering
software). Its a combination of a kernel module and a user-mode locking
deamon. It allows multiple systems to access the same volume groups in
a twintail SCSI or multi-initiator SSA configuration. The lock managers
on each machine communicate over TCP/IP. 

According to the HACMP training class, clvm is seldom used and is
reported to be slow. Most developers (ie Oracle) choose instead to roll
their own locking solutions. I've never actually seen anyone use it
myself -- outside of an exercise in the HACMP class that is. ;)

Christopher
