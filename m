Message-ID: <38C4B6E7.C8E1DFC3@ep-ag.com>
Date: Tue, 07 Mar 2000 08:59:35 +0100
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] strip lvmcreate_initrd fails
References: <38C4886B.B98FDDE6@netconnect.com.au>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bug1 <bug1@netconnect.com.au>
Cc: linux-lvm@msede.com

bug1 wrote:
> 
> I think ive got everything installed now, one problem i ran into was
> when i did make install the installer tried to strip lvmcreate_initrd.
> 
> lvmcreate_initrd does not appear to be elf or a.out.
> 
> Its easy to work around this by compying by hand and changing file
> permissions, but i thought it was worthy of a mention anyway.
Hi Glenn,

well, lvmcreate_initrd is a shell script. Shell scripts don't have a
symbol table for debuggers, that can be removed (that's what strip's
main purpose is). If the warning is annoying you, patch the make file
for the utils and send it to us ;-).

Cheers
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
