Date: Thu, 14 Oct 1999 23:14:32 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: Re: [linux-lvm] Problem with 2.2.11 / LVM 0.7 / DEVFS
Message-ID: <19991014231432.A29739@cyberhqz.com>
References: <4.2.1.9.19991014203859.00a7ad30@mail.msy.bellsouth.net>
Mime-Version: 1.0
In-Reply-To: <4.2.1.9.19991014203859.00a7ad30@mail.msy.bellsouth.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com, heimdall@mail.org

On Thu, Oct 14, 1999 at 08:44:59PM -0500, Daniel Whicker wrote:
> Gang,
> 	I just compiled 2.2.11 with LVM 0.7 and Devfs v99 and am running into an 
> odd problem.  Whenever I issue a vgscan it simply doesn't see one of my 
> VGs.  It doesn't error out, and it doesn't display anything about my second 

This is becoming a very common FAQ.  The problem is some code in one of
the libraries that tries to be "smart" and not test devices that don't
exist.  The problem is, if you don't have exactly fifteen of the devices
it wants to test, some valid devices can be skipped.  Check the
archives, there are several patches to remove this part of code.

> /dev/ide/hd/cXXX entries.  If I reboot the machine without devfs, I can see 
> and use the VG on the second disk just fine.

Most likely because your non-devfs /dev has the required exactly-fifteen
of everything.

> Anyone have any ideas?

I'd like to see a 0.8 real soon that fixes this, as the error is not
very explanatory unless you've seen it before (or traced through the
code before :))

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
