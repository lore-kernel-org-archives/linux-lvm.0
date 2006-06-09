Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59GfO3n023060
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:41:24 -0400
Received: from bob.fastenal.com (bob.fastenal.com [205.243.112.24])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k59GfFeB025385
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:41:16 -0400
Message-ID: <4489A4A6.6030305@fastenal.com>
Date: Fri, 09 Jun 2006 11:41:10 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using LVM with EMC Powerpath...
References: <4905EFD192EEDF4A9A19EEE98C32B7F7D9E0A6@DBQV3005.na.corp.mckesson.com>
In-Reply-To: <4905EFD192EEDF4A9A19EEE98C32B7F7D9E0A6@DBQV3005.na.corp.mckesson.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Gary.Mansell@ricardo.com

Change the /etc/lvm/lvm.conf to filter out all the sd* devices and only see the
/dev/emcpower* devices.  Then when running the lvmdiskscan and pvscan it should
only see the emcpower devices.

Allen, Jack wrote:
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Gary Mansell
> Sent: Friday, June 09, 2006 9:20 AM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] Using LVM with EMC Powerpath...
> 
> Hi,
> 
> I have a powerpath device that I want to encapsulate in LVM so that I
> can grow it in the future but when I try and create the physical volume,
> I get an error:
> 
> [root@ricserver ~]# powermt display dev=emcpowera
> Pseudo name=emcpowera
> CLARiiON ID=29R231J [Ricardo]
> Logical device ID=600601604EC01000E0FC2ED6AAF5DA11 [5FCALRAID5]
> state=alive; policy=CLAROpt; priority=0; queued-IOs=0
> Owner: default=SP B, current=SP B
> ========================================================================
> ======
> ---------------- Host ---------------   - Stor -   -- I/O Path -  --
> Stats ---
> ### HW Path                 I/O Paths    Interf.   Mode    State  Q-IOs
> Errors
> ========================================================================
> ======
>    1 lpfc                      sde       SP B0     active  alive      0
> 0
>    2 lpfc                      sdi       SP A1     active  alive      0
> 0
>    3 lpfc                      sdm       SP A0     active  alive      0
> 0
>    4 lpfc                      sdq       SP B1     active  alive      0
> 0
> 
> 
> When I try to create the physical volume:
> 
> [root@ricserver ~]# pvcreate /dev/emcpowera1
>   Physical volume "/dev/emcpowera1" successfully created
> 
> 
> [root@ricserver ~]# pvscan
>   Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0:
> using /dev/emcpowera1 not /dev/sdq1
>   Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sde1
> not /dev/sdq1
>   Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sdi1
> not /dev/sdq1
>   Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sdm1
> not /dev/sdq1
>   PV /dev/sda2   VG VolGroup00   lvm2 [33.75 GB / 32.00 MB free]
>   PV /dev/sdq1                   lvm2 [266.42 GB]
>   Total: 2 [300.17 GB] / in use: 1 [33.75 GB] / in no VG: 1 [266.42 GB]
> 
> What am I doing wrong?
> 
> Any help gladly recieved
> 
> Regards
> 
> Gary Mansell
> 
> ====================
> Depending on the Linux version you are using, look at /etc/lvm/lvm.conf
> and do man on lvm.conf. Basically you need to exclude the /dev/sd*
> entries so the various LVM commands will not look at them. They will
> only look at the emcpower* names.
> 
> Jack Allen
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
