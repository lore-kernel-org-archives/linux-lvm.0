Message-ID: <3894AF87.E9DF6C58@msede.com>
Date: Sun, 30 Jan 2000 22:39:19 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My 
 first time)
References: <200001301944.UAA20420@e35.marxmeier.com> <3894AD20.F826BEFF@alwan.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>

Chris Anderson wrote:
> 
> Michael Marxmeier wrote:
> > You might want to try the following:
> > env vgcreate ...
> 
> This is printed out when I set the check.  Also it does not crash if I set
> it to 1.
> 
> malloc: using debugging hooks
> realloc(): invalid pointer 0x804b730!
> 
> Whats next?  Should I look for a double free?

Probably. If you set MALLOC_CHECK_=2 you get an instanteous
core dump (by the virtue of abort()) so you can fire up your 
favourite debugger and look the call chain.

This suspicously looks like the bug documented in
http://linux/lvm/doc/BUGS

You _did_ make the suggested fix for
tools/lib/lvm_tab_vg_check_exist_all_vg.c ?


Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
