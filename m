Message-ID: <38C43860.64241E97@msede.com>
Date: Mon, 06 Mar 2000 23:59:44 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] building the binary utilities
References: <20000306222239.14845.qmail@web106.yahoomail.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Campbell <dash_ampersand@yahoo.com>
Cc: linux-lvm@msede.com

Chris Campbell wrote:
> I got a patched kernel to compile ok, but now I have
> problems building the binary lvm utilities.  There are
> errors about not being about to find lvm.h and
> liblvm.h.  I copied them to /usr/include, and then it
> got farther but complained about gnu/types.h.  After
> symlinking that, I got an error about lots of
> redeclarations.  What's going on?  Thanks.

At least for glibc2.1 you need a patch for the user mode tools,
otherwise compile fails. Please install patch patch-lvm_0.8final-2

For a list of know issues please have a look at
http://linux.msede.com/lvm/doc/BUGS

Instead of copying lvm.h to /usr/include you should modify the
KERNEL_LOCATION in make.tmpl. By default it assumes your kernel 
sources in /usr/src/linux.


Hope this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
