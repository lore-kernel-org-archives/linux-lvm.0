Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGK6Gr13779
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 15:06:16 -0500
Received: from mr1.schneider.com (mr1.schneider.com [161.222.161.8])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBGK65IW005144
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 15:06:10 -0500
Subject: RE: [linux-lvm] How to increase/decrease space
Message-ID: <OF2A1D6C7C.A9DA2AE5-ON86256F6C.006D5C7E-86256F6C.006E671B@schneider.com>
From: AdabalaP@schneider.com
Date: Thu, 16 Dec 2004 14:05:53 -0600
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
To: Nicoya Helm <NHELM2@kumc.edu>
Cc: linux-lvm@redhat.com

Thanks Nicoya. I was successfully able to increase the size of the "/usr"
file system, By using "resize2fs" command.

Now, that i am able to increase the FS size, how do i go about reducing the
FS size with out the data loss, especially with "/" file system ?

While increasing the space on a LV, Do i need to do lvresize, lvextend,
resize2fs or just lvextend and resize2fs ?

Thanks.




                                                                                                                                       
                      "Nicoya Helm"                                                                                                    
                      <NHELM2@kumc.edu>        To:       <linux-lvm@redhat.com>, <AdabalaP@schneider.com>                              
                                               cc:                                                                                     
                      12/16/2004 11:09         Subject:  RE: [linux-lvm] How to increase/decrease space                                
                      AM                                                                                                               
                                                                                                                                       
                                                                                                                                       




What you have done with the commands below is to resize the logical
volume and partition - not the file system that reside on that logical
volume/partition.  the df or du commands are only considering file
system space actively accessible to the OS, which is why you are not
seeing a change in /usr partition.

The next step is to "grow" or resize the file system on /usr to fill
the addtional space on VolGrp00/LogVol04

The simplest way would probably be to umount /usr, the use the
resize2fs command to grow the file system.  This command works for both
ext2 and 3.

I'm not terribly familiar with resize2fs, as I mostly manage reiserfs,
but the man page is very straightforward:

http://www.zevils.com/cgi-bin/man/man2html?resize2fs+8

And the command will probably be something as simple as "resize2fs
/dev/VolGrp00/LogVol04 [or your specific device]".  According to the man
page, if you are wanting to extend to the full size of the partition,
you do not need to specify the size - that is the default interpretation
of the command.

The e2fsadm command is basically a combination of these two steps - it
grows the LV and the ext2/3 filesystem at the same time.  But, since
you've already resized the LV, you only need to grow the file system to
match.

Hope that helps!



Nicoya Helm
Project Manager, Network Services
University of Kansas Medical Center
nhelm2@kumc.edu

>>> AdabalaP@schneider.com 12/16/04 9:52 AM >>>
Austine,

I have a hard disk of 4.8GB which i partitioned it into 2 parts (hda1 =
100
meg, hda2 = 4.7gb). The whole disk is of ext3 file system type.The hda2
is
managed by using lvm2. Following is the partition sizes of the hda2
disk;

hda2        VolGrp00          4.6 gb

/           VolGrp00/LogVol00 450 meg     35% used
/usr        VolGrp00/LogVol04 1.9 gb      92% used
/usr/local  VolGrp00/LogVol05 128 meg     25% used
/home       VolGrp00/LogVol03 128 meg     60% used
/opt        VolGrp00/LogVol02 128 meg     35% used
/var        VolGrp00/LogVol07 450 meg     30 % used
swap        VolGrp00/LogVol01 342 meg

Here is sequence of steps that i have performed to inc/dec the
partition
sizes;

tried to increase /usr size by 400 meg.

      #lvresize -L +450 VolGrp00/LogVol04

      when i display using the "lvdisplay VolGrp00/LogVOl04" i see 2.4
gig
allocated to this partition, but when i   see it through "df -m /usr"
it
hasn't changed.

      So, As per Jason's email i have done the below;

      #lvextend -L2.4G VolGrp00/LogVol04

      But again this hasn't changed my "df -m /usr" output.

I thought using LVM commands one should be able to take care of the
inc/dec
of partitions sizes under a given VG. Why should i be using "fdisk"
and
"e2fsadm" ?

If i have missed or done any thing wrong while resizing the partitions
can
please provide me an example so that i could try it.

Thanks.
