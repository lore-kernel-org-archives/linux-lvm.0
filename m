From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] quick pvresize question
In-Reply-To: <20020417222416.GA29978@arohk.troll.no>
Message-Id: <Pine.LNX.4.44.0204172318010.3143-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Wed Apr 17 18:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 18 Apr 2002, Trond Are Haugland wrote:

> Hello people at Sistina!
>
> Is it possible/safe to resize a physical volume to use
> free space _before_ the start block of the pv?
>
> Thank you so much for creating LVM for Linux,
> it absolutely ROCKS :-)
> --
> Trond Are Haugland <trondare@trolltech.com>
> Trolltech AS
>

No, its not, pv cannot be expanded or reduced in size, A dirty hack would
be to create another PV on the disk, just make sure you speficy pvs when
you do striping so you don't strip the same drive ;-)

Its fine for concatinated volumes. If you have a spare disk and a little
time, create a new pv on your space disk use pvmove to mvoe from your old
disk to the temp. vgreduce out the old disks pv, repartion the disk then
create a new pv on it. vgexpand to the (old/new disk) then pvmove your
data back then vgreduce out your temp disk.

I have done this a few times :-) make sure you use latest version of lvm
there are some problems with pvmove before that.

James
