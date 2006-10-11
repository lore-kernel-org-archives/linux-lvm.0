Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9BARSAQ030055
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 06:27:28 -0400
Received: from mail1.lowvoice.nl (mail.lowvoice.nl [81.171.111.151])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9BARIEH016746
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 06:27:19 -0400
Message-ID: <452CC701.3010104@BudgetDedicated.com>
Date: Wed, 11 Oct 2006 12:27:13 +0200
From: "Erik de Bruijn - BudgetDedicated.com" <Erik@BudgetDedicated.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV open but not mounted ?
References: <20061009185806.GA29486@cobalt0.panici.net>	<bae4416f49c8a46ad4f2b5232fec1986@redhat.com>
	<20061010104649.GA2638@cobalt0.panici.net>
In-Reply-To: <20061010104649.GA2638@cobalt0.panici.net>
Content-Transfer-Encoding: 7bit
Reply-To: Support@BudgetDedicated.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello Paddy,

Only making a wild guess here, but perhaps you had it mounted with 
"mount -o loop vg-foo/lv-bar /mnt"? This command will create a loopback 
device which will then be mounted. The 'dirty part' is that 'umount' 
will NOT reverse this process. It will unmount but not remove the 
automatically created loopback device. This stays attached to the LV 
which remains opened.

-- 
Kind regards,

Erik de Bruijn
BudgetDedicated

http://www.BudgetDedicated.com | Tel. +31 13 4690625 | Fax. +31 84 2248796 | Adres: Adelaarshorst 9 | Zipcode NL-5042 XE

paddy wrote:
> On Mon, Oct 09, 2006 at 04:49:35PM -0500, Jonathan E Brassow wrote:
>   
>> Hmmm, I can see where it might be 'active', but if it's not in use, it 
>> shouldn't be open.
>>     
>
> It is open. lvchange -an says LV in use: not removing
>
> but I'm drawing a blank on finding anything that is actually using it.
>
> I'm kinda hoping someone can throw some light on what 'open' is here.
>
>   
>> Some sub-lvs are marked as 'open', because they are used by the main LV 
>> (such is the case with mirroring and snapshots).
>>     
>
> no mirrors, no snapshots :-(
>
> I have looked through /etc/lvm/backups and can't see anything odd.
>
>   
>> Have you tried 'lsof <path to LV>' ?
>>     
>
> yup, tried lsof, tried fuser, there is no nfs, got nowhere.
>  
> It's one of those things where I fully expect to have to say "d'oh sorry!",
> but until I can get deeper into it I am really stumped.
>
>   
>> On Oct 9, 2006, at 1:58 PM, paddy wrote:
>>
>>     
>>> I just noticed that I have a system where an LV appears to be open
>>> (as given by lvs), but I can't see it mounted anywhere, or opened
>>> by any process.
>>>
>>> Any insights, suggestions, explanations, etc gratefully received :-)
>>>       
>
> Regards,
> Paddy
>   
