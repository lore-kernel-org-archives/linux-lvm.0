content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] read-only media in a LVM?
Message-ID: <C42D120999B1CC4C886B6BB2832F356019BF90@hermes.genomatica.com>
From: "Sean P. Kane" <spkane@genomatica.com>
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
Date: Mon Jun 23 18:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'd love to have a unionfs, but my understanding is that no such beast
exists for Linux 2.4 currently and won't likely appear until after the
2.6 release. If this is not the case, I would love to hear about it. Is
there some decent (although maybe beta) support for a unionfs in the 2.5
kernels? I am using the LVM2 backport to 2.4 currently to test the
device-mapper approach out in the meantime, but if there is a better way
to do it, I'd love to hear about it.

Thanks,
Sean


------------------------------------------------------------------------
Sean P. Kane
spkane@genomatica.com
Lead Infrastructure Architect
Genomatica, Inc.
------------------------------------------------------------------------
"When we destroy something man has created we call it vandalism......
 When we destroy something that Gaia has created we call it progress."


-----Original Message-----
From: Kevin P. Fleming [mailto:kpfleming@cox.net]=20
Sent: Monday, June 23, 2003 15:41
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] read-only media in a LVM?


Sean P. Kane wrote:

> Ok, let me clarify a bit. I mis-spoke, when I spoke of memory I meant=20
> ramdisk (fs). This is basically what I was actually visualizing in my
> head:
>=20
> 1) Boot cdrom into a Linux instance.
> 2) Mount a read-write filesystem into memory (this is why I asked the=20
> size issue, obviously coping the whole cdrom to memory wouldn't be
> practical)
> 3) Create a snapshot (I'm am really new to lvm, so I'm still learning=20
> what all this means), which would be a small reference table of some=20
> sort, plus 32k blocks of changed data. 4)This would then allow=20
> "changes" to the cdrom while running in that session until the ram=20
> disk filled up? Correct?
> 5) If a file is created then deleted in an environment like this will=20
> the space it was using in the snapshot fs be released?
>=20

This is not really an application for LVM snapshots at all. Snapshots
would=20
continue to use more and more memory if those files are created and
removed,=20
unless the underlying filesystem is very intelligent about space
allocation=20
(which the iso9660 filesystem is very likely not).

This is really an application for a "union" mount. This could also be
done with=20
a "bind" mount, if the files that need changing can be isolated to a
small=20
number of directories. If they are spread all over the filesystem, or
their=20
locations are not known ahead of time, a "union" mount would do what you
need,=20
overlaying a tmpfs ram-based filesystem on top of the CD-ROM filesystem.


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
