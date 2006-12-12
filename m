Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBCAGL5B007863
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 05:16:21 -0500
Received: from tornado.virtua.ch (tornado.virtua.ch [217.119.144.130])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBCAGJFN032090
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 05:16:20 -0500
Received: from tornado.virtua.ch (localhost.localdomain [127.0.0.1])
	by tornado.virtua.ch (Postfix) with ESMTP id 0B4902D2A08
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 11:16:18 +0100 (CET)
Received: from albator.aubonne.virtua.ch (albator.aubonne.virtua.ch
	[192.168.1.2])
	by tornado.virtua.ch (Postfix) with ESMTP id E4D322D29CA
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 11:16:17 +0100 (CET)
Received: from [192.168.1.30] (unknown [192.168.1.30])
	by albator.aubonne.virtua.ch (Postfix) with ESMTP id A9CBB73579
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 11:16:17 +0100 (CET)
Message-ID: <457E8170.4000007@virtua.ch>
Date: Tue, 12 Dec 2006 11:16:16 +0100
From: Jean Chiappini <Jean.Chiappini@virtua.ch>
MIME-Version: 1.0
Subject: Re: [linux-lvm] EXT3-fs: unable to read superblock
References: <457D8863.1020801@virtua.ch>
	<20061211180859.GN31405@valinor.arda.theunixman.com>
In-Reply-To: <20061211180859.GN31405@valinor.arda.theunixman.com>
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
To: linux-lvm@redhat.com

Thank you for your answer, but when I do this command, this error appear :
tune2fs: Argument invalide while trying to open 
/dev/mapper/VolGroup00-mysqldata
Couldn't find valid filesystem superblock.

The only solution I see now is to format this partition...

Evan Cofsky wrote:
> On 12/11 17:33, Jean Chiappini wrote:
>   
>> Hello all,
>>
>> I have a server production with centos 4 with kernel 2.6.9-42 and 
>> lvm2-2.02.06 installed. All was working find, but today the server 
>> crashed. When I would reboot my server, I saw in the log that the lvm 
>> partiton wouldn't mount. This is the error -> kernel: EXT3-fs: unable to 
>> read superblock.
>>     
>
> I had this problem recently with a few systems.  Try booting to
> single-user mode, and then do the following command:
>
> tune2fs -j DEVICE-FILE-WITH-PROBLEM
>
> This will create a new journal on the filesystem.  I haven't tracked
> down why the journal disappears yet, but it seems to, and then the
> system (of course) won't mount it as ext3.
>
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
