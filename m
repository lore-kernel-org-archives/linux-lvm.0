From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] remove a drive from an array not like described in
 the howto
Message-ID: <516030000.1033706178@[192.168.200.4]>
In-Reply-To: <5.1.1.6.2.20021003172132.01df4738@pop.tvnet.hu>
References: <5.1.1.6.2.20021003172132.01df4738@pop.tvnet.hu>
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
Date: Thu Oct  3 23:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> I would like to remove a HD from my VG, but the VG contains an LV, that
> uses the entire space of the VG. the howto describes I have to pvmove
> everything from my HD I want to remove to another physical volume in the
> VG. well I have no other physical volume for this purpose. is this a good
> way to resize my partition with resize_reiserfs, and then lvreduce my LV,
> then vgreduce the physical volume from it? is this a good way to not
> loose my data? regards,

The safest way to do this is backing up the offending LV
source at the unix file system level (e.g., via cpio to
a tape or another LV), do whatever you are going to do,
then restore the data.

Even if the pvmove shuffle operation works perfectly,
you'll still need to back it all up in advance just in
case the move fails and scrambles your data.

If you back the data up onto a spare disk drive (e.g.,
find /lvmountpoint -xdev | cpio -ov -Hcrc > /dev/vgXX/templv;)
then the backup operation won't take all that long and
you may be able to restore it all in less time than
dealing with the shuffle operation.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
