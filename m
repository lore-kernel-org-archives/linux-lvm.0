Message-ID: <387158FF.F4EBEFB1@msede.com>
Date: Tue, 04 Jan 2000 03:20:47 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: jamesp@emporia.u-net.com
MIME-Version: 1.0
Subject: [linux-lvm] [3 Questions... (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


-------- Original Message --------
Subject: 3 Questions...
Date: Tue, 4 Jan 2000 00:44:36 +0000 (GMT)
From: James Pattinson <jamesp@emporia.u-net.com>
X-Sender: jamesp@greebo.jj.net
To: linux-lvm@msede.com
Message-ID: <Pine.LNX.4.10.10001040025340.1128-100000@greebo.jj.net>

Hi,

I have a few questions... well... I keep thinking of more :)

1. Raid / LVM

Does anyone have a patch against 2.2.13 that contains both the LVM
patch
and the super-raid patch (the one that uses MMX)? I want to get max
performance by having a striped /dev/md0 as my PV. And are there any
plans
for coordination with the RAID team so there are no clashes?

2. LVM 0.8i kernel compile fails

I got an error yesterday while trying to compile the latest LVM patch
- it
failed with 'undefined reference to lvm_init' or something when
linking
the final kernel. The kernel config works fine with 0.7...

3. LVM in The kernel

Any idea if LVM will be in 2.4 / 3.0? I hope it is - I can't imagine
life
without LVM!

OK that's it for now - please keep up the very good work Heinz and
all...

James
