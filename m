Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA99KbV14859
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 04:20:37 -0500
Received: from dgate2.fujitsu-siemens.com (dgate2.fujitsu-siemens.com
	[217.115.66.36])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA99KScK007529
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 04:20:29 -0500
Received: from pdbzex1e.pdb.fsc.net (pdbzex1e.pdb.fsc.net [172.25.96.71])
	by plim.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	jA99KPlF023668
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 10:20:27 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 9 Nov 2005 10:20:21 +0100
Message-ID: <ADC8F7AA316AF74EBEC87590CCDA61620671EC2F@PDBEX02E.pdb.fsc.net>
From: "Laurenz, Dirk" <Dirk.Laurenz@fujitsu-siemens.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] FW: boot sequence of lvm and dm_multipath
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com
Cc: "Ehlerding, Diedrich" <Diedrich.Ehlerding@fujitsu-siemens.com>



Mit freundlichem Gruss,



Dirk Laurenz
Systems Engineer	

Fujitsu Siemens Computers
S CE DE SE PS N/O
Sales Central Europe Deutschland 
Professional Service Nord/Ost

Hildesheimer Strasse 25
30880 Laatzen
Germany

Telephone:	+49 (511) 84 89 - 18 08
Telefax:	+49 (511) 84 89 - 25 18 08
Mobile:	+49 (170) 22 10 781
Email:	mailto:dirk.laurenz@fujitsu-siemens.com
Internet:	http://www.fujitsu-siemens.com
            http://www.fujitsu-siemens.de/services/index.html
*******************************************************************************************************************
  

-|  -----Original Message-----
-|  From: Diedrich Ehlerding 
-|  [mailto:diedrich.ehlerding@fujitsu-siemens.com] 
-|  Sent: Wednesday, November 09, 2005 9:05 AM
-|  To: linux-lvm@redhat.com
-|  Subject: boot sequence of lvm and dm_multipath
-|  
-|  Hello. 
-|  
-|  I am trying to run dm_multipath (mpio) against an EMC 
-|  Clariion array on 
-|  a SuSE SLES) system. According to 
-|  http://portal.suse.com/sdb/en/2005/04/sles_multipathing.html 
-|  this should work, and it does to a certain degree, but I 
-|  have problem 
-|  with lvm integration on a system which has an lvm boot disk 
-|  configuration.
-|  
-|  This  is the environment:
-|  
-|  hges3302:~ # rpm -q multipath-tools
-|  multipath-tools-0.4.4-0.22
-|  hges3302:~ # uname -a
-|  Linux hges3302 2.6.5-7.201-bigsmp #1 SMP Thu Aug 25 
-|  06:20:45 UTC 2005 
-|  i686 i686
-|  i386 GNU/Linux
-|  hges3302:~ # cat /etc/SuSE-release
-|  SUSE LINUX Enterprise Server 9 (i586)
-|  PATCHLEVEL = 2
-|  VERSION = 9
-|  
-|  The server is a Fujitsu Siemens Primergy with an internal raid 
-|  controller and two Emulex lp9802 HBAs; driver is lpfc 8.0.16.  
-|  
-|  Everything works fine if I start SuSE's /etc/init.d/boot.multipath 
-|  (which simply loads dm-multiptah) and 
-|  /etc/init.d/multipathd manually, 
-|  having booted the server without multipath. Once starting 
-|  boot.multipath and multipathd manually, I can pvscan the Clariion, 
-|  vgchange -ay the volumegroups etc.; and the path failover 
-|  works fine.
-|  
-|  However, I would like to detect the volume groups at boot time; not 
-|  manually. But if I put boot.multpath and multipathd (wich SuSE 
-|  delivers) into the boot sequence (insserv boot.multipath / 
-|  multipathd), 
-|  I run into problems with lvm. My server has its root file 
-|  system on an 
-|  internal disk, and this disk is under lvm control too. I 
-|  tried booting 
-|  lvm after boot.multipath as well as loading first 
-|  multipath, then lvm. 
-|  I dont get any boot time error messages.
-|  
-|  Having booted the server in this way, multipath detects the disks 
-|  properly, i.e it cretes /dev/disk/by-name/<UID> etc - but 
-|  lvm is not 
-|  willing to detect these disks; i.e. pvscan shows only the internal 
-|  disks sda and sdb.
-|  
-|  Here is the relevant part of my lvm.conf in both cases:
-|  ######  accept  mpioDevices and the boot disks, but nothing else
-|      filter=[ "a|/dev/disk/by-name/.*|","a|/dev/sda.*|","a|/dev/sdb|"
-|  ,"r|.*|" ]
-|      types = [ "device-mapper",253 ]
-|  
-|  If I create a rc-script by myself (containing nothing but 
-|  "/etc/init.d 
-|  boot.multipath start; /etc/init.d/multipathd start") and 
-|  run it later 
-|  at the end of rc5.d, then again everything is fine and 
-|  pvscan detects 
-|  the disks.
-|  
-|  Is there anybody who can give me some recommendation conderning the 
-|  sequence to start dm_multipath and lvm at bot time? Should I try to 
-|  "sleep 10" or something the like after booting multipath and before 
-|  booting lvm?
-|  
-|  TIA, 
-|  -- 
-|  Diedrich Ehlerding, Fujitsu Siemens Computers, S DE SE PS N/O
-|  Hildesheimer Str 25, D-30880 Laatzen
-|  diedrich.ehlerding@fujitsu-siemens.com
-|  Fon +49 511 8489-1806, Fax -251806, Mobil +49 173 2464758
-|  -- 
-|  Diedrich Ehlerding, Fujitsu Siemens Computers, S DE SE PS N/O
-|  Hildesheimer Str 25, D-30880 Laatzen
-|  diedrich.ehlerding@fujitsu-siemens.com
-|  Fon +49 511 8489-1806, Fax -251806, Mobil +49 173 2464758
-|  
-|  
