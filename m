Message-Id: <200401291555.i0TFtm909711@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040129105713.GA12894@tykepenguin.com> (message from Patrick
	Caulfield on Thu, 29 Jan 2004 10:57:13 +0000)
Subject: Re: [linux-lvm] combining two vg's into one
References: <20040129022341.88184.qmail@web80402.mail.yahoo.com> <200401290444.i0T4iVX02132@ecstasy.winternet.com> <87ektj8dxm.fsf@swbell.net> <20040129105713.GA12894@tykepenguin.com>
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
Date: Thu Jan 29 10:49:02 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>On Thu, Jan 29, 2004 at 12:30:13AM -0600, Christopher Mark Conn wrote:

>> Thanks Ken, that's one thing I was wondering, is it 
>> better to keep one vg per pv. Sounds like I'm already
>> set up the way I need to be.

Patrick Caulfield wrote:

>I don't think so. One of the major points of LVM is that volumes can span
>physical disks and you can transparently add disks to the systems and grow
>existing LVs over them.

That is true, but LVM must be configured to the user's desires.  In this
case, Chris Conn wants / on one physical volume (actually a whole disk)
and /usr, /var and /tmp on another physical volume (again a whole disk).
The easiest way to ensure that these four logical volumes never span the
two disks is to define one volume group per disk.  Ideally one would
define a single volume group, but then one would have to use pvmove(8)
to keep each logical volume on a physical volume.

If Chris needs more flexibility, he can use vgmerge(8), pvmove(8) and
optionally vgsplit(8) to get logical volumes where he wants them. 

>To merge two Volume Groups, try the "vgmerge" command. The only
>prerequisite is that they have the same PE size (which is set at
>vgcreate time).

The sum of the attributes of the two volume groups must also be within
the limits of the destination volume group.  If any limit is exceeded,
vgmerge should refuse to do the merge.  Has this requirement changed?

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
