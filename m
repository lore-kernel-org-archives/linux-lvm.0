Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NJOuj20406
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 14:24:56 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NJOsWA014188
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 14:24:54 -0500
Date: Tue, 23 Mar 2004 20:24:52 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] root on lvm
Message-ID: <20040323192451.GE24728@percy.comedia.it>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
	<1079729272.2126.12.camel@pascal>
	<1079922026.2361.7.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1079922026.2361.7.camel@localhost>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Mar 21, 2004 at 09:20:26PM -0500, Jeff Layton wrote:
>My solution for this (so far) is to make a non-LVM2 /boot partition and
>store a kernel and initrd in that. You can then build everything else as
>a LVM partition. Perhaps when the available bootloaders become LVM2
>aware we'll be able to do away with a seperate /boot, but for now it
>seems to be the best way to deal with it.
>Cheers,
>-- Jeff
>
>
>On Fri, 2004-03-19 at 15:47, Garcia Pascal wrote:
>> Hello,
>> I experienced also difficulties with / and lvm2.
>> configuration: 
>>    MANDRAKE 10.0, 
>>    kernel 2.6.3, 
>>    lilo 22.5.8, 
>>    reiserfs 3.6.11 ?
>>    lvm 2.00.08

lilo on mandrake 10.0 is lvm2 aware.
i don't know if there are reiserfs related problems that affect Pascal
configuration.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
