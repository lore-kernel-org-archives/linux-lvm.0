Subject: Re: [linux-lvm] LVM on top of a 3ware 7500-12 RAID5 set.
References: <4.3.2.7.2.20020817000006.02708b78@mail.bussink.ch>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Erik Bussink's message of "Sat, 17 Aug 2002 00:06:21 +0200"
Message-ID: <ufad6siifx3.fsf@epithumia.math.uh.edu>
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
Date: Fri Aug 16 17:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "EB" == Erik Bussink <mailinglist@bussink.ch> writes:

EB> But when I start I'll probably only get 5 disk, and add disks to
EB> the system as my need grow. This is where the LVM will help me
EB> expand the LVs.

You can't just add a disk to a RAID5 set, though, unless 3ware has
added that feature very recently.  You can add a whole new RAID set
and add it to your volume group, of course.

 - J<
