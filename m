Message-ID: <2005.24.46.54.254.1031578510.squirrel@mail.scottsavarese.com>
Subject: Re: [linux-lvm] software mirroring
From: "Scott Savarese" <scott@scottsavarese.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Mon Sep  9 08:41:18 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Jos=E9 Luis Domingo L=F3pez said:
> There shouldn't be any problems at all, except for bootup: it can be
> tricky (complex, prone to error or simply impossible, I don't know ;)
> to get a box boot off a LV on top of a software RAID1. But
> technically, it should be as simple as creating a partition on each
> disk, creating the RAID1 from them, initialize /dev/md0 as a PV for
> use with LVM, create a VG consisting of just this PV, and finally
> create as many LV as you need (size permitting).
>
> I have not had the chance to try it by myself, due to lack of
> hardware, but should work. Maybe the hard part is to do it at install
> time and get the system to boot from a LV created this way.

Bootup is definantly the issue right now... I created two raid1 sets
/dev/md0 and /dev/md1 on my second hard drive telling it that my first
harddrive was failed (so it wouldn't use it and break it). The first
will hold my /boot and the second (for now) will hold my /. I then
installed LVM onto my /dev/md1 and copied the filesystems over to the
appropriate locations. However after I configure lilo and fstab I have
issues. Depending on my lilo.conf I get either
L 80 80 80 ...
or
LI

Is there a proper way to boot up?
Thanks,
Scott
