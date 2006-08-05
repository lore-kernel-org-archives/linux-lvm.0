Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k75HjC2W013748
	for <linux-lvm@redhat.com>; Sat, 5 Aug 2006 13:45:12 -0400
Received: from web57113.mail.re3.yahoo.com (web57113.mail.re3.yahoo.com
	[216.252.111.126])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k75Hj48K021214
	for <linux-lvm@redhat.com>; Sat, 5 Aug 2006 13:45:04 -0400
Message-ID: <20060805174459.35327.qmail@web57113.mail.re3.yahoo.com>
Date: Sat, 5 Aug 2006 10:44:59 -0700 (PDT)
From: Joe Harvell <joeharvell@yahoo.com>
Subject: Re: [linux-lvm] HELP: system unbootable after failed pvmove
	(unrecognized segment type mirror)
In-Reply-To: <20060805161820.15742.qmail@web57104.mail.re3.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-166976754-1154799899=:99352"
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-166976754-1154799899=:99352
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Fixed.

I booted the Gentoo 2006.0 Minimial Install CD.  I ran 'lvm vgscan' and it recognized 'london'.  When I ran 'lvm lvs', it showed the pvmove LV.  I entered 'pvmove --abort'.  When I entered 'lvm lvs' again, the pvmove LV was gone.

It seems wrong that the LVM tools would support attempting to do a pvmove when snapshot support is compiled out.

Joe Harvell <joeharvell@yahoo.com> wrote: Please help.
   
  Yesterday I executed 'pvmove /dev/sda5 /dev/sda3' to move data within volume group 'london.'  It failed as paraphrased below:
   
  $ pvmove /dev/sda5 /dev/sda3
  Unrecognised segment type mirror
  Unable to active mirror logical volume
  Execute pvmove --abort
  Unrecognised segment type mirror
  Unrecognised segement type mirror
   
  The pvmove command hung and never completed.  I executed the 'lvs' command from another window and it hung.  I executed the 'pvmove --abort' command from another window and it hung, too.
   
  The system was up and running and working fine, as long as I didn't enter an LVM command.
   
  pvmove has worked for me before on this system.  I think what changed is that I recompiled it without mirrors support because I was tired of  seeing the "Unrecognized segment type mirror" all the time.  I think this broke pvmove, because when I read the documentation about what it does, it says it creates a mirror LV or something like that.
   
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
http://mail.yahoo.com _______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 		
---------------------------------
Yahoo! Music Unlimited - Access over 1 million songs.Try it free. 
--0-166976754-1154799899=:99352
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Fixed.<br><br>I booted the Gentoo 2006.0 Minimial Install CD.&nbsp; I ran 'lvm vgscan' and it recognized 'london'.&nbsp; When I ran 'lvm lvs', it showed the pvmove LV.&nbsp; I entered 'pvmove --abort'.&nbsp; When I entered 'lvm lvs' again, the pvmove LV was gone.<br><br>It seems wrong that the LVM tools would support attempting to do a pvmove when snapshot support is compiled out.<br><br><b><i>Joe Harvell &lt;joeharvell@yahoo.com&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"> <div>Please help.</div>  <div>&nbsp;</div>  <div>Yesterday I executed 'pvmove /dev/sda5 /dev/sda3' to move data within volume group 'london.'&nbsp; It failed as paraphrased below:</div>  <div>&nbsp;</div>  <div>$ pvmove /dev/sda5 /dev/sda3</div>  <div>Unrecognised segment type mirror</div>  <div>Unable to active mirror logical volume</div>  <div>Execute pvmove --abort</div>  <div>Unrecognised segment type mirror</div> 
 <div>Unrecognised segement type mirror</div>  <div>&nbsp;</div>  <div>The pvmove command hung and never completed.&nbsp; I executed the 'lvs' command from another window and it hung.&nbsp; I executed the 'pvmove --abort' command from another window and it hung, too.</div>  <div>&nbsp;</div>  <div>The system was up and running and working fine, as long as I didn't enter an LVM command.</div>  <div>&nbsp;</div>  <div>pvmove has worked for me before on this system.&nbsp; I think what changed is that I recompiled it without mirrors support because I was tired of  seeing the "Unrecognized segment type mirror" all the time.&nbsp; I think this broke pvmove, because when I read the documentation about what it does, it says it creates a mirror LV or something like that.</div>  <div>&nbsp;</div>  <div>When I rebooted, the failure happend in my initrd.&nbsp; My&nbsp;/ and /usr&nbsp;are in&nbsp;LVs in VG london.&nbsp; When&nbsp;I did the lvm vgscan, it complains with the following two
 lines several times:</div>  <div>&nbsp;</div>  <div>Unrecognised segment type mirror</div>  <div>Couldn't read all logical volumes for volume group london</div>  <div>&nbsp;</div>  <div>At the end it says 'Volume group "london" not found'</div>  <div>&nbsp;</div>  <div>By the way, it did find one of my other volume groups.</div>  <div>&nbsp;</div>  <div>The initrd LVM version info is as follows:</div>  <div>&nbsp;</div>  <div>LVM version: 2.02.05 (2006-04-21)</div>  <div>Library version: 1.02.07 (2006-05-11)</div>  <div>Drvier version: 4.5.0</div>   <div>&nbsp;</div>  <div>The kernel is 2.6.16.</div>  <div>&nbsp;</div>  <div>In the system the initrd is trying to boot, the LVM version info should be the same.&nbsp; It is definitely either the same or newer.&nbsp;&nbsp;As I stated earlier, the&nbsp;lvm tools in the system were compiled without mirror support.&nbsp; I think the same is true of the version in the initrd, but it might not be the case.</div>  <div>&nbsp;</div> 
 <div>Okay, so what do I do???</div><div> __________________________________________________<br>Do You Yahoo!?<br>Tired of spam?  Yahoo! Mail has the best spam protection around <br>http://mail.yahoo.com _______________________________________________<br>linux-lvm mailing list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</div></blockquote><br><p>&#32;
		<hr size=1>Yahoo! Music Unlimited - Access over 1 million songs.
<a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=36035/*http://music.yahoo.com/unlimited/ 
">Try it free.</a> 
--0-166976754-1154799899=:99352--
