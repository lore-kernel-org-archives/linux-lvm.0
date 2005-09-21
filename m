Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8LA26V26597
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 06:02:06 -0400
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8LA208d029853
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 06:02:00 -0400
Received: by xproxy.gmail.com with SMTP id h29so148922wxd
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 03:01:55 -0700 (PDT)
Message-ID: <43312F8F.1060208@gmail.com>
Date: Wed, 21 Sep 2005 13:01:51 +0300
From: Suleyman Kutlu <suleyman.kutlu@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Device mapper problems..
References: <432986DA.50107@gmail.com>
	<43299B1A.3090200@novell.com>	<432A0282.5020905@gmail.com>	<20050916200833.GA2453@barkeeper1.linbit>	<432C02E2.5090807@gmail.com>
	<20050917191034.GD12882@barkeeper1.linbit>
In-Reply-To: <20050917191034.GD12882@barkeeper1.linbit>
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

>>You are right,  datavg seems OK from the device-mapper point of view.
>>But at filesystem level, the filesystem on datavg-snk2lv seems to be
>>4.0 GB but  in fact it is 80 GB. My opinion is at a point in past,
>>device-mapper again scramled the major and minor numbers and
>>systemvg-usrlv overwrited datavg-snk2lv.
>>    
>>
>
>unlikely. it would not have changed the file system layout.
>
>more likely, the mapping is wrong.
>
>what do you find in /etc/lvm/backup and /etc/lvm/archive ?
>those are plain text files, which store the mapping at that point in
>time. compare it with the current mapping.
>maybe there is something obvious in the difference...
>
>btw, what did you find on the 253,5
>which was missing from your previous device node list?
>
>  
>
>>From dmsetup table output, datavg-snk2lv seems OK. How can I recover
>>the filesystem on it ? Or more basic question, is it possible to
>>recover ???
>>    
>>
>
>well, everything is possible :->
>its more a question of time and effort...
>
>  
>

After issuing the commands you recommended, 253,5 appeared and the 
systemvg is now OK. Thanks..

Now the problem appeared to be a JFS problem. For datavg, mapping seems 
to be correct, LV information and the info from dmsetup seems to be equal.

If anybody in this list have experience and can lead me

     - to view the contents of the raw device (/dev/datavg/snk2lv) with 
jfs-utils
     - to get the filenames on the device (again with jfs-utils)

I will really appreciate..

Thank you for all your help....

*
* Suleyman Nazif Kutlu (a.k.a SNK)
* mailto: suleyman.kutlu@gmail.com
*
