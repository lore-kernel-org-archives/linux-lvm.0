Message-ID: <20040109112801.58250.qmail@web12301.mail.yahoo.com>
From: Cody Bailey <codyb81@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1724755722-1073647681=:57772"
Subject: [linux-lvm] Problems with ext3 on LVM
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
Date: Fri Jan  9 09:53:07 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-1724755722-1073647681=:57772
Content-Type: text/plain; charset=us-ascii

I was dinking around with my previous problem with the "Group 3125's block bitmap" problem (posted earlier this evening, and I found some interesting problems.
 
I CAN in fact mount my /dev/storage/lvol0 and access files, BUT, when I run cfdisk on my drives I get wierd errors, let me explain:
 
Promise ATA100 TX card (2 channel)
4 Drives Hooked UP
  hde, hdf, hdh, hdg
 
I have my lvol0 setup like this:
 
First I added hde1 (partition type Linux LVM) to a new PV. Went through the steps and what not. Then added hdf1 (same deal), all is well.
 
hdh has data on it that i'm not going to use in this LVM, so I skipped it and added hdg1 to the Volume. All the while using the 2.0 utils, on a 2.4 kernel. I did get the partitions setup right on lvol0, and df -h reports everything fine.
 
When I run cfdisk on hde (the first drive) it tells me there's no partition table. WTF?
 
Next i ran it on hdf, same thing.
 
THEN, i ran it on hdh, and it finds a partition with Linux LVM partition type.
 
What gives? Shouldn't all drives show up with partition types of LinuxLVM if they are in a LVM setup? Why did they change?
 
(Sorry this is kinda confusing, i'm not in my best writing state...18 hours awake and still got lots of oragnizing to do)
 
Cody



---------------------------------
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
--0-1724755722-1073647681=:57772
Content-Type: text/html; charset=us-ascii

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 ?>
<TBODY>
<TR>
<TD>
<DIV>I was dinking around with my previous problem with the "Group 3125's block bitmap" problem (posted earlier this evening, and I found some interesting problems.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I CAN in fact mount my /dev/storage/lvol0 and access files, BUT, when I run cfdisk on my drives I get wierd errors, let me explain:</DIV>
<DIV>&nbsp;</DIV>
<DIV>Promise ATA100 TX card (2 channel)</DIV>
<DIV>4 Drives Hooked UP</DIV>
<DIV>&nbsp; hde, hdf, hdh, hdg</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have my lvol0 setup like this:</DIV>
<DIV>&nbsp;</DIV>
<DIV>First I added hde1 (partition type Linux LVM) to a new PV. Went through the steps and what not. Then added hdf1 (same deal), all is well.</DIV>
<DIV>&nbsp;</DIV>
<DIV>hdh has data on it that i'm not going to use in this LVM, so I skipped it and added hdg1 to the Volume. All the while using the 2.0 utils, on a 2.4 kernel. I did get the partitions setup right on lvol0, and df -h reports everything fine.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I run cfdisk on hde (the first drive) it tells me there's no partition table. WTF?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Next i ran it on hdf, same thing.</DIV>
<DIV>&nbsp;</DIV>
<DIV>THEN, i ran it on hdh, and it finds a partition with Linux LVM partition type.</DIV>
<DIV>&nbsp;</DIV>
<DIV>What gives? Shouldn't all drives show up with partition types of LinuxLVM if they are in a LVM setup? Why did they change?</DIV>
<DIV>&nbsp;</DIV>
<DIV>(Sorry this is kinda confusing, i'm not in my best writing state...18 hours awake and still got lots of oragnizing to do)</DIV>
<DIV>&nbsp;</DIV>
<DIV>Cody</DIV></TD></TR></TBODY></TABLE></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
Yahoo! Hotjobs: <a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/hotjobs/mail_footer_email/evt=21482/*http://hotjobs.sweepstakes.yahoo.com/signingbonus">Enter the "Signing Bonus" Sweepstakes</a>
--0-1724755722-1073647681=:57772--
