Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3RGRVO30605
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:27:31 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3RGRTwb018725
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:27:29 -0400
Date: Wed, 27 Apr 2005 18:27:27 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: LVM2 on RAID
Message-ID: <20050427162726.GA21683@percy.comedia.it>
References: <20050427043822.GI15110@monhost.curriculum.edu.au>
	<yw1xacnkseqo.fsf@ford.inprovide.com>
	<20050427124027.GP15110@monhost.curriculum.edu.au>
	<yw1xwtqoqslo.fsf@ford.inprovide.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yw1xwtqoqslo.fsf@ford.inprovide.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

On Wed, Apr 27, 2005 at 03:03:47PM +0200, M�ns Rullg�rd wrote:
>> /* start quote */
>>
>> From: Luca Berra <bluca comedia it> 
....
>> anyway the major issues are:
>> 1) raid autodetect uses only the minor number stored in the superblock
>> to identify the array components, move a disk from a different machine
>> to yours and reboot it to enjoy the show
>
>Is this really true?  My kernel log has messages like these:
>
>md: Autodetecting RAID arrays.
>md: autorun ...
>md: considering sdb3 ...
>md:  adding sdb3 ...
>md: sdb1 has different UUID to sdb3
>md:  adding sda3 ...
>md: sda1 has different UUID to sdb3
>md: created md2
>
>If it uses the UUID, there should be little risk of misdetection.

the issue is: if it finds the wrong one before the right one

>A problem I have run into with LVM, was disks from different machines,
>using the same VG names.
>
very true.

>> Can anyone conclude that passing the parameter md=0,/dev/* to kernel
>> parameter is a better approach than using auto detect? I don't have
>> a problem with having a rather long parameters in my
>> grub.conf/lilo.conf.
>
>As usual, both ways have their own advantages and disadvantages.  What
>I like about autodetection, is that things just work, even if I
>shuffle my disks for some reason.  
>
what i did is write mdassemble to be used in initrds
it uses a mdadm.conf file where you can put the UUID and have all disk
that match a specific UUID be assembled in your MD

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
