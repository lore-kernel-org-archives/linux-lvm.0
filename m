Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105231649.f4NGnDCR028588@webber.adilger.int>
Subject: Re: [linux-lvm] Converting my Root file system to LVM
In-Reply-To: <990575643.1151.0.camel@localhost> "from Rupert Heesom at May 22,
 2001 07:53:57 pm"
Date: Wed, 23 May 2001 10:49:13 -0600 (MDT)
MIME-Version: 1.0
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

Rupert Heesom writes:
> I want to pvmove the file contents of my 2nd disk (/dev/sdb) to my 1st
> disk (/dev/sda).  My 1st disk is nice & quiet!  Now the lvm-howto
> specifies my next step (adding the "old partition" into the Lvol) as --
> 
> pvcreate /dev/sda   <using my device names>
> vgextend vg /dev/sda
> 
> ---  Seeing as I want to do a pvmove of data from /dev/sdb to /dev/sda,
> when would I do the pvmove?   As I understand LVM, I need to have the PV
> created and integrated into the VG before I can use pvmove - is this
> correct?   Then, once pvmove is used, I can then extend the LV & file
> system to cover both PVs using e2fsadm, right?

Yes, you can do that...  However, once you have LVM you should start to
think differently about "partitions" and such.  You can create a lot of
small partitions for different needs.

Why is this useful?  Because it makes moving stuff around, updating the
OS, etc easier.  You can have multiple OS installs, but keep your /home
and /mp3 data available to both.  You can put /mp3 on a new disk and it
will spin down when you are not listening to them.  You can put /var/log
and /var/spool/mail on different LVs so that lots of logs or lots of
email don't make your system unusable.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
