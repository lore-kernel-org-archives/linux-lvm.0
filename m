Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2E7r8Y17696
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2005 02:53:08 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.207])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2E7r2F3023349
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2005 02:53:02 -0500
Received: by wproxy.gmail.com with SMTP id 71so2552936wra
	for <linux-lvm@redhat.com>; Sun, 13 Mar 2005 23:52:57 -0800 (PST)
Message-ID: <a3558a9805031323525124c37c@mail.gmail.com>
Date: Mon, 14 Mar 2005 09:52:56 +0200
From: go0ogl3 <go0ogl3@gmail.com>
Subject: Re: [linux-lvm] LVM Woes (hope this isn't a repeat. sorry)
In-Reply-To: <200503131732.40512.andy_b@softhome.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <200503131732.40512.andy_b@softhome.net>
Reply-To: go0ogl3 <go0ogl3@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: andy_b@softhome.net, LVM general discussion and development <linux-lvm@redhat.com>

Hello!

  I'm new at lvm but maybe Windows just overwrited the first 512 bytes
of that disk. Try dd_rescue or search the list arhive you'll find some
similar situation (oliver with a hex editor).

I hope you'll make it!

On Sun, 13 Mar 2005 19:48:47 -0500, Andrew <andy_b@softhome.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> My problem is that I accidentally left my LVM disks in my system when I
> installed windows XP On a seperate drive.  I did not install windows to
> either of the LVM's so that should not be an issue.
> 
> However when I replaced my linux drive, and booted into linux, I got the
> following error when my system tried to start up LVM
> (for vgchange -ay)
> mog root # vgchange -ay
> 2 logical volume(s) in volume group "vg0" now active
> Logical volume (lv0) contains an incomplete mapping table
> Unable to find volume group "vg_samsung"
> 
> vg0 is my other lvm which thankfully is still there.
> 
> now, whenever I do any of the 'scan' tools (vgscan, pvscan, lvscan) I get the
> following errors:
> vgscan:
> ...
> Logical volume (lv0) contains an incomplete mapping table
> Unable to find volume group "vg_samsung"
> 
> pvscan:
> Logical volume (lv0) contains an incomplete mapping table
> ...
> 
> lvscan:
> ...
> Logical volume (lv0) contains an incomplete mapping table
> Unable to find volume group "vg_samsung"
> 
> however, if I do pvdisplay on my 2 drives I get some info
> mog root # pvdisplay /dev/hde     <--my 160gig drive, I think the second drive
> in the LVM
> 
> - --- NEW Physical volume ---
> PV Name         /dev/hde
> VG Name         /vg_samsung
> PV Size         19.84 MB
> Allocatable     NO
> PE Size (K..)   0
> Total PE                0
> Free PE         0
> Allocated PE    0
> PV UUID         fXhdbW-S1KK-lSNs-kGSQ-dsb6-9Kkn-Q7xeTk
> 
> That looks bad to me, but the first drive in the volume looks ok:
> 
> mog root # pvdisplay /dev/hdg <--my 80gig drive
> - --- Physical volume ---
> PV Name         /dev/hdg
> VG Name         /vg_samsung
> PV Size         74.56 GB / not usable 31.57 MB
> Allocatable     yes (but full)
> PE Size (K..)   16384
> Total PE                4770
> Free PE         0
> Allocated PE    4770
> PV UUID         aE0Tfs-UX8r-oTma-Eo35-mxSg-ZT5w-ZHPPTW
> 
> so it looks like windows only blasted the second of the two drives  (which
> came first in the bios) (or the
> first one it found?)
> 
> I am desperate to get this data back (and unfortunately my /etc/lvm/backup or
> archive are empty :(
> 
> Thankyou very much in advance!
> - --
> 
> - --Andrew Bovill
> PGP fingerprint:  A00A 1E75 3AB0 610E 2300  6855 1890 C61E E590 F777
> Link to PGP key:  http://linuxboy.dyndns.org/~andy/public_key.gpg
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
> 
> iD8DBQFCNN9xGJDGHuWQ93cRAtPnAJ9FbTYTo4qQHq4KAtCgchboewhtRQCfce/l
> Bk3ODWAXSpgnJz0i55RJK/Y=
> =bymV
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
