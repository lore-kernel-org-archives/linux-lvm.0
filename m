Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A29A31E.BC6A6243@tls.msk.ru>
Date: Sun, 03 Dec 2000 04:34:22 +0300
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
References: <200012020529.WAA00876@lynx.turbolabs.com> <3A298498.86AB907B@tls.msk.ru>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Michael Ju. Tokarev" wrote:
> 
> The only way I have to try is to use stock kernel with clean lvm
> patch, that I'll do at monday.

Ok, installed now:
  stock 2.2.17 kernel with
    rawio patch (from lvm source)
    lvm-0.9-2.2.17-stock.patch
  lvmtools 0.9

 # raw /dev/raw/raw100 /dev/vg0/lv0
 /dev/raw/raw100:        bound to major 58, minor 0
 # dd if=/dev/zero of=/dev/raw/raw100 bs=512
 dd: /dev/raw/raw100: Invalid argument
 1+0 records in
 0+0 records out
 # _

 # raw /dev/raw/raw100 /dev/sda4
 dev/raw/raw100:        bound to major 8, minor 4
 # dd if=/dev/zero of=/dev/raw/raw100 bs=512
 dd: /dev/raw/raw100: No such device or address
 131073+0 records in
 131072+0 records out
 # _

So, as I can see, "stock lvm" also won't work with rawio
with 512-byte block i/o, while disk partition with rawio
is pretty happy with that block size.

Question: *why* lvm+rawio won't work with 512-bytes i/o?
And this is not an oracle question, oracle here is just
an example application that really uses 512-byte i/o.

I see in linux/include/linux/lvm.h :

 [...]
 #ifdef BLOCK_SIZE
 #undef BLOCK_SIZE
 #endif

 #ifdef CONFIG_ARCH_S390 
 #define BLOCK_SIZE     4096
 #else
 #define BLOCK_SIZE     1024  <<<<<<<<<========
 #endif

 #ifndef        SECTOR_SIZE
 #define SECTOR_SIZE    512
 #endif
 [...]

I'm not shure if it is legal to change this value...

Next 2 questions: can I change this value to 512?
And will this cure the problem?  For now I can't
experiment as I have no physical access to that
machine (only over dialup modem), and I wan't to
risk rebooting it again with unknown kernel...

BTW, why it ever defined?  I see that this value used
to initialize lvm_blocksizes[] static array, and that
array isn't changed anywhere, only read.  And only
in lvm_snap.c, if #defined DEBUG_SNAPSHOT (it will not
compile if this #defined, since that array referenced
here is static in other source) it is checked if underlying
device has different block size, and that value 
instead in further calculations.
Why lvm_blocksize[] is used@all while it is constant
array ?! ;)

Little *strong* suggestion.  Please rename BLOCK_SIZE
and SECTOR_SIZE to LVM_BLOCK_SIZE and LVM_SECTOR_SIZE
in lvm.h -- currently used names are very common to
be a source of namespace collisions.

Regards,
 Michael.
