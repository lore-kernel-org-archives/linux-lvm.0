Date: Thu, 18 Feb 1999 02:06:14 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] Problems on compile
In-Reply-To: <Pine.GSO.3.96.990218002100.11391B-100000@eesnop1.ews.uiuc.edu>
Message-Id: <Pine.GHP.4.05.9902180204330.11349-100000@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Stamborski <cstambor@uiuc.edu>
Cc: linux-lvm@msede.com

On Thu, 18 Feb 1999, Chris Stamborski wrote:

> 
> I haven't seen this answered anywhere on the website or on the mailing
> list.  It's a simple error, but my coding skills are a little rusty...
> 
> Stats:
> 
> RedHat 5.2, glibc system
> kernel 2.2.0 (patched with the a version of the lvm kernel patch) compiled
> 	smp 
> dual p200 system 
> 
> lvm code image lvm-19990213, I have the same problem with
> lvm_0.5alpha

I remember this... It seems LVM has just a little trouble compiling
when you configure you kernel just right... I bet you have a bunch
of alien pertition types supported in your .config?

I might have a fix.. I'll dig.

-Shawn
<=========== America Held Hostage ===========>
   Day 2220 for the poor and the middle class. 
   Day 2239 for the rich and the dead.
   702 days remaining in the Raw Deal.
<============================================> 
