Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A298498.86AB907B@tls.msk.ru>
Date: Sun, 03 Dec 2000 02:24:08 +0300
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
References: <200012020529.WAA00876@lynx.turbolabs.com>
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

Andreas Dilger wrote:
> 
[]
> Actually, it is just the opposite for devices like hard drives:
> the block interface will read a whole block no matter what size of
> I/O you do, and it will cache the block for any smaller read/write
> actions (i.e. read whole block-modify part of block-write whole block).
> The character interface do NOT buffer the data, so the application
> is forced to do correct block-sized and aligned reads/writes themselves.
> The benefit of the character device is that it doesn't do cacheing.

Oh, thanks!  This makes sence for me now -- after almost 10 years
of experience ! :^)))

[]
> You don't have to extend the datafiles for Oracle, just add a new
> datafile to the tablespace.

Oracle will work (a bit) better if it have only one datafile for
each tablespace, unless them are on different disks.  It will
try to load-balance data between datafiles in tablespace, and this
is useless effort in one-disk (or, as in my case, one-raid-array)
layout.  Simple rule -- make *one* datafile on each disk for each
appropriate tablespace, not more and not less, and do not add second
datafile to the same disk, only grow existing one.  BTW, should LVM
also do disk-load-balancing?  I saw some todo items about this (and
remapping frequently accessing data to faster disk etc)...
Again, even for new datafile -- it should be created somewhere using
hacks described before (that does *not* work)...

I tried to setup datafile on filesystem than copying it to raw device
on top of lv.  And this does *not* work -- then oracle first opens
the tablespace, it requests read(512) -- probably to read datafile
header -- and failed exactly as then trying to create it, giving
"unable to identify datafile ...: invalid argument" error message.
Trace is very similar to one I posted before, with write() changed
to read().  Datafile created this way on plain disk partition
works prefectly, as expected...  So the problem is somewhere in
lvm+rawio combination -- only this pair together won't work.

The only way I have to try is to use stock kernel with clean lvm
patch, that I'll do at monday.

Regards,
 Michael.
