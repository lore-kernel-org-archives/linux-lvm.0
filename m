From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM recovery
Message-ID: <20030721182359.Q31325@uk.sistina.com>
References: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com> <1058402110.1257.21.camel@neko> <3F164A80.6060301@free.fr> <1058752778.3f1b490ab9e47@webmail.phys.unsw.edu.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1058752778.3f1b490ab9e47@webmail.phys.unsw.edu.au>; from melinda@phys.unsw.edu.au on Mon, Jul 21, 2003 at 11:59:38AM +1000
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
Date: Mon Jul 21 12:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Melinda Taylor <melinda@phys.unsw.edu.au>
Cc: linux-lvm@sistina.com

On Mon, Jul 21, 2003 at 11:59:38AM +1000, Melinda Taylor wrote:
> lvm> vgchange --partial -a y

First off, you should take complete disk-level backups of your remaining disks
in the VG.

If the messages are accurate, there's likely to be only a problem with lv02, 
not lv03 which you're trying to mount, so try a normal (rw) mount of
lv03 and see if the ext3 recovery copes, or else try fsck.  If you took
the disk-level backups first you can restore the disks from the backups
if fsck makes things worse and you need to try other restoration
methods.

*AFTER* you've completed extracting your data, you can use LVM2's vgreduce
to tidy up the LVM configuration, removing the lost PVs and
partially-missing LV completely. But read the vgreduce man page first
and use --test before running it for real to check it's going to do
something sensible in your circumstances.

Alasdair
