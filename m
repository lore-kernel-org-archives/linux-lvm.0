Message-ID: <38A0C594.DC58EC3B@msede.com>
Date: Wed, 09 Feb 2000 02:40:36 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Library strangeness
References: <Pine.LNX.4.10.10002090009460.18572-100000@greebo.jj.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: James Pattinson <jamesp@aethos.co.uk>
Cc: linux-lvm@msede.com

James Pattinson wrote:
> I think this could be the offending line, from tools/Makefile:
> 
> XLINKER = -Xlinker -rpath $(TOP)/tools/lib -Xlinker -rpath /lib -Xlinker

I agree that the default option in the tools/Makefile should be
linking with /lib/liblvm.so.

The additional rpath is helpful during development but as LVM 
is now delving in a user environment  this should no longer be the
default option.

> Perhaps -rpath $(TOP)/tools/lib needs to be /after/ the rest?

No. This defeats the purpose: Build a new library and have all
tools use it (overriding the installed one) without having to
install a development library.

The -rpath $(TOP)/tools/lib should not be part of the default
build options.


Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
