Date: Fri, 20 Oct 2000 15:41:24 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] using previously created lvm
Message-ID: <20001020154123.A10018@colombina.comedia.it>
Reply-To: bluca@comedia.it
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

On Fri, Oct 20, 2000 at 01:07:12PM +0100, Frank Wray wrote:
> Hi All,
> 
> I would like to move a volume group from
> the HPUX 10.20 box that it was created on
> to a Linux box. The logical volumes are
> all of type HFS and currently on a single
> physical volume.
No way, the format of PV under HP-UX and linux are different,
besides Linux does not support HFS Filesystems.
you have to backup all data on the HP9000 then restore on
the linux.
Besides HP9000 mainly use scsi differential disks, which
do not work with Scsi single-ended controllers found on PCs

Regards,
L.


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
