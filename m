Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 25 May 2001 15:07:04 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] 2.4.4ac17 + LVM-0.9.1beta7: Oops on unmount initrd
Message-ID: <20010525150704.J826@tykepenguin.com>
References: <20010525170108.B11709@niksula.cs.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010525170108.B11709@niksula.cs.hut.fi>; from vherva@niksula.hut.fi on Fri, May 25, 2001 at 05:01:08PM +0300
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 25, 2001 at 05:01:08PM +0300, Ville Herva wrote:
> Whenever I try to boot with root on LVM (using initrd), I get an oops. The
> oops happens right after (trying to) unmount old (initrd) root. It also
> happens when I run it with root=/dev/sdb (which is a plain ext2fs with no
> LVM involved, other than the lvmcreate_initrd-generated initrd).
> 
> I patched 2.4.4ac17 with LVM-0.9.1beta7; (the generated patch applied clean
> other than that I had to add int get_hardblocksize(kdev_t) {} to fs/buffer.c
> (seems to have been removed somewhere between 2.4.1 and 2.4.4). I also tried
> 2.4.4ac17 vanilla and 2.4.4ac15 vanilla with the same results.

Adding the function like that is not a good idea - it will return rubbish as the
hard block size. Change the name from get_hardblocksize() to 
get_hardsect_size() in lvm.c and recompile it.


patrick
