Date: Mon, 26 Jul 1999 01:12:17 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <19990726002923.C6315@colombina.comedia.it>
Message-ID: <Pine.LNX.4.10.9907260107230.14960-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>
Cc: linux-lvm@msede.com

On Mon, 26 Jul 1999, Luca Berra wrote:

  i checked alan cox's linux-2.2.10-ac12 pacth wich includes
  a heavily modified raid and lvm0.6 patch.
  i added my devfs patch 
  http://www.comedia.it/bluca/lvm/devfs-patch-v99.4-2.2.10-ac12.gz
  and i was able to create and use a vg on a raid 1 device

cool! Tell me, how is md_make_request in md.c defined? The old way,
or the new way:

int md_make_request (struct buffer_head * bh, int rw)
  
this is what's been causing me problems.

  todo: adding the diffs to the latest raid and lvm patches,
  		incremental diff for those can be found at
  		http://www.comedia.it/bluca/lvm/
  	checking autodetect, especially with both raid and
  		lvm loaded as modules. raid autorun happens before
  		and after initrd, now i need it during initrd.

i noticed lvm does autodetect based on partition ID. Raid does
aswell. So how can we do autodetection for LVM on RAID? The md device
won't have a partition id, and the underlying device will have to
have a RAID partition ID for RAID to autodetect it. 

Can LVM check for some magic within each block device and use that to
decide whether a device is a PV or not?
  
  Regards,
  Luca
  
regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
I cannot conceive that anybody will require multiplications at the rate
of 40,000 or even 4,000 per hour ...
		-- F. H. Wales (1936)
