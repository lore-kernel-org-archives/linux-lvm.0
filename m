Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MLg1j07877
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 16:42:01 -0500
Received: from solwarra.gbrmpa.gov.au (solwarra.gbrmpa.gov.au [146.116.1.5])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MLfwWA020197
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 16:41:59 -0500
Received: from gbrmpa.gov.au (pandemonium.gbrmpa.gov.au [146.116.2.0])
	by solwarra.gbrmpa.gov.au (8.11.6+Sun/8.10.2) with ESMTP id
	i2MLbTf18216
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 07:37:30 +1000 (EST)
Message-ID: <405F5D9F.6030003@gbrmpa.gov.au>
Date: Tue, 23 Mar 2004 07:41:51 +1000
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I pvresize?
References: <405E029E.6070405@gbrmpa.gov.au> <1079989821.13263.1.camel@adler>
In-Reply-To: <1079989821.13263.1.camel@adler>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I have already expanded the RAID slice by 250Gb, and now have a
/dev/sda which is 250Gb larger than it was before.

I now cannot remove that disk without either rebuilding the RAID
on the hot spare(back to square one) or destroying the RAID.

Please, can someone help me?

David Mohr wrote:
> I'm pretty new to LVM, so take my comment with a grain of salt.
> 
> Why do you need to resize the PV at all? If you need more space, create
> a new PV and add it to the LV, that should do the trick.
> 
> ~David
> 
> On Sun, 2004-03-21 at 15:01, Glen Harris wrote:
> 
>>We started running out of space on our backup server, so I bought a
>>couple of new 250Gb disks, added them to the 16 bay FC RAID array
>>and expanded the RAID, followed by the slice.
>>
>>I then went to expand the PV, and got a "Command not implemented yet."
>>message.
>>
>>This is a problem. This is a *BIG* problem.
>>
>>What are my options, short of destroying the volume and starting
>>from scratch?
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
