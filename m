Content-Class: urn:content-classes:message
Subject: RE: [linux-lvm] read-only media in a LVM?
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <C42D120999B1CC4C886B6BB2832F356019BF95@hermes.genomatica.com>
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
Date: Tue Jun 24 18:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Wolfgang, can I get your email address so that I can ask you a few
questions about this off-line?

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
From: Wolfgang Weisselberg [mailto:uzx87lvfmukwc001@sneakemail.com]=20
Sent: Monday, June 23, 2003 17:35
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] read-only media in a LVM?


Sean P. Kane wrote 78 lines:

> I'd love to have a unionfs, but my understanding is that no such beast

> exists for Linux 2.4 currently

Try looking at=20
    http://plasticfs.sourceforge.net/plasticfs.html

Plasticfs-viewpath is basically a unionof all filesystems in the
viewpath, changes happen on the first one and a .whiteout remembers what
you deleted.  It does *not* work for root (security!!!  You do not want
root to see /tmp/login instead of /bin/login!).  Remember to set the
environment variables, e.g.

    LD_PRELOAD=3D/usr/local/lib/libplasticfs.so
    PLASTICFS=3D"viewpath /ramdisk /cdrom1 /cdrom2"
    /bin/bash   # or whatever program you want.

Since Plasticfs works on file-level, you should be able to mix and match
filesystems as you like.  Note however that --- since we just overload
common FS access methods --- some things might not work.

I have it in production use (for Aegis, not for cdroms).

-Wolfgang

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
