Message-Id: <199903111527.QAA08350@e35.msede.com>
Date: Thu, 11 Mar 1999 10:27:02 -0500
From: "Verloove, Olivier" <olivier_verloove@merck.com>
Subject: RE: [linux-lvm] Bonehead problem
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Yes... indeed, creating the device file solved the problem.

Now, I ran vgscan and it hanged the system :-(
Here's what I found in the syslog:

Mar 11 16:07:17 cobalt modprobe: can't locate module char-major-109
Mar 11 16:07:20 cobalt kernel: LVM version 0.6  by Heinz Mauelshagen
(26/02/199
9)
Mar 11 16:07:20 cobalt kernel: lvm -- Module successfully initialized
Mar 11 16:07:24 cobalt kernel: cdrom: open failed.
Mar 11 16:07:24 cobalt modprobe: can't locate module block-major-22
Mar 11 16:07:24 cobalt last message repeated 5 times
Mar 11 16:07:24 cobalt modprobe: can't locate module block-major-33
Mar 11 16:07:24 cobalt last message repeated 5 times
Mar 11 16:07:24 cobalt modprobe: can't locate module block-major-34
Mar 11 16:07:24 cobalt last message repeated 5 times
Mar 11 16:07:24 cobalt kernel: VFS: grow_buffers: size = 16
Mar 11 16:07:25 cobalt last message repeated 2613 times
Mar 11 16:07:25 cobalt kernel: Kernel panic: Free list corrupted Mar 11
16:07:17 cobalt modprobe: can't locate module char-major-109
Mar 11 16:07:20 cobalt kernel: LVM version 0.6  by Heinz Mauelshagen
(26/02/199
9)
Mar 11 16:07:20 cobalt kernel: lvm -- Module successfully initialized
Mar 11 16:07:24 cobalt kernel: cdrom: open failed.
Mar 11 16:07:24 cobalt modprobe: can't locate module block-major-22
Mar 11 16:07:24 cobalt last message repeated 5 times
Mar 11 16:07:24 cobalt modprobe: can't locate module block-major-33
Mar 11 16:07:24 cobalt last message repeated 5 times
Mar 11 16:07:24 cobalt modprobe: can't locate module block-major-34
Mar 11 16:07:24 cobalt last message repeated 5 times
Mar 11 16:07:24 cobalt kernel: VFS: grow_buffers: size = 16
Mar 11 16:07:25 cobalt last message repeated 2613 times
Mar 11 16:07:25 cobalt kernel: Kernel panic: Free list corrupted 

I had a look in major.h and 22, 33, 34 corresponds to IDE1_MAJOR, IDE2_MAJOR
and IDE3_MAJOR ?

Any idea.

To summarize, this is a new install (no VG created) of Linux 2.2.2 (without
devfs) + LVM 0.6.
I have MD compiled in the kernel ... but no MD device created.

Thanks.

Olivier
> ----------
> From: 	Klaus Strebel[SMTP:stb@ep-ag.com]
> Reply To: 	antivirus@ep-ag.com
> Sent: 	Thursday, 11 Mar, 1999 15:56
> To: 	Verloove, Olivier
> Cc: 	linux-lvm@msede.com
> Subject: 	Re: [linux-lvm] Bonehead problem
> 
> Hi Olivier,
> 
> "Verloove, Olivier" wrote:
> > 
> > I have the same problem (Linux 2.2.2 + LVM 0.6).
> > With or without lvm module loaded, I get:
> >         vgscan -- invalid i/o protocol version
> > 
> > Is there another module which should be loaded at the same time ?
> > lsmod gives me:
> >         lvm     26960   0  (unused)
> Do you have the char-device /dev/lvm (Major 109, Minor 0) ? The LVM-0.5
> module
> seems to create this device, if it doesn't exist. The LVM-0.6 seems not to
> do
> this, i use devfs and i have to create the device each time before i load
> the
> module.
> 
> Cheers
> Klaus
> -- 
> Klaus Strebel
> stb@ep-ag.com
> EIGNER + PARTNER AG   - The Engineering Warehouse Company -
> <http://www.ep-ag.com>
> -----------------------------------------------------------------------
> In Heaven there will be no DOS, no Intel, and above all, no Bill Gates.
> 
