Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 934F1B49C3
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 10:05:49 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26]) by mx1.redhat.com (Postfix) with ESMTP id 6923B7E446
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 10:05:47 +0000 (UTC)
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary="Boundary_(ID_iFYCR2DS313cVZRO9ibfwg)"
Received: from osl1cloudm2.nextgentel.net ([80.202.10.59])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OY200DF1EN0GW60@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Thu, 19 Oct 2017 12:05:46 +0200 (CEST)
From: Oleg Cherkasov <olegc@broadpark.no>
Message-id: <8c2a1516-09e1-00e4-8c12-293a086cbbe2@broadpark.no>
Date: Thu, 19 Oct 2017 12:05:45 +0200
Content-language: en-US
Subject: [linux-lvm] cache on SSD makes system unresponsive
Reply-To: o1e9@member.fsf.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

--Boundary_(ID_iFYCR2DS313cVZRO9ibfwg)
Content-type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

Recently I have decided to try out LVM cache feature on one of our Dell 
NX3100 servers running CentOS 7.4.1708 with 110Tb disk array (hardware 
RAID5 with H710 and H830 Dell adapters).  Two SSD disks each 256Gb are 
in hardware RAID1 using H710 adapter with primary and extended 
partitions so I decided to make ~240Gb LVM cache to see if system I/O 
may be improved.  The server is running Bareos storage daemon and beside 
sshd and Dell OpenManage monitoring does not have any other services.  
Unfortunately testing went not as I expected nonetheless at the end 
system is up and running with no data corrupted.

Initially I have tried the default writethrough mode and after running 
dd reading test with 250Gb file got system unresponsive for roughly 
15min with cache allocation around 50%. Writing to disks it seems speed 
up the system however marginally, so around 10% on my tests and I did 
manage to pull more than 32Tb via backup from different hosts and once 
system became unresponsive to ssh and icmp requests however for a very 
short time.

I though it may be something with cache mode so switched to writeback 
via lvconvert and run dd reading test again with 250Gb file however that 
time everything went completely unexpected.  System started to slow 
responding for simple user interactions like list files and run top. And 
then became completely unresponsive for about half an hours. Switching 
to main console via iLO I saw a lot of OOM messages and kernel tried to 
survive therefore randomly killed almost all processes.  Eventually I 
did manage to reboot and immediately uncached the array.

My question is about very strange behavior of LVM cache.  Well, I may 
expect no performance boost or even I/O degradation however I do not 
expect run out of memory and than OOM kicks in.  That server has only 
12Gb RAM however it does run only sshd, bareos SD daemon and OpenManange 
java based monitoring system so no RAM problems were notices for last 
few years running with our LVM cache.

Any ideas what may be wrong?  I have second NX3200 server with similar 
hardware setup and it would be switch to FreeBSD 11.1 with ZFS very time 
soon however I may try to install CentOS 7.4 first and see if the 
problem may be reproduced.

LVM2 installed is version lvm2-2.02.171-8.el7.x86_64.


Thank you!

Oleg


--Boundary_(ID_iFYCR2DS313cVZRO9ibfwg)
Content-type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Times New Roman, Times, serif">Hi,</font></p>
    <p><font face="Times New Roman, Times, serif">Recently I have
        decided to try out LVM cache feature on one of our Dell NX3100
        servers running CentOS 7.4.1708 with 110Tb disk array (hardware
        RAID5 with H710 and H830 Dell adapters).  Two SSD disks each 256Gb
        are in hardware RAID1 using H710 adapter with primary and
        extended partitions so I decided to make ~240Gb LVM cache to see
        if system I/O may be improved.  The server is running Bareos
        storage daemon and beside sshd and Dell OpenManage monitoring
        does not have any other services.  Unfortunately testing went
        not as I expected nonetheless at the end system is up and
        running with no data corrupted.</font></p>
    <p><font face="Times New Roman, Times, serif">Initially I have tried
        the default <font face="Courier New, Courier, monospace">writethrough</font>
        mode and after running <font face="Courier New, Courier,
          monospace">dd</font> reading test with 250Gb file got system
        unresponsive for roughly 15min with cache allocation around 50%. 
        Writing to disks it seems speed up the system however
        marginally, so around 10% on my tests and I did manage to pull
        more than 32Tb via backup from different hosts and once system
        became unresponsive to ssh and icmp requests however for a very
        short time.<br>
      </font></p>
    <p><font face="Times New Roman, Times, serif">I though it may be
        something with cache mode so switched to <font face="Courier
          New, Courier, monospace">writeback</font> via <font
          face="Courier New, Courier, monospace">lvconvert</font> and
        run <font face="Courier New, Courier, monospace">dd</font>
        reading test again with 250Gb file however that time everything
        went completely unexpected.  System started to slow responding
        for simple user interactions like list files and run <font
          face="Courier New, Courier, monospace">top</font>. And then
        became completely unresponsive for about half an hours. 
        Switching to main console via iLO I saw a lot of OOM messages
        and kernel tried to survive therefore randomly killed almost all
        processes.  Eventually I did manage to reboot and immediately
        uncached the array.</font></p>
    <p><font face="Times New Roman, Times, serif">My question is about
        very strange behavior of LVM cache.  Well, I may expect no
        performance boost or even I/O degradation however I do not
        expect run out of memory and than OOM kicks in.  That server has
        only 12Gb RAM however it does run only sshd, bareos SD daemon
        and OpenManange java based monitoring system so no RAM problems
        were notices for last few years running with our LVM cache.</font></p>
    <p><font face="Times New Roman, Times, serif">Any ideas what may be
        wrong?  I have second NX3200 server with similar hardware setup
        and it would be switch to FreeBSD 11.1 with ZFS very time soon
        however I may try to install CentOS 7.4 first and see if the
        problem may be reproduced.<br>
      </font></p>
    <p><font face="Times New Roman, Times, serif">LVM2 installed is
        version <font face="Courier New, Courier, monospace">lvm2-2.02.171-8.el7.x86_64</font>.</font></p>
    <p><font face="Times New Roman, Times, serif"><br>
      </font></p>
    <p><font face="Times New Roman, Times, serif">Thank you!</font></p>
    <p><font face="Times New Roman, Times, serif">Oleg<br>
      </font></p>
  </body>
</html>

--Boundary_(ID_iFYCR2DS313cVZRO9ibfwg)--
