Return-Path: <raheesom@navpoint.com>
Message-Id: <200104261605.f3QG5tt09735@west.navpoint.com>
Subject: Re: [linux-lvm] I need to convert my root file system to LVM
	(adding a 2nd disk as well).
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <20010426082509.A14077@tykepenguin.com>
References: <200104241645.f3OGjE001662@west.navpoint.com>
	<20010425083538.B806@tykepenguin.com>
	<200104252211.f3PMBK026102@west.navpoint.com> 
	<20010426082509.A14077@tykepenguin.com>
Date: 26 Apr 2001 06:58:13 -0400
Mime-Version: 1.0
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

On 26 Apr 2001 08:25:09 +0100, Patrick Caulfield wrote:
> On Wed, Apr 25, 2001 at 01:03:29PM -0400, Rupert Heesom wrote:
> > On 25 Apr 2001 08:35:38 +0100, Patrick Caulfield wrote:
> > > On Tue, Apr 24, 2001 at 11:39:02AM -0400, Rupert Heesom wrote:
> What you need to do is lvreduce the volume to the size of the PV /dev/sdb1
> (which will be slightly smaller than the actual partition), then use pvmove to
> move the used extents from sdb2 to sdb2. *then* you can vgreduce vg /dev/sdb2.
> 
> That might sound a little over-complicated but it's really the more common case
> in "real world" situations to be LV focussed rather than PV focussed. (I think!)

Thanks, Patrick.  I'll try that.


-- 
regs
rupert
