Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 7 Aug 2001 14:51:21 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Two computers with one shared array?
Message-ID: <20010807145121.D677@tykepenguin.com>
References: <20010807153154.P495@hogia.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010807153154.P495@hogia.net>; from sa@hogia.net on Tue, Aug 07, 2001 at 03:31:54PM +0200
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

On Tue, Aug 07, 2001 at 03:31:54PM +0200, Sebastian Andersson wrote:
> I've got two computers connected to a JBOD array.
> On it I've got 3 VGs and a bunch of free disks.
> I'd like to use 2 of the VGs on one of the computers and the
> other VG on the other computer.
> 
> Should I still vgscan on both computers at startup and then
> vgchange -a y VG1 VG2 on the first computer and
> vgchange -a y VG3 on the other computer?
> 
> Is it safe to vgchange -a n  on both computers or should
> I only vgchange -a n VGx ?
> 
> Can I change the LVGs in a VG or do I need to inactivate everything on
> the other computer while I do this and then vgscan after I'm done?


First advice: BE VERY CAREFUL!

vgchange simply affects the kernel's view of the metadata so you can do that any
time you like on either node. similarly vgscan should also be OK to run at
system startup because it only reads metadata and updates the local cache files.

If you need to do any changes you MUST vgchange -an on one machine before
changing metatdata on the other. THEN do a vgscan before vgchange -ay.

So, yes the startup sequence of vgscan/vgchange is the same as for a single node
system but *ANY* metadata changes must be done from one node while the other has
no LVM data in kernel.

I feel a FAQ entry coming on!

patrick

P.S. Of course, if you actually want to share the data on the disks you could
use GFS!
