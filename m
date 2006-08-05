Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k75GIW2R003811
	for <linux-lvm@redhat.com>; Sat, 5 Aug 2006 12:18:32 -0400
Received: from web57104.mail.re3.yahoo.com (web57104.mail.re3.yahoo.com
	[216.252.111.117])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k75GIQjZ000363
	for <linux-lvm@redhat.com>; Sat, 5 Aug 2006 12:18:26 -0400
Message-ID: <20060805161820.15742.qmail@web57104.mail.re3.yahoo.com>
Date: Sat, 5 Aug 2006 09:18:20 -0700 (PDT)
From: Joe Harvell <joeharvell@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1231021405-1154794700=:12882"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] HELP: system unbootable after failed pvmove
	(unrecognized segment type mirror)
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
To: linux-lvm@redhat.com

--0-1231021405-1154794700=:12882
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Please help.
   
  Yesterday I executed 'pvmove /dev/sda5 /dev/sda3' to move data within volume group 'london.'  It failed as paraphrased below:
   
  $ pvmove /dev/sda5 /dev/sda3
  Unrecognised segment type mirror
  Unable to active mirror logical volume
  Execute pvmove --abort
  Unrecognised segment type mirror
  Unrecognised segement type mirror
   
  The pvmove command hung and never completed.  I executed the 'lvs' command from another window and it hung.  I executed the 'pvmove --abort' command from another window and it hung, too.
   
  The system was up and running and working fine, as long as I didn't enter an LVM command.
   
  pvmove has worked for me before on this system.  I think what changed is that I recompiled it without mirrors support because I was tired of seeing the "Unrecognized segment type mirror" all the time.  I think this broke pvmove, because when I read the documentation about what it does, it says it creates a mirror LV or something like that.
   
  When I rebooted, the failure happend in my initrd.  My / and /usr are in LVs in VG london.  When I did the lvm vgscan, it complains with the following two lines several times:
   
  Unrecognised segment type mirror
  Couldn't read all logical volumes for volume group london
   
  At the end it says 'Volume group "london" not found'
   
  By the way, it did find one of my other volume groups.
   
  The initrd LVM version info is as follows:
   
  LVM version: 2.02.05 (2006-04-21)
  Library version: 1.02.07 (2006-05-11)
  Drvier version: 4.5.0
   
  The kernel is 2.6.16.
   
  In the system the initrd is trying to boot, the LVM version info should be the same.  It is definitely either the same or newer.  As I stated earlier, the lvm tools in the system were compiled without mirror support.  I think the same is true of the version in the initrd, but it might not be the case.
   
  Okay, so what do I do???

 __________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
--0-1231021405-1154794700=:12882
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div>Please help.</div>  <div>&nbsp;</div>  <div>Yesterday I executed 'pvmove /dev/sda5 /dev/sda3' to move data within volume group 'london.'&nbsp; It failed as paraphrased below:</div>  <div>&nbsp;</div>  <div>$ pvmove /dev/sda5 /dev/sda3</div>  <div>Unrecognised segment type mirror</div>  <div>Unable to active mirror logical volume</div>  <div>Execute pvmove --abort</div>  <div>Unrecognised segment type mirror</div>  <div>Unrecognised segement type mirror</div>  <div>&nbsp;</div>  <div>The pvmove command hung and never completed.&nbsp; I executed the 'lvs' command from another window and it hung.&nbsp; I executed the 'pvmove --abort' command from another window and it hung, too.</div>  <div>&nbsp;</div>  <div>The system was up and running and working fine, as long as I didn't enter an LVM command.</div>  <div>&nbsp;</div>  <div>pvmove has worked for me before on this system.&nbsp; I think what changed is that I recompiled it without mirrors support because I was tired of
 seeing the "Unrecognized segment type mirror" all the time.&nbsp; I think this broke pvmove, because when I read the documentation about what it does, it says it creates a mirror LV or something like that.</div>  <div>&nbsp;</div>  <div>When I rebooted, the failure happend in my initrd.&nbsp; My&nbsp;/ and /usr&nbsp;are in&nbsp;LVs in VG london.&nbsp; When&nbsp;I did the lvm vgscan, it complains with the following two lines several times:</div>  <div>&nbsp;</div>  <div>Unrecognised segment type mirror</div>  <div>Couldn't read all logical volumes for volume group london</div>  <div>&nbsp;</div>  <div>At the end it says 'Volume group "london" not found'</div>  <div>&nbsp;</div>  <div>By the way, it did find one of my other volume groups.</div>  <div>&nbsp;</div>  <div>The initrd LVM version info is as follows:</div>  <div>&nbsp;</div>  <div>LVM version: 2.02.05 (2006-04-21)</div>  <div>Library version: 1.02.07 (2006-05-11)</div>  <div>Drvier version: 4.5.0</div> 
 <div>&nbsp;</div>  <div>The kernel is 2.6.16.</div>  <div>&nbsp;</div>  <div>In the system the initrd is trying to boot, the LVM version info should be the same.&nbsp; It is definitely either the same or newer.&nbsp;&nbsp;As I stated earlier, the&nbsp;lvm tools in the system were compiled without mirror support.&nbsp; I think the same is true of the version in the initrd, but it might not be the case.</div>  <div>&nbsp;</div>  <div>Okay, so what do I do???</div><p>&#32;__________________________________________________<br>Do You Yahoo!?<br>Tired of spam?  Yahoo! Mail has the best spam protection around <br>http://mail.yahoo.com 
--0-1231021405-1154794700=:12882--
