Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1E4aBi21971
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 23:36:11 -0500
Received: from brown.fusion-hosting.net ([63.106.141.109])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1E4a8b13484
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 23:36:11 -0500
Received: from fusion-hosting.net (localhost.localdomain [127.0.0.1])
	by brown.fusion-hosting.net (8.12.8/8.11.0) with SMTP id i1E4ZaI9006684
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 23:35:36 -0500
From: Chris Wells <chris@fusion-hosting.net>
Message-ID: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
Subject: [Fwd: [linux-lvm] Problems importing volume group]
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 23:35:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

More info...

After exporting and before replacing the system drive and re-installing,
Redhat.. my pvscan output was the following:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [233.72 GB / 0
free]
pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [167.62 GB / 32
MB fr
ee]
pvscan -- total: 2 [401.44 GB] / in use: 2 [401.44 GB] / in no VG: 0 [0]


Now of course I get:

pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [0 / 0 free]
pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [0 / 0 free]
pvscan -- total: 2 [37.46 MB] / in use: 2 [37.46 MB] / in no VG: 0 [0]

This is VERY frightening :)  Someone please tell me there is a way to get
to my data.. Any help appreciated..



-------- Original Message --------
Subject: [linux-lvm] Problems importing volume group
From: Chris Wells <chris@fusion-hosting.net>
Date: Fri, February 13, 2004 12:49 pm
To: <linux-lvm@redhat.com>

Hello all,

I'm still a newbie to LVM but I've followed a FAQ in exporting my VG (I
had to replace a failing system drive - not in the VG).  When I replaced
the drive and tried to import the volume group, I get the following
errors:

vgimport kbvg /dev/hde /dev/hdf
vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
volume consistency of "/dev/hde"
vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
volume consistency of "/dev/hdf"
vgimport -- ERROR: no valid physical volumes found to import volume
group "kbvg"

When I do a pvscan, I get:

pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [0 / 0 free]
pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [0 / 0 free]
pvscan -- total: 2 [37.46 MB] / in use: 2 [37.46 MB] / in no VG: 0 [0]


I get these errors even when replacing the old drive and trying to
import back.  Any ideas on what I can do next or what the problem could
be?  Or.. at least, does anyone know of any tools which I can use to
retrieve data from these drives?

Any help is greatly appreciated!

-- 
Thanks,
   Chris Wells
   Fusion Hosting & Design
   Lexington, KY
   chris@fusion-hosting.net
   http://www.fusion-hosting.net
   Phone: (859) 492-6439


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Thanks,
   Chris Wells
   Fusion Hosting & Design
   Lexington, KY
   chris@fusion-hosting.net
   http://www.fusion-hosting.net
   Phone: (859) 492-6439
