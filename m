Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NLITj23470
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 16:18:29 -0500
Received: from solwarra.gbrmpa.gov.au (solwarra.gbrmpa.gov.au [146.116.1.5])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NLIQWA020878
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 16:18:28 -0500
Received: from gbrmpa.gov.au (pandemonium.gbrmpa.gov.au [146.116.2.0])
	by solwarra.gbrmpa.gov.au (8.11.6+Sun/8.10.2) with ESMTP id
	i2NLDtf27600
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2004 07:13:55 +1000 (EST)
Message-ID: <4060A99A.7090604@gbrmpa.gov.au>
Date: Wed, 24 Mar 2004 07:18:18 +1000
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I pvresize?
References: <OF4B3BACF4.D1DB6ADC-ON80256E60.0033B677-80256E60.003466C2@uk.ibm.com>
In-Reply-To: <OF4B3BACF4.D1DB6ADC-ON80256E60.0033B677-80256E60.003466C2@uk.ibm.com>
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

No, I used the raw device sda. I didn't bother partitioning it, as I
knew I could expand the raid, and grow the PV just like I did back
with LVM-1.

glen.

Chris Laycock wrote:
> 
> Glen,
> 
> If you do a pvscan do you get  'PV "/dev/sda1"  etc' or 'PV "/dev/sda" 
>  etc'
> If you get the former could you not create /dev/sda2 with the extra 
> 250GB and add that to the LV as a separate PV
> I'm assuming that you can have different partitions on the same array 
> (actual disk) defined as separate PVs
> I may be completely off track here, please feel free to correct.....
> 
> Regards,
> 
> Chris.
> 
> -------------------
> Chris Laycock
> IT Specialist
> IBM Global Services (IDO)
> 
> LITS, Stevenage
> Mail point: K3 STEV UK
> Email: LaycockC@uk.ibm.com
> Tel : (01438) 76-9460  (internal: 44-9460)
> 
> Please respond to LVM general discussion and development 
> <linux-lvm@redhat.com>
> 
> Sent by:        linux-lvm-bounces@redhat.com
> 
> To:         LVM general discussion and development <linux-lvm@redhat.com>
> cc:        
> Subject:         Re: [linux-lvm] How do I pvresize?
> 
> 
> I have already expanded the RAID slice by 250Gb, and now have a
> /dev/sda which is 250Gb larger than it was before.
> 
> I now cannot remove that disk without either rebuilding the RAID
> on the hot spare(back to square one) or destroying the RAID.
> 
> Please, can someone help me?
> 
> David Mohr wrote:
>  > I'm pretty new to LVM, so take my comment with a grain of salt.
>  >
>  > Why do you need to resize the PV at all? If you need more space, create
>  > a new PV and add it to the LV, that should do the trick.
>  >
>  > ~David
>  >
>  > On Sun, 2004-03-21 at 15:01, Glen Harris wrote:
>  >
>  >>We started running out of space on our backup server, so I bought a
>  >>couple of new 250Gb disks, added them to the 16 bay FC RAID array
>  >>and expanded the RAID, followed by the slice.
>  >>
>  >>I then went to expand the PV, and got a "Command not implemented yet."
>  >>message.
>  >>
>  >>This is a problem. This is a *BIG* problem.
>  >>
>  >>What are my options, short of destroying the volume and starting
>  >>from scratch?
>  >>_______________________________________________
>  >>linux-lvm mailing list
>  >>linux-lvm@redhat.com
>  >>https://www.redhat.com/mailman/listinfo/linux-lvm
>  >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  >>
>  >
>  >
>  > _______________________________________________
>  > linux-lvm mailing list
>  > linux-lvm@redhat.com
>  > https://www.redhat.com/mailman/listinfo/linux-lvm
>  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
