Subject: Re: [linux-lvm] read-only media in a LVM?
Message-ID: <6805-61260@sneakemail.com>
References: <3EF781FB.2000804@cox.net> <C42D120999B1CC4C886B6BB2832F356019BF90@hermes.genomatica.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C42D120999B1CC4C886B6BB2832F356019BF90@hermes.genomatica.com>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Mon Jun 23 19:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sean P. Kane wrote 78 lines:

> I'd love to have a unionfs, but my understanding is that no such beast
> exists for Linux 2.4 currently

Try looking at 
    http://plasticfs.sourceforge.net/plasticfs.html

Plasticfs-viewpath is basically a unionof all filesystems in
the viewpath, changes happen on the first one and a .whiteout
remembers what you deleted.  It does *not* work for root
(security!!!  You do not want root to see /tmp/login instead of
/bin/login!).  Remember to set the environment variables, e.g.

    LD_PRELOAD=/usr/local/lib/libplasticfs.so
    PLASTICFS="viewpath /ramdisk /cdrom1 /cdrom2"
    /bin/bash   # or whatever program you want.

Since Plasticfs works on file-level, you should be able to mix
and match filesystems as you like.  Note however that --- since
we just overload common FS access methods --- some things might
not work.

I have it in production use (for Aegis, not for cdroms).

-Wolfgang
