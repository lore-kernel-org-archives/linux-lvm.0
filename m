From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Kernel PANIC after partition change on RedHat 8.0
Message-ID: <39470000.1042925295@[192.168.200.4]>
In-Reply-To: <Pine.LNX.4.44.0301172310100.24491-100000@keoma.mobiltel.bg>
References: <Pine.LNX.4.44.0301172310100.24491-100000@keoma.mobiltel.bg>
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
Date: Sat Jan 18 15:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> I have installed Red Hat Linux 8.0. I've made volume group (rootvg)
> from /dev/md1 (which is raid1). I've put my /boot on /dev/md0.
>
> As you already have noticed - I have two disks.
> After installation I'm making new partiotion /dev/sdb5 i.e.
> And if I change its to type to 8e after reboot kernel panics.
> If I change type of this partition to something different - the system
> boots fine.
>
> I cannot understand where can be the problem.
> I have to say that I made the same configuration on this machine and
> everything was ok. But now I cannot see any difference.

sdb5 => sub-partition. Are you accidentally carving out
a piece of an existing PV? For example, if you had partitioned
the disk into /dev/sdb[1234] when it was built with sdb4 taking
up most of the device as 8e (i.e., for LVM), then adding sdb5
w/in the area of sdb4 would certianly break things -- and scramble
your LV's during pvcreate on the new partition.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 773 252 1080
