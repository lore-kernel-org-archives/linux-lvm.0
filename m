Date: Fri, 20 Oct 2000 16:23:58 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] using previously created lvm
Message-ID: <20001020162358.I442@jadzia.josv.com>
References: <000401c03a8e$4861a620$a200a8c0@babbage.siliconinfusion.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000401c03a8e$4861a620$a200a8c0@babbage.siliconinfusion.com>; from frank_wray@siliconinfusion.com on Fri, Oct 20, 2000 at 01:07:12PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wray <frank_wray@siliconinfusion.com>
Cc: linux-lvm@msede.com

As far as I know, this will NOT work, because:

a) The HP-UX and Linux LVM disk layouts are different, so vgscan on
   Linux will not recognise the disks.
b) And even if vgscan would recognise it, Linux does not support the
   HP-UX HFS.

++Jos

And thus it came to pass that Frank Wray wrote:
(on Fri, Oct 20, 2000 at 01:07:12PM +0100 to be exact)

> Hi All,
> 
> I would like to move a volume group from
> the HPUX 10.20 box that it was created on
> to a Linux box. The logical volumes are
> all of type HFS and currently on a single
> physical volume.
> 
> Anybody have any experience in doing this?
> Will vgscan recognise a HPUX vg?
> 
> Many thanks in advance
> Frank

-- 
Never underestimate the power of denial.
