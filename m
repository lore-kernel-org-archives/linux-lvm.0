Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o12ALnjp018384
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 05:21:49 -0500
Received: from h7.zynet2.co.uk (h7.zynet2.co.uk [212.24.80.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o12ALXbI015912
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 05:21:34 -0500
Received: from h93.zynet2.co.uk (h93.zynet2.co.uk [212.24.80.93])
	by h7.zynet2.co.uk (Postfix) with ESMTP id 208B631DF
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2010 10:21:33 +0000 (GMT)
Received: from h66.zynet2.co.uk (h66.zynet2.co.uk [212.24.80.66])
	(Authenticated sender: simon)
	by h93.zynet2.co.uk (Postfix) with ESMTPA id 10D016F6F72
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2010 10:21:33 +0000 (GMT)
From: Simon Waters <simonw@zynet.net>
Date: Tue, 2 Feb 2010 10:21:30 +0000
References: <201002011828.29896.simonw@zynet.net>
	<20100202065547.GA24147@maude.comedia.it>
In-Reply-To: <20100202065547.GA24147@maude.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201002021021.32002.simonw@zynet.net>
Subject: Re: [linux-lvm]
	=?iso-8859-1?q?Newbie=3A_Yet_another_=22Incorrect_met?=
	=?iso-8859-1?q?adata_area=09header_checksum=22?=
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Tuesday 02 February 2010 06:55:48 Luca Berra wrote:
>
> >One suggestion was to install "dmraid" and look for metadata using this.
> >It produces:
> > /dev/sdb: ddf1. ".ddf1_disks", GROUP, ok, 155989151 sectors, data@ 0
> > /dev/sda: ddf1. ".ddf1_disks", GROUP, ok, 155989151 sectors, data@ 0

> back up your data

I haven't restored it to this machine yet - so that bit was easy.

> decide wether you want to use the fakeraid or not
> configure your bios accordingly

I'd decided not already after appalling experiences of fakeraid from DELL 
before.

The BIOS has the embedded SATA controller set to "ATA Mode" not RAID, and this 
was the same throughout the installation.

Setting the BIOS to RAID revealed one RAID-1 array, which one can then delete, 
and then converting the system back to ATAMODE, and everything on disk is 
well and truely hosed (hence the backup suggestion no doubt, and several dire 
warnings from the BIOS). I looked to see if I could recover anything from 
this, as I thought it might be useful exercise in recovering systems but it 
didn't look hopeful.

Perils of state buried in an inherited machine. I note that the RAID BIOS 
reports that the state of the RAID-1 array was fine, I think I'm remembering 
why I've come to hate the fakeraid stuff. I'm also not sure about the wisdom 
of confirming pressing the "Y" key by asking the user to press the "Y" key 
again.

Anyway I've now reinstalled after the above, and "dmraid -r" now reports "No 
RAID disks".

However in the installer log I still have the same error about incorrect 
metadata area header checksum.

The is first reported looking for the old Volume Group (so the installer found 
my old LVM information, even if I couldn't with the installer in rescue 
mode). But when partman-lvm in the Debian installer starts it reports.

Volume group "h78" successfully created

/dev/cdrom: open failed: Read-only file system

Incorrect metadata area header checksum

Only thing I did outside Debian Lenny Guided install with LVM was to 
recreate "root" bigger and "home" smaller.

Excluding the /dev/cdrom device in /etc/lvm/lvm.conf doesn't help.

Is this due to old metadata on the disk, or is there something going wrong in 
the installation process.

Since /dev/sda2 contains the root volume (amongst others) I assume any attempt 
to reset this data will require me to boot from a rescue CD?

 Simon
