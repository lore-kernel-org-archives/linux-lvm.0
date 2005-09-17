Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8HBoAV00525
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 07:50:10 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.204])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8HBo2pC020061
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 07:50:02 -0400
Received: by zproxy.gmail.com with SMTP id m7so5800nzf
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 04:49:57 -0700 (PDT)
Message-ID: <432C02E2.5090807@gmail.com>
Date: Sat, 17 Sep 2005 14:49:54 +0300
From: Suleyman Kutlu <suleyman.kutlu@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Device mapper problems..
References: <432986DA.50107@gmail.com>
	<43299B1A.3090200@novell.com>	<432A0282.5020905@gmail.com>
	<20050916200833.GA2453@barkeeper1.linbit>
In-Reply-To: <20050916200833.GA2453@barkeeper1.linbit>
Content-Transfer-Encoding: 7bit
Reply-To: suleyman.kutlu@gmail.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Lars Ellenberg wrote:

>/ 2005-09-16 02:23:46 +0300
>\ Suleyman Kutlu:
>
>  
>
>>Two VGs.
>>
>>systemvg on /dev/sda4
>>datavg on /dev/sdb1
>>
>>    
>>
>
>slightly moving the chunks around in your mail,
>so it is more obvious...
>
>  
>
>>What I am trying to do is:
>>
>>- At least get the directory contents of the filesystem
>>  /dev/datavg/snk2lv inorder to know what I have lost.
>>  Is it possible to get this with jfsutils ??  Any experience ?
>>    
>>
>
>hm...
>
>  
>
>>- If there is a way to fix-up the device-mapper tables and get my
>>  filesystems back, it is ofcourse welcome.
>>    
>>
>
>well, comparing this:
>
>  
>
>>ls -la /dev/mapper
>>total 124
>>drwxr-xr-x   2 root root    4096 Sep 16  2005 .
>>drwxr-xr-x  36 root root  118784 Sep 16 01:49 ..
>>crw-------   1 root root  10, 63 Sep 16  2005 control
>>    
>>
>
>  
>
>>brw-------   1 root root 253,  0 Jun  5 03:24 systemvg-optlv
>>brw-------   1 root root 253,  1 Jun  5 03:25 systemvg-varlv
>>brw-------   1 root root 253,  1 May 10 03:08 systemvg-rootlv
>>brw-------   1 root root 253,  2 Jun  5 03:26 systemvg-tmplv
>>brw-------   1 root root 253,  3 Jun  5 03:26 systemvg-usrlv
>>brw-------   1 root root 253,  4 Jun  5 03:27 systemvg-temp
>>    
>>
>
>  
>
>>brw-------   1 root root 253,  6 Jul 16 20:32 datavg-rootlv
>>brw-------   1 root root 253,  7 Jul 16 22:40 datavg-snk2lv
>>brw-------   1 root root 253,  8 Sep 16  2005 datavg-backup
>>    
>>
>
>  
>
>>dmsetup ls output is:
>>
>>systemvg-optlv (253, 0)
>>systemvg-tmplv (253, 1)
>>systemvg-usrlv (253, 2)
>>systemvg-varlv (253, 3)
>>systemvg-temp  (253, 4)
>>systemvg-rootlv(253, 5)
>>    
>>
>
>  
>
>>datavg-rootlv  (253, 6)
>>datavg-snk2lv  (253, 7)
>>datavg-backup  (253, 8)
>>    
>>
>
>
>for a start,
>we see that the device nodes for -optlv and -temp are correct,
>and the datavg seems correct.
>
>but 253,1 apears two times in the listing, and 253,5 is missing...
>
>recreate those nodes with
># dmsetup mknodes
>
>or by hand with:
># cd /dev/mapper
># rm systemvg-{varlv,rootlv,tmplv,usrlv}
># mknod systemvg-tmplv   b 253 1
># mknod systemvg-usrlv   b 253 2
># mknod systemvg-varlv   b 253 3
># mknod systemvg-rootlv  b 253 5
>
>now, how this could happen is an other question.
>
>note that maybe the mapping of names to minors is still wrong.
>but at least all of the devices should be there again;
>(253,5) was missing completely before.
>
>hope that gets you one step further.
>
>  
>

You are right,  datavg seems OK from the device-mapper point of view. 
But at filesystem level, the filesystem on datavg-snk2lv seems to be 4.0 
GB but  in fact it is 80 GB. My opinion is at a point in past, 
device-mapper again scramled the major and minor numbers and 
systemvg-usrlv overwrited datavg-snk2lv.

 From dmsetup table output, datavg-snk2lv seems OK. How can I recover 
the filesystem on it ? Or more basic question, is it possible to recover ???

Thanks in advance..

*
* Suleyman Kutlu
* mailto: suleyman.kutlu@gmail.com
*
