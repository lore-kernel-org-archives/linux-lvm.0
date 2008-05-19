Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JNBViP027233
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 19:11:31 -0400
Received: from mta13.adelphia.net (mta13.mail.adelphia.net [68.168.78.44])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4JNBKKV009061
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 19:11:20 -0400
Received: from [192.168.1.13] (really [76.189.46.14]) by mta13.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20080519231011.CWIP21875.mta13.adelphia.net@[192.168.1.13]>
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 19:10:11 -0400
Message-ID: <48320A70.8020709@roadrunner.com>
Date: Mon, 19 May 2008 19:17:04 -0400
From: tkb <tkb9@roadrunner.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Performance of striping
References: <20080517091151.GB14292@kiwi.hjbaader.home>	<20080519124232.GB5134@redhat.com>
	<20080519190126.GB2611@kiwi.hjbaader.home>
In-Reply-To: <20080519190126.GB2611@kiwi.hjbaader.home>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hans-Joachim Baader wrote:
> Hi,
>
>
>   
>>>       

snip

>> Have you tried fiddling with read ahead ?
>> "blockdev --setra ..." on the striped LV.
>>     
>
> read ahead is currently 256 on all devices. Thanks for the hint.
> I will try some other values. Any Idea what is recommended?
>   

I originally found this script to test read ahead settings on some email 
list - I forget where or who.

#!/bin/bash

RAW_DEVS="/dev/sdb /dev/sdc /dev/sdd /dev/sde"
MD_DEVS=/dev/md17
LV_DEVS=/dev/mapper/vg17-home

LV_RAS="128 256 1024 4096 8192"
MD_RAS="128 256 1024 4096 8192"
RAW_RAS="128 256 1024 4096 8192"

log=/tmp/ra_test.log
rm -f $log

function show_ra()
{
for i in $RAW_DEVS $MD_DEVS $LV_DEVS
do echo -n "$i `blockdev --getra $i`  ::  " | tee $log
echo ""  | tee -a $log
done
}

function set_ra()
{
RA=$1
shift
for dev in $@
do
  blockdev --setra $RA $dev
done
}

function show_performance()
{
COUNT=4000000
/usr/bin/time dd if=$LV_DEVS of=/dev/null count=$COUNT 2>&1 | tee -a $log
echo "<><><>" | tee -a $log
}

for RAW_RA in $RAW_RAS
do
set_ra $RAW_RA $RAW_DEVS
for MD_RA in $MD_RAS
  do
  set_ra $MD_RA $MD_DEVS
  for LV_RA in $LV_RAS
    do
    set_ra $LV_RA $LV_DEVS
    show_ra
    show_performance
    done
  done
done
