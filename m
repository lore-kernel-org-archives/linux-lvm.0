Message-ID: <38C632C4.FC682FC4@ep-ag.com>
Date: Wed, 08 Mar 2000 12:00:20 +0100
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] building the binary utilities
References: <20000307213810.3824.qmail@web117.yahoomail.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Campbell <dash_ampersand@yahoo.com>
Cc: linux-lvm@msede.com

Chris Campbell wrote:
> 
> kernel location is what it should be, but I still get
> all these errors.  I'm not sure what's going on, other
> than it can't find the lvm and liblvm header files,
> which are in a directory below the current one:
Hi Chris,

the variable TOP in your '/root/lvmstuff/LVM/0.8final/make.tmpl' is set
to '/root/LVM/0.8final', as you could see in following snipped from your
make-errors file:

cc -c -pipe -Wall -O2 -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8fina
l/tools -o basename.o basename.c
cc -c -pipe -Wall -O2 -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8fina
l/tools -o debug.o debug.c
basename.c:34: liblvm.h: No such file or directory

the -I options in the gcc line are expanded from '-I$(TOP)/tools/lib
-I$(TOP)'. You should control your changes in config files at first when
your're searching for errors before you start symlinking around ;-).

Bye
Klaus

-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
