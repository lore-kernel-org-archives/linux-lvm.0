Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1LHQHhu023214
	for <linux-lvm@redhat.com>; Wed, 21 Feb 2007 12:26:17 -0500
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1LHQCmT005188
	for <linux-lvm@redhat.com>; Wed, 21 Feb 2007 12:26:12 -0500
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 9C2E766B0D
	for <linux-lvm@redhat.com>; Wed, 21 Feb 2007 18:26:11 +0100 (CET)
Message-ID: <45DC80B3.6000001@free.fr>
Date: Wed, 21 Feb 2007 18:26:11 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM - History
References: <628454.24513.qm@web32913.mail.mud.yahoo.com>
	<87f94c370702210853i643ef08co7667e9bf5e77f126@mail.gmail.com>
In-Reply-To: <87f94c370702210853i643ef08co7667e9bf5e77f126@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Greg Freemyer a �crit :
> On 2/20/07, k <shikam@yahoo.com> wrote:
>> History of LVM
>>
>> I am researching about LVM, and looking for historical
>> data, such as; how did it get started, who was
>> involved, information about the functionality of the
>> first release ( Was it supporting raid, Size
>> restrictions, etc�), and any other historical data.
>>
>> I appreciate any suggestions you might have.
>>
>> Thanks!
>> Shi kam
> 
> A key point was 3 years ago when Redhat bought Sistina.
> 
> See http://www.open-mag.com/features/Vol_90/Sistina/Sistina.htm.
> 
> Also see http://lwn.net/2000/0224/kernel.php3 for when it first got
> into the vanilla kernel.
> 
> Greg
Hi !
If you plan to learn who invented LVM, you have to know that IMHO IBM 
was the first company to include LVM into it's Unix flavor called Aix.
Later, HP bought a software license and implemented it into HP-UX with 
modification. The HP version is quite similar as the one we have in Linux.
Also, I think Veritas software has/had a comercial LVM version to fit 
the Veritas journaled file system. I don't know if this was devised from 
IBM research or a new implementation.
Sistina software inplemented LVM into the Linux Kernel by making 
something looking like HP flavor of LVM. But due to PC hardware 
anlimitations, the LVM on Linux still lacks the ability to boot from an 
LVM root, lacks mirroring (well, true mirroring....) and things like that...
I'm not sure about the exact status of Linux LVM on other platforms than 
PC hardware...
Of course, I'm not an historian, and I do not pretend to know eery Unix 
flavor on the planet (even if I've put my hands on some really old/or 
arcane) so you'd better check with the cited companies to correct me if 
I'm wrong...
Regards
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
