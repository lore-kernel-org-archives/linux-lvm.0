From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] volume group setup question
Message-ID: <237790000.1034529697@[192.168.200.4]>
In-Reply-To: <Pine.LNX.4.44.0210131721350.23214-100000@gamay.kronodoc.fi>
References: <Pine.LNX.4.44.0210131721350.23214-100000@gamay.kronodoc.fi>
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
Date: Sun Oct 13 12:19:13 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


> i'm a LVM newbie trying to figure out how to setup volume groups on a new
> Linux system. the underlying physical volume will be a hardware RAID5
> disk. i'm thinking about having a non-LVM root partition and a logical
> volume per each of the major mount points in the system (/usr, /home,
> /tmp, /var etc.) but i'm having problems deciding whether to start with a
> volume group per logical volume or just one volume group with all the
> logical volumes in it?

You will have one vg for the physical storage and then split
it into lv's for the mount points. The only reason for multiple
vg's is multiple storage systems (e.g., storage blocks on an
EMC or a standalone Storage Works unit) next to your machine.

> is there any benefit from partitioning the RAID disk and having a separate

None whatsoever. vg's group pv's together; partition the
space with lv's.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
