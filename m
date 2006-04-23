Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3N94rS1001799
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 05:04:53 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3N94pS6017329
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 05:04:51 -0400
Date: Sun, 23 Apr 2006 11:04:49 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] restoring my lvm
Message-ID: <20060423090449.GB950@percy.comedia.it>
References: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
	<20060422080622.GB15564@percy.comedia.it>
	<1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
	<20060423044455.GG15564@percy.comedia.it>
	<4660.192.168.0.15.1145779720.squirrel@192.168.0.15>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4660.192.168.0.15.1145779720.squirrel@192.168.0.15>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: jannetta@henning.org, LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Apr 23, 2006 at 09:08:40AM +0100, Jannetta S Steyn wrote:
>Hi Luca
>
>>>Disk /dev/hdb - 3249 MB / 3098 MiB - CHS 6296 16 63
>>>     Partition               Start        End    Size in sectors
>>>* Linux                    0   1  1   202  15 63     204561 [/boot]
>>>D Linux                  203   0  1  5645  15 63    5486544 [/]
>>>D Linux LVM              203   0  1  6295  15 63    6141744
>>>D Linux                  229   0  1  5560  15 63    5374656
>>>D Linux                  265   0  1  5596  15 63    5374656
>>>
>>
>> try with each of the linux partitions found and see if you can mount it
>> and get your data back.
>
>If I look at the way Redhat created a similar on a working system, I get
>the following information for the lv's created:
>
># lvscan
>  ACTIVE            '/dev/VolGroup02/LogVol00' [3.56 GB] inherit
>  ACTIVE            '/dev/VolGroup02/LogVol01' [320.00 MB] inherit
>
>Based on the above information, would you say that it is a reasonable to
>say that on the broken drive, the first lv was LogVol00, used for data and
>the second lv would have been LogVol01, used for swap.  Could I, like you
>suggested create a logical volume for the total size and perhaps get my
>data back (since the swap is at the end of it all?)
>
>Is creating a logical volume with lvcreate also only adjusting the
>information about the lvm and not actually touching the data, which means
>I can safely experiment, trying to change the lv's until I find the
>correct size? (I hope my questions make sense)
>
yes, but remember the "-Z n" option to lvcreate, or it will wipe the
first 1k of your data.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
