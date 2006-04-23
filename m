Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3N88v7f027795
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 04:08:57 -0400
Received: from galaxy.systems.pipex.net (galaxy.systems.pipex.net
	[62.241.162.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3N88gWX007519
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 04:08:48 -0400
Received: from 192.168.0.7 (userb089.dsl.pipex.com [62.188.49.89])
	by galaxy.systems.pipex.net (Postfix) with ESMTP id 0E900E0002A8
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 09:08:36 +0100 (BST)
Message-ID: <4660.192.168.0.15.1145779720.squirrel@192.168.0.15>
In-Reply-To: <20060423044455.GG15564@percy.comedia.it>
References: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
	<20060422080622.GB15564@percy.comedia.it>
	<1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
	<20060423044455.GG15564@percy.comedia.it>
Date: Sun, 23 Apr 2006 09:08:40 +0100 (BST)
Subject: Re: [linux-lvm] restoring my lvm
From: "Jannetta S Steyn" <jannetta@henning.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: jannetta@henning.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi Luca

>>Disk /dev/hdb - 3249 MB / 3098 MiB - CHS 6296 16 63
>>     Partition               Start        End    Size in sectors
>>* Linux                    0   1  1   202  15 63     204561 [/boot]
>>D Linux                  203   0  1  5645  15 63    5486544 [/]
>>D Linux LVM              203   0  1  6295  15 63    6141744
>>D Linux                  229   0  1  5560  15 63    5374656
>>D Linux                  265   0  1  5596  15 63    5374656
>>
>
> try with each of the linux partitions found and see if you can mount it
> and get your data back.

If I look at the way Redhat created a similar on a working system, I get
the following information for the lv's created:

# lvscan
  ACTIVE            '/dev/VolGroup02/LogVol00' [3.56 GB] inherit
  ACTIVE            '/dev/VolGroup02/LogVol01' [320.00 MB] inherit

Based on the above information, would you say that it is a reasonable to
say that on the broken drive, the first lv was LogVol00, used for data and
the second lv would have been LogVol01, used for swap.  Could I, like you
suggested create a logical volume for the total size and perhaps get my
data back (since the swap is at the end of it all?)

Is creating a logical volume with lvcreate also only adjusting the
information about the lvm and not actually touching the data, which means
I can safely experiment, trying to change the lv's until I find the
correct size? (I hope my questions make sense)

Regards
Jannetta


Random Thought:
---------------
If you are smart enough to know that you're not smart enough to be an
Engineer, then you're in Business.
