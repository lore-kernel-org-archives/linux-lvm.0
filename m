Return-Path: <ragnark@stine.vestdata.no>
Date: Wed, 28 Mar 2001 00:45:08 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM and fault tolerance
Message-ID: <20010328004508.K20535@vestdata.no>
References: <Pine.LNX.4.30.0103211228450.8192-100000@flowers.house.larsshack.org> <3ABA91DE.29985185@tnonline.net> <0103262137020G.01456@lyta> <3AC10AC8.14A64F76@tnonline.net> <20010327235600.H20535@vestdata.no> <3AC1142D.C47A9C96@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3AC1142D.C47A9C96@tnonline.net>; from Anders Widman on Wed, Mar 28, 2001 at 12:29:01AM +0200
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Mar 28, 2001 at 12:29:01AM +0200, Anders Widman wrote:
> ok. great... so if I make say 20GB partitions on all disks and put them
> in a RAID-5 array. Can I add extra disks and rebuild the array? I have
> seen some expensive RAID cards that does that.

I don't really understand your question....

It usually doesn't make sense to split a disk in smaller partitions and
RAID them togheter. If the whole disk dies, you loose two partitions and
your whole RAID-array.

The software raid implementation in linux doesn't allow you to add more
disks to an existing array, but of course you can delete your array and
create a new one with more disks. Some hardware raid implementations
(and possible some software-raid implementations too) allow you to add
more drives without redoing the array.


--=20
Ragnar Kj=EF=BF=BDrstad
Big Storage
