Message-Id: <200401051744.i05HiJV16046@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040105160449.GC2849@riseup.net> (message from Micah Anderson
	on Mon, 5 Jan 2004 10:04:49 -0600)
Subject: Re: [linux-lvm] lvm fault tolerance
References: <20040105044435.GA25651@daemonB> <20040105160449.GC2849@riseup.net>
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
Date: Mon Jan  5 11:41:04 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>On Sun, 04 Jan 2004, Dmitry wrote:

>> Lets say I have a 3giger and and a 60giger.
>> I join them using LVM into one logical partition. Lets say the 3 giger
>> fails, do I have any hope recovering what resides on the 60 giger part
>> of the logical partition?

The 3GB hard drive is well beyond its warranty period by now and could
fail at any moment; it could be fine for many years to come, but is it
really worth the risk to increase total LVM space from 60GB to 63GB?
In my opinion, the 3GB hard drive is too small to be used effectively
with the 60GB hard drive in forming logical volumes.  How important is
it to have a 63GB logical volume versus a 60GB logical volume?

Micah Anderson wrote:

>You have some hope, but not much. You would have a lot of hope if you
>created a RAID mirror (I suggest software raid) and then used those
>resultant devices to create your giggers.

A RAID 1 mirror of a 3GB and 60GB drive would be 3G in size and "waste"
57GB of the 60GB drive.  It's not practical to construct a RAID 1 of two
drives whose capacity differs so greatly, especially when the smaller
drive is only 3GB in size and 1/20 the size of the larger drive.

Maybe the 60GB drive could be split into 20 3GB partitions and made to
appear as 20 3GB hard drives.  These 20 virtual 3GB hard drives and the
real 3GB hard drive could form a 21 hard drive RAID 5 with a total of
60GB of usable space.  However, performance would probably be bad, since
there are only 2 hard drive actuators rather than 21.  LVM striping
would obviously perform badly for the same reason on this setup.  LVM
can only perform as well as the physical volumes in the volume group.
BTW, I'm not seriously suggesting such a RAID 5 setup for production use.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
