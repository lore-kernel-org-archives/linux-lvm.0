Date: Fri, 22 Jan 2016 18:18:29 +0100
From: Tomas Janousek <tomi@nomi.cz>
Message-ID: <20160122171828.GC771114@nomi.cz>
References: <55C86723.4000707@siteground.com>
	<20150810174900.GC22719@redhat.com>
	<55C9AD4F.5050900@siteground.com>
	<20150811143526.GB29369@redhat.com>
	<55D45D08.3060508@siteground.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55D45D08.3060508@siteground.com>
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

Hello all,

On Wed, Aug 19, 2015 at 01:40:08PM +0300, vaLentin chernoZemski wrote:
> I just tested my case with LVM2.2.02.128 with the latest kernel 4.1.6 and it
> still does not work.
> 
> [...]
> 
> Let me know if you need anything else that could help us debug this issue
> and fix it.

Has there been any progress here? I'm experiencing the same issue here with
kernel 4.4.0 and lvm:

lvm> version
  LVM version:     2.02.138(2) (2015-12-14)
  Library version: 1.02.114 (2015-12-14)
  Driver version:  4.34.0

Is there perhaps some way to force the discard manually? I thought that maybe
creating a new sparse file/loop device/physical volume and doing pvmove might
help, but what I got instead was a file that wasn't sparse at all, actually
taking more space than the original one. Is this expected?
(The only explanation I can think of is that pvmove doesn't care nor
understand the on-disk format of device mapper thin-pools so it has to copy
everything byte by byte. Is that it?)

Maybe creating a sufficiently large volume in the thin pool, doing a dd
if=/dev/zero of=/path/to/volume/tmp/blanks and then deleting
/path/to/volume/tmp/blanks would help, but could be quite slow. :-(

Regards,
-- 
Tomáš Janoušek, a.k.a. Pivník, a.k.a. Liskni_si, http://work.lisk.in/
