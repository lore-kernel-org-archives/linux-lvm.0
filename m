Date: Fri, 15 Oct 1999 14:15:37 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: Re: [linux-lvm] lvmcreate_initrd
Message-ID: <19991015141537.A30970@cyberhqz.com>
References: <Pine.HPP.3.96.991015141634.18374A-100000@falstaff.ucs.indiana.edu> <199910151952.AA28793@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199910151952.AA28793@mailgate1b.telekom.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Fri, Oct 15, 1999 at 09:52:32PM +0000, Heinz Mauelshagen wrote:
> > 
> > libc.so.6 alone is 4017K. Am I doing something wrong? I have been trying

That sounds like your libc has debugging symbols.  strip libc.so.6 (do
not do this on your *live* libc, however, or very bad things will
happen).  My libc.so.6 is 800k.

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
