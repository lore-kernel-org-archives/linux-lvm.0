Date: Fri, 18 Apr 2008 10:35:13 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] snapshotting to a different volume group
Message-ID: <chaz20080418093513.GD20413@artesyncp.com>
References: <chaz20080417145809.GA20413@artesyncp.com>
	<20080418082436.GA7331@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080418082436.GA7331@redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

2008-04-18 10:24:36 +0200, Heinz Mauelshagen:
> On Thu, Apr 17, 2008 at 03:58:09PM +0100, Stephane Chazelas wrote:
[...]
> > is it possible to create a snapshot LV of an original LV
> > but in a different volume group?
> 
> No, not with LVM.

Hi Heinz,

thanks. I've just come accross zumastor while reading the ML
archives. It looks promising for what I'm trying to achieve. I
suspect it's gonna be the same wrt to snapshot though, but I'll
give it a try.

> > or alternatively, what's the best way to bring up a LV in a VG
> > that is missing a PV (as in a disk crash) if that LV has all its
> > extents on still sane PVs?
> 
> vgchange -P -ay

Oh thanks. I missed that as the option was described in lvm(8)
and not in vgchange(8). I'll see how to make it fit in the
initrd scripts.

> If you have 2 disks, you better mirror them to be completely
> HA on the spindle side of things and avoid any such config hassle,
> potentially leaving you with lost data.
[...]

I didn't get that ("the spindle side of things"??). Do you mean
I should mirror the whole disks? Note that they are not the same
size. The thing is I have 400 GB of disk space available, I only
need 100GB of data to be "safe". If I had 2 200GB drives and
wanted to mirror everything, and have 50GB for snapshots, that
would leave me with 150 GB for data. While as I need only 100GB
of safe data and don't need the snapshots to be mirrored. I can
have 250 GB of storage, 150 GB of which I don't care if it's
lost (mirrors and snapshots).

Best regards,
Stephane
