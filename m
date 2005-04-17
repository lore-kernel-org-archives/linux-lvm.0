Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3H1NYO11779
	for <linux-lvm@redhat.com>; Sat, 16 Apr 2005 21:23:34 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.198])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3H1NSQg010779
	for <linux-lvm@redhat.com>; Sat, 16 Apr 2005 21:23:28 -0400
Received: by wproxy.gmail.com with SMTP id 68so1340617wra
	for <linux-lvm@redhat.com>; Sat, 16 Apr 2005 18:23:23 -0700 (PDT)
Message-ID: <002601c542ec$0d8ff360$0801a8c0@MOE>
From: "Ramzy Darwish" <ramzy.darwish@gmail.com>
Date: Sat, 16 Apr 2005 20:23:24 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] HELP ME! 
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

Hello All,
I am so happy to have found this list and I have searched through the 
archives looking for an answer to my problem, but have not found it.

I am by no means an expert in LVM and know just enough to set up my disks 
into a LVM pool and allocate space for different LVs.

I did this almost a year ago now and have been running a very stable linux 
box with LVM2 with no problems until now. Recently, I was given a couple of 
old HDDs and tried to add them to my pool using pvcreate/vgextend 
successfully (at least I think so).

I was able to add the drives to the pool and dole out space to my existing 
partitions. I thought everything was hunky-dory, but after rebooting, my VG 
has been corrupted somehow and I can't load any of my LVs.

I didn't have / in the pool (luckily :), but I did place /usr in there and 
this is the main problem. THe system boots fine up til LVM starting and then 
I get:

"Couldn't find device with uuid 'blah-blah-blah'
"Couldn't find all physical volumes for volume group VolGrp"
repeated several times with the same uuid value

for all of my LVs

and finally:
"Volume Group "VolGrp" not found"

I can run commands that I have seen other people using to restore stuff in 
other messages and they seem to exit succssfully such as:
# /sbin/vgcfgrestore VolGrp
> Restored volume group VolGrp

# /sbin/vgscan
> Reading all pysical volumes. This may take a while...
> Found volume group "VolGrp" using metadatatype lvm2

And if I do some other stuff, I can even get /usr mounted read-only, but 
this does not survive a reboot.

I know I am missing something, but I can't figure out what. I have been 
pouring through the mailing lists and google trying to find the solution, 
but nothing seems to be working.

Any help would be appreciated.

Thanks,
ramzy 
