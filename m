Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGFrGr21939
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 10:53:16 -0500
Received: from mr2.schneider.com (mr2.schneider.com [161.222.161.9])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBGFrFF4026879
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 10:53:16 -0500
Received: from mm1.schneider.com (mm1.schneider.com [161.222.1.24])
	by mr2.schneider.com (8.12.10+Sun/8.12.10) with ESMTP id iBGFrEn1019221
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 09:53:14 -0600 (CST)
Subject: RE: [linux-lvm] How to increase/decrease space
Message-ID: <OFE9BB603A.48ABDE42-ON86256F6C.00557C0E-86256F6C.00573F84@schneider.com>
From: AdabalaP@schneider.com
Date: Thu, 16 Dec 2004 09:52:58 -0600
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Austine,

I have a hard disk of 4.8GB which i partitioned it into 2 parts (hda1 = 100
meg, hda2 = 4.7gb). The whole disk is of ext3 file system type.The hda2 is
managed by using lvm2. Following is the partition sizes of the hda2 disk;

hda2        VolGrp00          4.6 gb

/           VolGrp00/LogVol00 450 meg     35% used
/usr        VolGrp00/LogVol04 1.9 gb      92% used
/usr/local  VolGrp00/LogVol05 128 meg     25% used
/home       VolGrp00/LogVol03 128 meg     60% used
/opt        VolGrp00/LogVol02 128 meg     35% used
/var        VolGrp00/LogVol07 450 meg     30 % used
swap        VolGrp00/LogVol01 342 meg

Here is sequence of steps that i have performed to inc/dec the partition
sizes;

tried to increase /usr size by 400 meg.

      #lvresize -L +450 VolGrp00/LogVol04

      when i display using the "lvdisplay VolGrp00/LogVOl04" i see 2.4 gig
allocated to this partition, but when i   see it through "df -m /usr" it
hasn't changed.

      So, As per Jason's email i have done the below;

      #lvextend -L2.4G VolGrp00/LogVol04

      But again this hasn't changed my "df -m /usr" output.

I thought using LVM commands one should be able to take care of the inc/dec
of partitions sizes under a given VG. Why should i be using "fdisk" and
"e2fsadm" ?

If i have missed or done any thing wrong while resizing the partitions can
please provide me an example so that i could try it.

Thanks.



                                                                                                                                       
                      "Gonyou, Austin"                                                                                                 
                      <austin@coremetri        To:       "'AdabalaP@schneider.com '" <AdabalaP@schneider.com>, "'LVM general           
                      cs.com>                   discussion and development '" <linux-lvm@redhat.com>                                   
                      Sent by:                 cc:                                                                                     
                      linux-lvm-bounces        Subject:  RE: [linux-lvm] How to increase/decrease space                                
                      @redhat.com                                                                                                      
                                                                                                                                       
                                                                                                                                       
                      12/15/2004 09:01                                                                                                 
                      PM                                                                                                               
                      Please respond to                                                                                                
                      LVM general                                                                                                      
                      discussion and                                                                                                   
                      development                                                                                                      
                                                                                                                                       
                                                                                                                                       




That only increases the device size, you also need to extend the partition
onto that larger device. e2fsadm will do it or you can fdisk it to the
larger size. (mind you this involves deleting and recreating the partition
in-memory not on disk, unless you make a mistake and do d 1 w, instead of d
1, then n p 1 <return><return><return>)


Anyhow, you really should look into extending the partition/LV itself now,
depending if you partitioned or not, or used an invalid extent
specification


Austin



-----Original Message-----
From: AdabalaP@schneider.com
To: LVM general discussion and development
Sent: 12/15/2004 8:15 PM
Subject: Re: [linux-lvm] How to increase/decrease space





"lvextend"  did not help.





My file system type is "ext3".





Here is output:


#df -m


...


/dev/mapper/VolGroup00-LogVol04    1985   1728   156    92%   /usr


...





#lvdisplay   VolGroup00/LogVol04


...


LV Size    2.45 GB


...








I did the following on /opt file system for testing, the results were
the same the filesystem did not get increased.





#umount /opt


#lvresize  -L +64 VolGroup00/LogVol07


#lvextend -L +64 VolGroup00/LogVol07





Any suggessions.












Jason Martin <jhmartin@toger.us>
Sent by: linux-lvm-bounces@redhat.com
12/15/2004 10:15 AM PST
Please respond to LVM general discussion and development


To: linux-lvm@redhat.com
cc:
bcc:
Subject: Re: [linux-lvm] How to increase/decrease space







On Wed, Dec 15, 2004 at 12:11:30PM -0600, AdabalaP@schneider.com wrote:
> (1) Added more space (350 meg) to /usr using the command "lvresize
-L+350".
> When i display the volume group using "lvdisplay" it shows 2.3 gb, But
when
> i use "df -m" it is still at 1.9 gb and 92% used state.
You've resized the volume but not the filesystem sitting on top
of it. Some filesystems can be resized online while others must
be unmounted. Some may not be resizable at all.


See http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html
<http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html> .


-Jason Martin
--
This message is PGP/MIME signed.


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
<https://www.redhat.com/mailman/listinfo/linux-lvm>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
<http://tldp.org/HOWTO/LVM-HOWTO/>


 <<C.DTF>>  <<ATT190653.txt>>
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
