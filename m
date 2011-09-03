Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p837meuH030613
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2011 03:48:40 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p837mZDt007615
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2011 03:48:35 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p837mTR4013098
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2011 00:48:31 -0700
Message-ID: <4E61DBCD.9000504@tlinx.org>
Date: Sat, 03 Sep 2011 00:48:29 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E5CCA32.4000000@tlinx.org> <4E5CCDB7.3020004@redhat.com>
	<4E5CD154.6020308@redhat.com>
In-Reply-To: <4E5CD154.6020308@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Proper way to delete an active snapshot?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Zdenek Kabelac wrote:
> Dne 30.8.2011 13:47, Zdenek Kabelac napsal(a):
>   
>> Dne 30.8.2011 13:32, Linda A. Walsh napsal(a):
>>     
>>>
>>> If you have a snapshot of a volume running... how are you supposed to delete
>>> it?
>>>
>>> i.e. after you unmount it... if I just do a lvremove, I get a warning about it
>>> being
>>> an active volume -- so I tried doing a dmsetup remove on it first -- and that
>>> stops the warning -- but I just noticed, I had a bunch of inactive 'cow'
>>> volume names under 'dmsetup ls', that referred to the old snapshot names.
>>>       
>> lvchange -an  vg/snapshot_lv
>>     
>
> Ooops sorry - ignore this one - as this will work with some not yet release target
>
>   
I'm confused.

First I tried:

# lvremove /dev/Home+Space/Home-2011.08.31-02.23.11
Do you really want to remove active logical volume 
Home-2011.08.31-02.23.11? [y/n]: ^C
  Logical volume Home-2011.08.31-02.23.11 not removed


Then, I tried what you had above:

# lvchange -an /dev/Home+Space/Home-2011.08.31-02.23.11     
# lvremove /dev/Home+Space/Home-2011.08.31-02.23.11    
  Logical volume "Home-2011.08.31-02.23.11" successfully removed

Was it not supposed to work?



>> Does it work for you ?
>>
>> If so - please post  -vvvv  trace.
>>     
>
>
> So just post only  lvremove -vvvv  trace please.
>
> It could be udev-related issue.
>
> Zdenek
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
