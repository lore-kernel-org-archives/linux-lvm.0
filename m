Message-ID: <20031214113328.74647.qmail@web13505.mail.yahoo.com>
From: Stuart Felenstein <stuart4m@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1084229190-1071401608=:74612"
Subject: [linux-lvm] LVM and devfs
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
Date: Mon Dec 15 07:56:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-1084229190-1071401608=:74612
Content-Type: text/plain; charset=us-ascii

I didn't see a search option in the archives and I apologize if this is more appropriate to the devfs list.  I installed RedHat9 , and partitioned with DiskDruid using LVM.  The only partition that is not LVM is /boot.
However I have now compiled kernel 2.4.23 with LVM and devfs and running into a problem with kernel panics.  I'm not sure if having LVM is causing the issue.  Even though I've tried many different append roots, looking at the working kernel in lilo.conf I see root = /dev/Volume00/LogVol01.  So I'm' wondering how I translate that to /dev/ide/host0..... .
 
Here is my current /etc/fstab: 
/dev/Volume00/LogVol01           /                       ext3
LABEL =/boot                          /boot                 ext3
/dev/Volume00/LogVol02           /cache              ext3
/dev/Volume00/LogVol03           /myth                ext3
none                                       /proc                  proc
none                                       /dev/shm            tmpfs
/dev/Volume00/LogVol00          /swap                 swap
/dev/cdrom

Greatly appreciate some help, pointers and / or links.
Thank you,
Stuart

--0-1084229190-1071401608=:74612
Content-Type: text/html; charset=us-ascii

<DIV>I didn't see a search option in the archives and I apologize if this is more appropriate to the devfs list.&nbsp; I installed RedHat9 , and partitioned with DiskDruid using LVM.&nbsp; The only partition that is not LVM is /boot.</DIV>
<DIV>However I have now compiled kernel 2.4.23 with LVM and devfs and running into a problem with kernel panics.&nbsp; I'm not sure if having LVM is causing the issue.&nbsp; Even though I've tried many different append roots, looking at the working kernel in lilo.conf I see root = /dev/Volume00/LogVol01.&nbsp; So I'm' wondering how I translate that to /dev/ide/host0..... .</DIV>
<DIV>&nbsp;</DIV>
<DIV>Here is my current /etc/fstab: </DIV>
<DIV>/dev/Volume00/LogVol01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3</DIV>
<DIV>LABEL =/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ext3</DIV>
<DIV>/dev/Volume00/LogVol02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /cache&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ext3</DIV>
<DIV>/dev/Volume00/LogVol03&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /myth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext3</DIV>
<DIV>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proc</DIV>
<DIV>none&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpfs</DIV>
<DIV>/dev/Volume00/LogVol00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swap</DIV>
<DIV>/dev/cdrom<BR></DIV>
<DIV>Greatly appreciate some help, pointers and / or links.</DIV>
<DIV>Thank you,</DIV>
<DIV>Stuart</DIV>
--0-1084229190-1071401608=:74612--
