Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p360EH35001629
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:14:17 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p360EDBc005366
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:14:14 -0400
Message-ID: <4D9BB055.10608@abpni.co.uk>
Date: Wed, 06 Apr 2011 01:14:13 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>
	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>
	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>
	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>
	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c! o.uk>
	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>
	<4D9BA845.10607@an! kh.org>	<4D9BAD26.5010405@abpni.co.uk>
	<alpine.LRH.2.00.1104052007130.20818@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1104052007130.20818@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
To: linux-lvm@redhat.com



On 06/04/2011 01:08, Stuart D. Gathman wrote:
> On Wed, 6 Apr 2011, Jonathan Tripathy wrote:
>
>> lvcreate -nNewCustomerLV -L20G vg0
>>
>> where vg0 is /dev/vg0
>> and vg0 is a volume group which uses an entire physical partition 
>> (Which I guess is called a PV).
>>
>> Now, if I were to create my snapshots on a seperate vg, eg:
>
> You can't do that.  Snapshots must be on the same VG.  James is 
> suggesting you
> create them on the same VG, but a different PV reserved for backup 
> snapshots. 
Guess I need to go back to LVM basics. I had a "hierarchical" structure 
in my head (which must be wrong):

An LV sites on top of a VG which sits on top of a PV

But going by your comment above, you can add multiple PVs (Physical 
partitions) to a single VG and create some form of a JBOD configuration?
