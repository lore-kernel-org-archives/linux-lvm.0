Return-Path: <andewid@tnonline.net>
Message-ID: <3AC10AC8.14A64F76@tnonline.net>
Date: Tue, 27 Mar 2001 23:48:56 +0200
From: Anders Widman <andewid@tnonline.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and fault tolerance
References: <Pine.LNX.4.30.0103211228450.8192-100000@flowers.house.larsshack.org> <3ABA91DE.29985185@tnonline.net> <0103262137020G.01456@lyta>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Is it possible to have more than 5 disks in a raid-5 array?

Russell Coker wrote:

> On Friday 23 March 2001 10:59, Anders Widman wrote:
> > > For example, you can create a number of md devices, using RAID1 or RAID5
> > > for fault tolerance, and then run pvcreate on them and manage them with
> > > lvm.
> > >
> > > I'm doing this right now with a 4-disk RAID5 array (3 disks + 1 hot
> > > spare), and it seems to be working just fine.
> >
> > So, how is this actually working then. Let say I have this disk
> > configuration:
> >
> > 2x 40gb
> > 2x 60gb
> > 2x 80gb
> >
> > I want maximum amount of diskspace available for storage. High speed is not
> > needed at all as this is mainly for storage and streaming low bitrate
> > media. Still, I need to be able to add additional disks, maybe two extra
> > 80gb disks. Would it be possible to keep ecc/crc data on one disk only, or
> > stripe it over all disks. Mirroring is to expensive in this sence too.
> >
> > The problem with RAID-5 is that all disks need to be of the same size and
> > that it is not expandable (or is it?).
>
> Create a 40G partition on each disk and run RAID-5 over them for 200G of
> redundant storage.
> Then create a 20G partition on each 60G and 80G disk and make a RAID-5 on
> them for 60G of redundant storage.
> Then create another 20G partition on each 80G disk and run RAID-1 on them for
> 20G of redundant storage.
>
> That gives 280G of RAID storage.  But having 2*RAID-5 and one RAID-1 set on
> the same 80G disks won't be good for performance.
>
> --
> http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
> http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
> http://www.coker.com.au/projects.html Projects I am working on
> http://www.coker.com.au/~russell/     My home page
