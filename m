Message-Id: <3.0.6.32.20000215121913.007eeac0@laplaza.org>
Date: Tue, 15 Feb 2000 12:19:13 -0500
From: Mats Wichmann <mats@laplaza.org>
Subject: Re: [linux-lvm] Mirroring
In-Reply-To: <200002120018.BAA24120@u9etz.ez-darmstadt.telekom.de>
References: <Pine.BSO.4.21.0002111344460.4652-100000@rincewind.lugh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

At 01:18 AM 02/12/2000 +0100, Heinz Mauelshagen wrote:
>> Hi, I am relatively new to this list, and to Linux LVM, but when Heinz was
>> at the U of MN last month, I asked this very question, and Heinz's
>> response was that there are not currently plans for mirroring LEs to PEs
>> precisely because this functionality is provided by md or RAID hardware.
>
>Yes.
>The LVM covers the dynamic allocation of storage.
>Either RAID soft- or hardware covers the redundancy.
>
>IMO you get a much simpler systemarchitecture this way which is much
>more reliable for day to day production.
>
>IOW: it saves your money.

perhaps...but it makes it impossible, if I've understood this
architecture, to use a floating mirror for live backups.

i.e., set up 3 10 gb partitions "a" "b" and "c", and one 10 gb spare "d"

attach "d" as a mirror of "a", wait for sync, detach, backup "d"
attach "d" as a mirror of "b", wait for sync, detach, backup "d"
etc.

(for redundant situations, "a" "b" and "c" may already be mirrored
so you're attaching the floater as an _additional_ mirror)

maybe the application for such usage is not widespread enough, though...
