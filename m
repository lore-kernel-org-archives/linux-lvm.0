Received: from mx1.redhat.com (fallback01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14] (may be forged))
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BD1ZeD020787
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:01:35 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BD1Kl2029811
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 09:01:20 -0400
Message-ID: <4CB30A1B.8040609@johestephan.de>
Date: Mon, 11 Oct 2010 14:59:07 +0200
From: =?ISO-8859-1?Q?J=F6rg_Stephan?= <ml@johestephan.de>
MIME-Version: 1.0
References: <4CB2C290.7040307@johestephan.de>
	<Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1010110838020.25038@bmsred.bmsi.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Lvm Strange Problem
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Am 11.10.2010 14:40, schrieb Stuart D. Gathman:
> On Mon, 11 Oct 2010, J�rg Stephan wrote:
>
>   
>> We powered them up, and about 50% of the more than 30 servers on the
>> iscsi were timestamped 23. feb 2010.
>>
>> For now it seems that most of the freezed systems were snapshoted last year.
>>     
> It seems pretty clear that all your servers have both a snapshot and a
> live LV.  At power up, they search for their disk and randomly find
> either the live or the snapshot first.  You need to take the snapshots 
> out of the search path.
>
>   

Hi again,

well, mostly the snapshot was removed some days after they were made.
Also the snapshots had of course different names, how could it be that
they were used? And even if this, why are all machines with the failure
bound to the same date?

Greets

J�rg
