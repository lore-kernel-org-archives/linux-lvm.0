Message-ID: <1045557392.f27fd349bc9f7@herzo.net>
From: Sebastian Wormser <sibbi@sibbi.com>
Subject: Re: [linux-lvm] Sharing Logical Volumes via NFS on Redhat 8.0
References: <F42fiyTqv4jvQUMRlap0003beef@hotmail.com>
In-Reply-To: <F42fiyTqv4jvQUMRlap0003beef@hotmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Date: Tue Feb 18 02:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Quoting DJ TweeQ <djtweeq@hotmail.com>:

> Regarding Sharing LVM LV's via NFS on Redhat 8.0...ie. mounting an LV from
> another machine while already having a LV on the same machine. Is it ok or
> not ok? I was talking to a buddy and he doesn't think it's a problem or an
> issue but...

Since there is no difference to the Samba server or the NFS server
whether the underlying file system is managed via LVM or not, there
should not be any problems regarding LVM.

> the current documentation on Sistina's site states that sharing LV's is
> dangerous unless it's a SCSI or Fibre Storage Device?...and not only that

This advice is only valid if you use the same LV on two different
nodes(=computers). If you use the LVM managed logival volumes on just
one node at a time, you should not run into any problems.

> I'm thinking that it might not be a good idea to try to do maintenance on a
> LV that is mounted on another system...but i think it makes a whole heck of
> alot of sense to create/resize/mount an LV on a system before trying to
> mount it via an NFS share. :)

It does make sense to not change the layout of the file system while the
nfs server is running, but otherwise there is no problem between any user
land application and LVM, since those applications are not aware that LVM
is managing the logical volumes they are accessing.

> Oh one other thing...if it has been proven that a Redhat 8.0 2.4-24?.x
> kernel can be patched to LVM 1.0.6+ ....will the data on those LV's be
> affected in any way or will it all be ok? :)

I'd go and see whether Redhat is providing Kernel packages containing
LVM 1.0.6.

cu,

  Sibbi
-- 
You can observe a lot by just watching.

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
