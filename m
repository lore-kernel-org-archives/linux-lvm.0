From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] multiple volumes..
Message-Id: <611310000.1018387687@[192.168.200.4]>
In-Reply-To: <18044083656.20020409231800@tnonline.net>
References: <18044083656.20020409231800@tnonline.net>
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
Date: Tue Apr  9 16:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> I have a problem which I want to solve as efficiently as possible.
>
> The problem is that I have 13 drives os various sizes (30-120GB) which
> I want to combine into one (or a few) logical volumes with redundancy
> if one drive would fail.
>
> How would the smartest layout be? I was thinking about multiple
> partiontions and then combine them into several RAID 5 chains, and
> then use LVM to manage the logical volumes.
>
> There is an expamle of my ideas at http://www.tnonline.net/raid-lvm.png
> As you can see there are 8 chains and about 50 GB unallocated data in
> this example. Can I minimize the loss even better?
>
> Any help or insight in this would be greatly appreciaded

One way is to mirror the hard drives (requires an even number
of the same size/type) then build your LVM system on top of
the mirrored drives. Nice thing about this is that the messy
part (paring and mirroring the drives) is done once only and
is transparent to the LVM system.

If the drives are a motly collection of stuff, then you
may have to combine them into a VG then create LV's and
mirror those. Problem there is that there is a lot more
work involved in the maintinence: every time you want to
expand a volume you have to deal with mirroring issues.

If all of the storage doesn't need to be strictly mirrored
then you might be able to pair up however many drives you
can, leaving the un-paired ones for a separate LVM of non-
mirrored content used for higher-speed scratch space.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
