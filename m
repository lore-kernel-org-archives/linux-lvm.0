Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 26 Apr 2001 08:25:09 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] I need to convert my root file system to LVM (adding a 2nd disk as well).
Message-ID: <20010426082509.A14077@tykepenguin.com>
References: <200104241645.f3OGjE001662@west.navpoint.com> <20010425083538.B806@tykepenguin.com> <200104252211.f3PMBK026102@west.navpoint.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104252211.f3PMBK026102@west.navpoint.com>; from raheesom@navpoint.com on Wed, Apr 25, 2001 at 01:03:29PM -0400
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 25, 2001 at 01:03:29PM -0400, Rupert Heesom wrote:
> On 25 Apr 2001 08:35:38 +0100, Patrick Caulfield wrote:
> > On Tue, Apr 24, 2001 at 11:39:02AM -0400, Rupert Heesom wrote:
> > If you're not very familiar with LVM I recommend you have a play with it on the
> > new disk before attempting to convert the root filesystem though.
> 
> I'm playing around with LVM on my 2nd spare disk (/dev/sdb).
> 
> The partitions are that disk now are -
> /dev/sdb1, /dev/sdb2
> 
> I've created Vol Grp "vg" (/dev/vg), and Log Vol "lvol1"
> (/dev/vg/lvol1).
> 
> I'm now trying to take one of the partitions out of the LV.  I'm hoping
> that I can run a command something like lvreduce /dev/sdb2 lvol1 (reduce
> lvol1 by taking /dev/sdb2 out of the vol), but the only way I can see of
> reducing lvol1 is by specifying the Mbs to reduce the LV by.   If I do
> this (specify the size of /dev/sdb2), how do I know that the LV will
> give it's space back to /dev/sdb2?
> It could easily give space back to /dev/sdb1 as well.
> 
> The part in the HOWTO about removing an old disk should help, but it
> doesn't.  It talks about vgextending to add the new disk into the VG,
> then vgreducing to take the old disk out of the VG.
> When I try to "vgreduce vg /dev/sdb2", I'm told that /dev/sdb2 is still
> active.
> How do I de-activate /dev/sdb2?
> 
> I think I'm getting the idea of all this slowly, but am still pretty
> confused overall!!

What you need to do is lvreduce the volume to the size of the PV /dev/sdb1
(which will be slightly smaller than the actual partition), then use pvmove to
move the used extents from sdb2 to sdb2. *then* you can vgreduce vg /dev/sdb2.

That might sound a little over-complicated but it's really the more common case
in "real world" situations to be LV focussed rather than PV focussed. (I think!)

patrick
