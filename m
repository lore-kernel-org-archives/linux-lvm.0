Return-Path: <Klaus.Steinberger@Physik.Uni-Muenchen.DE>
Message-ID: <3AE41D86.9CC5363@Physik.Uni-Muenchen.DE>
Date: Mon, 23 Apr 2001 14:18:14 +0200
From: Klaus Steinberger <Klaus.Steinberger@Physik.Uni-Muenchen.DE>
MIME-Version: 1.0
References: <200104231048.f3NAm3715005@pigpen.bl.physik.uni-muenchen.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #136 - 14 msgs
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

> > > > LVM, and RAID patch 2.2.19-A1? Applying all these patches seems to be
> > > > inpossible.
> > > This actualle workes out of the box (see Patches/README).=20
> > I'm glad to see you've got this working. =20
> I'm sorry, but I'm not using it, I've just patched the kernel. My
> "production" systems only use LVM with out RAID (well, on a hardware
> raid actually)

There is one little change necessary, which is not obvious from the
patches:

In drivers/block/md.c:

int md_make_request (struct buffer_head * bh, int rw)
{
        int err;
        mddev_t *mddev = kdev_to_mddev(bh->b_dev);
                                           ^^^^^  Change this to b_rdev

Then LVM on top of Softraid will work. I did this since 2.2.14 or so. I
did not yet test
it with 2.2.19, but probably will do it in the next days. 
But you should be aware of the following:
In 2.2.x kernel it is not safe to use Swap on top of Softraid, and
probably also not safe
to use any Journaling FS on top of Softraid because of write reordering
issues (actually
swap and journaling will work during normal system condition, but will
fail badly during
resyncing of the RAID). This has changed in 2.4.x.

Sincerely,
Klaus

-- 
Klaus Steinberger               Beschleunigerlabor der TU und LMU
Muenchen
Phone: (+49 89)289 14287        Hochschulgelaende, D-85748 Garching,
Germany
FAX:   (+49 89)289 14280        EMail:
Klaus.Steinberger@Physik.Uni-Muenchen.DE
URL: http://www.physik.uni-muenchen.de/~k2/

In a world without fences and walls, who needs Windows and Gates?
