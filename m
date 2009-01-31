Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0VEpv8r020026
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 09:51:57 -0500
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0VEpZXH002845
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 09:51:36 -0500
Received: from localhost (localhost [127.0.0.1])
	by localhost-12225.cs.tu-berlin.de (Postfix) with ESMTP id 92AF329233
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 15:51:35 +0100 (MET)
Received: from mailhost.cs.tu-berlin.de ([127.0.0.1])
	by localhost (mail.cs.tu-berlin.de [127.0.0.1]) (amavisd-new,
	port 12224)
	with ESMTP id okgOylFzTd2N 25405-05 for <linux-lvm@redhat.com>;
	Sat, 31 Jan 2009 15:51:31 +0100 (MET) 16168
Received: from [127.0.0.1] (fiesta.cs.tu-berlin.de [130.149.17.4])
	by mailhost.cs.tu-berlin.de (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 15:51:31 +0100 (MET)
Message-ID: <4984656F.8060206@yahoo.de>
Date: Sat, 31 Jan 2009 15:51:27 +0100
From: Peter Daum <gator_ml@yahoo.de>
MIME-Version: 1.0
References: <gf70ks$16f$1@ger.gmane.org><1c748a490811100711m7b09f422nb1f4eeced5d2e2bb@mail.gmail.com>	<gfcaf6$43f$1@ger.gmane.org>
	<8CB47E27BD0C852-AC4-686@WEBMAIL-DG06.sim.aol.com>
In-Reply-To: <8CB47E27BD0C852-AC4-686@WEBMAIL-DG06.sim.aol.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: write performance with active snapshot
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

Hi Thomas,

thomas62186218@aol.com wrote:
> I am following your thread on this topic...have any solutions emerged? I 
> as well have seen miserably performance when snapshots are active.

I am sorry, at least I still don't know any solution
(except avoiding snapshots wherever performance matters )-:

Regards,
                   Peter

> -----Original Message-----
> From: Peter Daum <gator_ml@yahoo.de>
> To: linux-lvm@redhat.com
> Sent: Tue, 11 Nov 2008 8:04 am
> Subject: [linux-lvm] Re: write performance with active snapshot
> 
> 
> 
> 
> 
> 
> 
> 
> 
> Hi, 
>  
> 
> Larry Dickson wrote: 
> 
>> My guess is that you are getting the typical seek overhead. Have you
>> tried making a volume group out of two separate RAID arrays (driving
>> different spindles), and using lvdisplay --maps to make sure the 
> parent
>> volume is on one array, the snapshot(s) on the other? 
>  
> 
> That was my suspicion, too (although I could not imagine such an extreme 
> 
> impact). Just for testing I added a single disk to the same volume group 
> 
> and put the snapshot onto that disk - amazingly it made hardly any 
> 
> difference (Actually, I'm almost glad about that, because the combination 
> 
> of a 12-disk-array with a single disk would be under almost all other 
> 
> aspects foolish). 
>  
> 
> One thing that does improve the performance a little (actually by 100%, 
> 
> which in this case meens still pretty lousy 16 MB/sec) is to increase 
> 
> the chunk size to 512kb. (I don't know yet, how this might
> affect 
> 
> performance when dealing with many small files) ... 
>  
> 
> Regards, 
> 
>                     Peter 
>  
> 
> 
>> On 11/9/08, *Peter Daum* <gator_ml@yahoo.de 
> <mailto:gator_ml@yahoo.de>>
>> wrote: 
> 
>>
>>     Hi, 
> 
>>
>>     for an application I am just working on it looks like lvm 
> snapshots 
> 
>>     would 
> 
>>     be just what I need as far as functionality is concerned. 
> Unfortunately, 
> 
>>     I am experiencing such a massive degradation in performance, that 
> the 
> 
>>     result is almost useless. 
> 
>>
>>     I'm working on a fairly fast machine (Quadcore, 8GB RAM) with a 
> big 
> 
>>     hardware RAID array and lvm2 (Debian Lenny; Linux 2.6.26-1-amd64; 
> 
>>     LVM version:2.02.39 (2008-06-27) 
> 
>>     Library version: 1.02.27 (2008-06-25) 
> 
>>     Driver version:  4.13.0) 
> 
>>
>>     Sequentially writing to a file (ext3) on a logical volume, I get 
> a 
> 
>>     sustained performance of ~ 250 MB/sec. When I create a snapshot 
> 
>>     volume, the write throughput drops to 7-8 MB/secs (on the 
> original 
> 
>>     volume; writing to the snapshot I see a significant degradation, 
> 
>>     but not nearly, as bad; read performance is o.k.).Is this 
> "normal" 
> 
>>     or is there a
> nything I can do to about it? 
> 
>>
>>     I looked in this list and searched the WWW but couldn't find any 
> 
>>     concrete information on the performance impact of snapshots 
> 
>>     (except http://www.nikhef.nl/~dennisvd/lvmcrap.html). 
> 
>>     It seems like write performance should probably be less then 1/3 
> 
>>     of the original throughput, because every write to the source 
> 
>>     volume causes 3 I/O operations plus some overhead for meta data. 
> 
>>     More difficult to estimate would be the time lost by additional 
> 
>>     head movements. Still, a throughput degradation by a factor of 30 
> 
>>     seems pretty extreme. 
> 
>>
>>     Any ideas? 
> 
>>
>>     Regards, 
> 
>>                             Peter Daum 
>  
> 
> _______________________________________________ 
> 
> linux-lvm mailing list 
> 
> linux-lvm@redhat.com 
> 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
> 
> 
> 
> 
> 
> Hi
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
