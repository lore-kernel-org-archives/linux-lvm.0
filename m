Message-ID: <39089303.94A281A4@msede.com>
Date: Thu, 27 Apr 2000 21:20:35 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: hopper@omnifarious.mn.org
MIME-Version: 1.0
Subject: [linux-lvm] Difficulty with RH 6.x and LVM
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Eric M. Hopper <hopper@omnifarious.mn.org> ...

-------- Original Message --------
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Difficulty with RH 6.x and LVM
Message-ID: <20000427112349.A21088@omnifarious.mn.org>


	The lines in the patches assume that the kernel to be patched
calls md_make_request like this:

md_make_request(MINOR (bh[i]->b_dev), rw, bh[i]);

	The RedHat 6.x kernels seem to have a different md_make_request
that they call like this:

md_make_request(bh[i], rw);

	As you may notice, there is a large discrepancy here that is
rather worrisome, since the change to use rdev instead of dev can't be
made in any way.

	In drivers/block/md.c, RedHat's md_make_request looks like this:

int md_make_request (struct buffer_head * bh, int rw)
{
	int err;
	mddev_t *mddev = kdev_to_mddev(bh->b_dev);

	if (!mddev || !mddev->pers) {
		err = -ENXIO;
		goto out;
	}

	if (mddev->pers->make_request) {
		if (buffer_locked(bh)) {
			err = 0;
			goto out;
		}
		set_bit(BH_Lock, &bh->b_state);
		if (rw == WRITE || rw == WRITEA) {
			if (!buffer_dirty(bh)) {
				bh->b_end_io(bh, buffer_uptodate(bh));
				err = 0;
				goto out;
			}
		}
		if (rw == READ || rw == READA) {
			if (buffer_uptodate(bh)) {
				bh->b_end_io(bh, buffer_uptodate(bh));
				err = 0;
				goto out;
			}
		}
		err = mddev->pers->make_request(mddev, rw, bh);
	} else {
		make_request (MAJOR(bh->b_rdev), rw, bh);
		err = 0;
	}
out:
	return err;
}

	Any suggestions as to how I apply the patch?

Thanks,
--
Its name is Public Opinion.  It is held in reverence. It settles
everything.
Some think it is the voice of God.  Loyalty to petrified opinion never
yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org 
http://omnifarious.mn.org/~hopper) --
