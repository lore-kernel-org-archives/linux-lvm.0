Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QERwO05121
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 10:27:58 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4QERqLL020894
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 10:27:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id E72883E8F1
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 10:38:41 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20940-04 for <linux-lvm@redhat.com>;
	Thu, 26 May 2005 10:38:38 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id 639B03E8F0
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 10:38:36 -0400 (EDT)
Message-ID: <4295DCD7.6000404@m-cam.com>
Date: Thu, 26 May 2005 10:27:35 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate issues
References: <4292256B.7060509@m-cam.com>
	<20050523200358.GJ6097@null.msp.redhat.com>
In-Reply-To: <20050523200358.GJ6097@null.msp.redhat.com>
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

AJ Lewis wrote:
> On Mon, May 23, 2005 at 02:48:11PM -0400, Arshavir Grigorian wrote:
> 
>>Hi,
>>
>>We have a SAN that exports 4 LUNs. These appear as SCSI devices on the 
>>server (/dev/sd[c-f]). When I try to create physical volumes on these 
>>devices, I get the following error:
>>
>>#>pvcreate /dev/sdc
>>  Physical volume "/dev/sdc" successfully created
>>
>>#>pvcreate /dev/sdd
>>  Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sdc 
>>not /dev/sdd
>>  Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sde 
>>not /dev/sdd
>>  Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sdf 
>>not /dev/sdd
>>  Physical volume "/dev/sdd" successfully created
>>
>>This happens after pvcreate is run the second time, does not matter in 
>>which order. It looks like when pvcreate sets the device id, it somehow 
>>sets it for all the devices.
> 
> 
> You're sure sd[c-f] is not the same device on multiple paths?
> 

How can I be sure? How do I check?

This SAN exports another set of 4 LUNs to a different server and they 
work just fine.

pvcreate --version
   LVM version:     2.00.33 (2005-01-07)
   Library version: 1.00.19-ioctl (2004-07-03)
   Driver version:  4.4.0

pvcreate on the server that does not work is a little newer, so I wonder 
if there was any new code/bug fix(es) since this version that caused a 
regression.

-- 
Arshavir Grigorian
Systems Administrator/Engineer
