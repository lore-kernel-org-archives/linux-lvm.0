Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4VKjT6s026461
	for <linux-lvm@redhat.com>; Mon, 31 May 2010 16:45:29 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4VKjKKP031683
	for <linux-lvm@redhat.com>; Mon, 31 May 2010 16:45:20 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OJBrG-0005xa-D9
	for linux-lvm@redhat.com; Mon, 31 May 2010 13:45:17 -0700
Date: Mon, 31 May 2010 15:45:12 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>
	(from romeo.theriault@maine.edu on Mon May 31 14:21:36 2010)
Message-Id: <1275338712.1423.2@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
 partition directly?
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

   In general, no, though in your specific case it may be
that all of the extents are stored contigously and it might
work. You would probably need to use losetup -o and specify
the offset.  This would be more of a last ditch data recovery
effort than something you'd design into a production system,
though.

   You might have better results altering one of these issues
that is causing you to consider such action:

>  I can't import the pv/vg because they have the same name/uuid
> as the existing VG (it's really the same system) and I can't change
> them with something like vgimportclone because the backed up vm image
> files are read-only.

   In other words, you would back up to one of the following questions:
How can I change the names and UUIDs of the backups?
How can I import an LV which has a conflicting UUID?
How can I use vgimport with a read only source?

   Specifically, you might be able to ignore the meta data on
the backup volumes with pvmetadatacopies  = 0 and use "dirs"
in lvm.conf, so you can change the working meta data even
though they are read only.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 05/31/2010 02:21:36 PM, Romeo Theriault wrote:
> I apologize if this has been asked before but I was unable to find any
> references to it in the mailing list archives and googling around
> isn't helping much.
> 
> Is there a way to directly mount, bypassing LVM, a ext3 partition that
> resides in a LVM LV and VG? It resides on one PV.
> 
> The problem is that I have read-only copies of VM's that are backed up
> via a SAN based snapshot/backup tool. I'm trying to create a method to
> allow the VM admins to restore their files from the snapshot backed up
> VM's. I'm at the point where I can access the partitions and can mount
> the ext3 partitions fine but I'm having trouble with the LVM volumes
> because I can't import the pv/vg because they have the same name/uuid
> as the existing VG (it's really the same system) and I can't change
> them with something like vgimportclone because the backed up vm image
> files are read-only.
> 
> Thanks for any help.
> 
> --
> Romeo Theriault
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
