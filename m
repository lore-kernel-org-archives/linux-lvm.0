Return-Path: <markj@sgi.com>
Message-ID: <BD39367DB2A5D311BB8C009027D0E37B17256A@nt-reading1.reading.sgi.com>
From: Mark Jeffery <markj@sgi.com>
Date: Tue, 28 Nov 2000 09:19:14 -0000
MIME-Version: 1.0
Subject: [linux-lvm] RE: pvcreate fails with invalid partition type.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Thanks to Steve Brueggeman for the answer.
 
I was doing my fdisk on the part1 device. so instead of
 
fdisk -l /dev/scsi/host1/bus0/target10/lun0/part1
 
I should have used
 
fdisk -l /dev/scsi/host1/bus0/target10/lun0/disc
 
Just the same as using fx on irix really!
 
Anyway, it all worked really well, and with the XFS filesystem too!
 
Mark.
 

-- 
Mark Jeffery                Tel: +44 118 925 7666 
Presales Analyst            Mob: +44 410 579828 
SGI                         Fax: +44 118 925 7699 
Email: markj@sgi.com        http://www.sgi.com <http://www.sgi.com/>  

NB: INFORMATION IN THIS MESSAGE IS SGI CONFIDENTIAL. IT IS INTENDED SOLELY
FOR THE PERSON(S) TO WHOM IT IS ADDRESSED AND MAY NOT BE COPIED, USED,
DISCLOSED OR DISTRIBUTED TO OTHERS WITHOUT SGI CONSENT. IF YOU ARE NOT THE
INTENDED RECIPIENT PLEASE WILL YOU NOTIFY ME BY EMAIL OR TELEPHONE, DELETE
THE MESSAGE FROM YOUR SYSTEM IMMEDIATELY AND DESTROY ANY PRINTED COPIES.

 
