Date: Wed, 10 Mar 1999 17:44:00 -0600
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: [linux-lvm] Bonehead problem
Message-Id: <19990310174400.A21548@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

When I upgraded to v0.6 from v0.5alpha, I end up having
to keep the old v0.5 version of vgscan around.

Reason? Well, this is WEIRD... v0.6 vgscan always errs out
with 96, or, invalid IO/protocol version. Then, I use v0.5
vgscan, and the same happens. Then, I use v0.6 vgscan again,
and IT WORKED!

What the hell is going on?

-- Shawn
<=========== America Held Hostage ===========>
   Day 2240 for the poor and the middle class. 
   Day 2259 for the rich and the dead.
   682 days remaining in the Raw Deal.
<============================================> 
