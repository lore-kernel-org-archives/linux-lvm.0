From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] snapshot questions
Message-ID: <20011102153947.P746@lynx.no>
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net> <0111021341411E.08803@khayes-lin>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0111021341411E.08803@khayes-lin>; from khayes@quicknet.net on Fri, Nov 02, 2001 at 01:41:41PM -0800
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
Date: Fri Nov  2 16:39:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 02, 2001  13:41 -0800, Kyle Hayes wrote:
> I am confused by the claim (see below) that you need the same amount
> of space for the snapshot partition as you had on the original LV.

They are wrong.

> Under what circumstances do snapshots work?  I am confused by the
> claims that a snapshot partition is going to be "corrupt" as far as
> the OS is concerned.

You need to ensure that the the data/filesystem is "synced" at the
time that you create the snapshot.  With journaling filesystems,
you need to use the VFS locking.  With other filesystems, you
should be OK with a "sync" (which is done for you in the kernel).
For oracle, you need to put your tablespaces into hot backup mode.

> 1) lock all tables against writes.

Is this the same as hot backup?  At a company I used to work for, we
did live backups without any kind of outage.  Oracle would commit
the writes into a journal (or whatever, don't know the correct term)
and then commit them once the table was out of hot backup mode.  No
need to lock all writes.

Depending on your I/O and response requirements, you can do the backups
while your tables are in hot backup mode, without using snapshots at
all.  

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
