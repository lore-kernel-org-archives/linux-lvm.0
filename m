From: "Frank Wray" <frank_wray@siliconinfusion.com>
Subject: RE: [linux-lvm] using previously created lvm
Date: Fri, 20 Oct 2000 15:19:06 +0100
Message-ID: <000a01c03aa0$b57e3720$a200a8c0@babbage.siliconinfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20001020154123.A10018@colombina.comedia.it>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bluca@comedia.it
Cc: linux-lvm@msede.com

> On Fri, Oct 20, 2000 at 01:07:12PM +0100, Frank Wray wrote:
> > Hi All,
> > 
> > I would like to move a volume group from
> > the HPUX 10.20 box that it was created on
> > to a Linux box. The logical volumes are
> > all of type HFS and currently on a single
> > physical volume.
> No way, the format of PV under HP-UX and linux are different,
> besides Linux does not support HFS Filesystems.
> you have to backup all data on the HP9000 then restore on
> the linux.
Apologies - I had confused the HFS support with what turns
out to be Mac HFS support

> Besides HP9000 mainly use scsi differential disks, which
> do not work with Scsi single-ended controllers found on PCs
We started out with older C-class machines that 
had differential interfaces, then later machines
had plain wide interfaces until the latest upgrade
to a B-class machine which has LDV interfaces! How
are you meant to keep up??? - Long live Linux:)

A shame that a straight forward port was not possible, but
many thanks for the help
Frank
