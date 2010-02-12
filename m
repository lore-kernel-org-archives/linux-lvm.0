Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1CFcE5T026706
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 10:38:14 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1CFc3ad007208
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 10:38:04 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1Nfxaj-0003ZV-F8
	for linux-lvm@redhat.com; Fri, 12 Feb 2010 07:38:01 -0800
Date: Fri, 12 Feb 2010 09:37:59 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <001501caabf3$85080b60$8f182220$@at> (from Harald_Heigl@gmx.at
	on Fri Feb 12 08:56:11 2010)
Message-Id: <1265989079.22562.0@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] What happens with full snapshots
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

   The summary answer to the list of questions below
is "it works well".


> 1.       What happens if the snap gets full (e.g. someone copies  
> large data
> from one lv to a snapshotted lv or something other you didn't  
> expect), some
> sites say it original and snapshot gets deactivated, some sites say  
> the snap
> lv gets invalidated. What does this mean? Is my original volume just  
> crap
> afterwards or can I work on as usual (with the difference that  
> nothing is
> written on the snap anymore), or just need to remove the snap ..

    The original LV is unaffected.  The snapshot stops being valid.
This is because, as you said:

> I know you should size your snapshot volume to a size that can hold  
> all the
> changes. As I see a snap lv only contains the "original" datachunks  
> and the
> original lv is in a normal state as if there were no snapshot.

    That is correct, the snapshot contains the old data, while
the LV holds the current data.  Overfilling the snapshot will
simply mean no more old data is saved as it's changed, so the
snapshot is therefore invalid.


> 2.       What happens if there is a problem with a snap? I've heard on
> reboot the snapshots are lost. What if there is a power shortage, so  
> the
> snap is lost, you boot and the original lv just seeks for the snap?

    LVM snapshots are NOT lost on reboot.  That information may apply
to some other type of snapshot mechanism unrelated to LVM, or some
system could potentially be built on top of LVM which holds snapshots
in RAM, but in the normal use case snapshots are written to disk
just like any other data you might write to disk.

> What if there is a power shortage, so the snap is lost, you boot
> and the original lv just seeks for the snap?

    Just like anything else written to disk, a sudden loss of power
could result in some lost data.  Snapshots are not different from
your normal "file system on a partition" in this respect.  With LVM
or without, battery backups systems (UPS) are advised for critical
systems.

    LVM can be set to maintain a log of backups of the LVM metadata
in case you had a power failure or other major "oops" in the middle
of creating a snapshot or something like that.  The tool "vgcfgrestore"
can restore the LVM configuration to any of your last X valid
configurations.  I've used that several times when I've done
something stupid like deleting an important LVM, as I'm doing a
lot of weird stuff with LVM.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 02/12/2010 08:56:11 AM, Harald Heigl wrote:
> Hello,
> 
> I'm relatively new to lvm, I'm using Fedora for almost 3 years, but  
> up to
> now I just set up lvm on install, formatted my ext3/ext4 and it just  
> works.
> 
> Now I want to go somehow deeper playing around with snapshots.
> 
> 
> 
> I know you should size your snapshot volume to a size that can hold  
> all the
> changes. As I see a snap lv only contains the "original" datachunks  
> and the
> original lv is in a normal state as if there were no snapshot.
> 
> 
> 
> My questions:
> 
> 1.       What happens if the snap gets full (e.g. someone copies  
> large data
> from one lv to a snapshotted lv or something other you didn't  
> expect), some
> sites say it original and snapshot gets deactivated, some sites say  
> the snap
> lv gets invalidated. What does this mean? Is my original volume just  
> crap
> afterwards or can I work on as usual (with the difference that  
> nothing is
> written on the snap anymore), or just need to remove the snap ..
> 
> 2.       What happens if there is a problem with a snap? I've heard on
> reboot the snapshots are lost. What if there is a power shortage, so  
> the
> snap is lost, you boot and the original lv just seeks for the snap?  
> Are
> there implications on this. Can you just mount such a original lv or  
> do you
> have to remove the (non existent) snap lv before (How can you remove a
> snapshot that doesn't exist anymore)
> 
> 
> 
> That would be nice to know before I use snaps.
> 
> Thanks in advance,
> 
> Harald (Harry) Heigl
> 
> 
> 
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
