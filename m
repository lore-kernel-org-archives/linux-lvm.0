Message-Id: <200001301944.UAA20420@e35.marxmeier.com>
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My first time)
Date: Sun, 30 Jan 2000 20:44:56 MEZ
In-Reply-To: <200001301813.TAA08383@u9etz.ez-darmstadt.telekom.de>; from "Heinz Mauelshagen" at Jan 30, 100 7:13 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelsha@ez-darmstadt.telekom.de
Cc: linux-lvm@msede.com

> IMO there's no obvious reason, why it should core there with size == 8.
> 
> Do you have an old libc in place by accident which might give us a
> reason to assume an broken malloc()?
> If so: try with an actual one.
> 
> Any ideas from other list members?

Conventional wisdom tells that when malloc crashes the free list
(aka arena) has been trashed. This can happen eg. by a double free
(some malloc versions check against this) or by writing beyond the
end of a buffer.

You might want to try the following:
env MALLOC_CHECK_=1 vgcreate ...

This will use a debugging version of malloc which might print
sone diagnostics to stderr if a problem is encountered.

see malloc(3) for additional information.


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
