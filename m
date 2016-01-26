Date: Tue, 26 Jan 2016 18:03:18 +0100
From: Tomas Janousek <tomi@nomi.cz>
Message-ID: <20160126170318.GA1529142@nomi.cz>
References: <55C86723.4000707@siteground.com>
	<20150810174900.GC22719@redhat.com>
	<55C9AD4F.5050900@siteground.com>
	<20150811143526.GB29369@redhat.com>
	<55D45D08.3060508@siteground.com> <20160122171828.GC771114@nomi.cz>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160122171828.GC771114@nomi.cz>
Subject: Re: [linux-lvm] lvremove does not pass discards if volume is part
	of thin pool
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: vaLentin chernoZemski <valentin@siteground.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-lvm@redhat.com

Hello all again,

I will answer one of my questions myself as I just found the answer:

On Fri, Jan 22, 2016 at 06:18:29PM +0100, Tomas Janousek wrote:
> Is there perhaps some way to force the discard manually? I thought that maybe
> creating a new sparse file/loop device/physical volume and doing pvmove might
> help, but what I got instead was a file that wasn't sparse at all, actually
> taking more space than the original one. Is this expected?
> (The only explanation I can think of is that pvmove doesn't care nor
> understand the on-disk format of device mapper thin-pools so it has to copy
> everything byte by byte. Is that it?)
> 
> Maybe creating a sufficiently large volume in the thin pool, doing a dd
> if=/dev/zero of=/path/to/volume/tmp/blanks and then deleting
> /path/to/volume/tmp/blanks would help, but could be quite slow. :-(

This hack with dd if=/dev/zero works indeed, but there's a tool called
blkdiscard in util-linux which works much better. I just call it prior to
lvremove (or lxc-destroy in my case) and the space is freed.

-- 
Tomáš Janoušek, a.k.a. Pivník, a.k.a. Liskni_si, http://work.lisk.in/
