From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] How to best use LVM?
Message-ID: <135970000.1029422534@[192.168.200.4]>
In-Reply-To: <BDEMIPDEGABMNEFIHCPDCEMGDNAA.bill+f.9sfuw6uo@tao-group.com>
References: <BDEMIPDEGABMNEFIHCPDCEMGDNAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Thu Aug 15 09:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- William Blunn <bill+f.9sfuw6uo@tao-group.com>

>> 	- Can I use it to extend a RAID 5 set,
>> 	  or concatenate 2 RAID 5 sets together?

If you want better speed and are willing to use up more
space on parity, striping across RAID5 PV's is a nice,
stable way to go. RAID5 works better if the stripe size
is equal to the I/O page. So, let's say that you have
8 drives in two RAID5 sets with 4 disks each. Also say
that the chunk size is 1K, leaving the total stripe at 4K.

You can combine the two PV's together into, say, vg01.
With 9GN drives this gives you 27 x 2 = 54GB of space.

Now you can create LV's with a 4K stripe on the two
RAID sets. The striping is less of a risk because it
is unlikely for one of the RAID5 PV's to loose data.
Result is that you get the speed benefit without much
risk at all.

It is probably a bad idea to mix RAID types within the
same VG. You probably have a reason for using one type
of RAID mechanism over the other; mixing them only makes
it harder to use properly.

Concatenating groups of similarly RAID-ed hardware into
larger blocks of space is quite handy.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
