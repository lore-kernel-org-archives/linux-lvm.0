Message-Id: <200002151827.TAA08471@e35.marxmeier.com>
Subject: Re: [linux-lvm] Mirroring
Date: Tue, 15 Feb 2000 19:27:52 MEZ
In-Reply-To: <3.0.6.32.20000215121913.007eeac0@laplaza.org>; from "Mats Wichmann" at Feb 15, 100 12:19 (noon)
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mats@laplaza.org
Cc: linux-lvm

> perhaps...but it makes it impossible, if I've understood this
> architecture, to use a floating mirror for live backups.
> 
> i.e., set up 3 10 gb partitions "a" "b" and "c", and one 10 gb spare "d"
> 
> attach "d" as a mirror of "a", wait for sync, detach, backup "d"
> attach "d" as a mirror of "b", wait for sync, detach, backup "d"
> etc.

AFAICS you can do the same with LVM snapshots (not fully working yet).
Either create an LVM snapshot and backup the snapshot directly or copy
the snapshot to an extra lvol.
IMHO you get the same result by using a different machanism.


Just a thought
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
