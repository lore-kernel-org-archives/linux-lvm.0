From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] software mirroring
Message-ID: <20020907204200.GA3481@localhost>
References: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com> <20020906201136.GB5094@localhost> <3256.24.46.54.254.1031409280.squirrel@mail.scottsavarese.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3256.24.46.54.254.1031409280.squirrel@mail.scottsavarese.com>
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
Date: Sat Sep  7 15:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Scott Savarese <scott@scottsavarese.com>

On Saturday, 07 September 2002, at 10:34:40 -0400,
Scott Savarese wrote:

> > Better the other way: RAID on top of physical disks (to get protection
> > against a disk failure) and above RAID (be it sotf or hard) LVM (the
> > inner layer gives you RAID1 capabilities, and LVM works as usual).
> 
> Is there any sort of procedure written on how to do this on a system with
> only two disks? If I mirror the disks, then I now have 1 logical disk, in
> which case I can't install LVM on top.
> 
There shouldn't be any problems at all, except for bootup: it can be
tricky (complex, prone to error or simply impossible, I don't know ;) 
to get a box boot off a LV on top of a software RAID1. But technically,
it should be as simple as creating a partition on each disk, creating
the RAID1 from them, initialize /dev/md0 as a PV for use with LVM,
create a VG consisting of just this PV, and finally create as many LV as
you need (size permitting).

I have not had the chance to try it by myself, due to lack of hardware,
but should work. Maybe the hard part is to do it at install time and get
the system to boot from a LV created this way.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
