Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3N9sOZE011220
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 05:54:25 -0400
Received: from jeltz.chrissie.net (vpn-6-9.fab.redhat.com [10.33.6.9])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3N9sO1W010450
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 05:54:24 -0400
Message-ID: <480F074E.40903@redhat.com>
Date: Wed, 23 Apr 2008 10:54:22 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd on openais
References: <1cafab770804230025q585c565awc8a70c8b9b2d2345@mail.gmail.com>	<480EE876.6050400@redhat.com>	<1cafab770804230110n4370eb37ga0dc41ee255ecffb@mail.gmail.com>	<480EFD72.5010809@redhat.com>
	<1cafab770804230225l6dabdd65na69df87466a81ed6@mail.gmail.com>
In-Reply-To: <1cafab770804230225l6dabdd65na69df87466a81ed6@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Xinwei Hu wrote:
> 2008/4/23, Christine Caulfield <ccaulfie@redhat.com>:
>> Xinwei Hu wrote:
>>  > 2008/4/23, Christine Caulfield <ccaulfie@redhat.com>:
>>  >> Xinwei Hu wrote:
>>  >>  > Hi all,
>>  >>  >   clvmd-openais.c uses saLckResourceLockAsync and
>>  >>  > saLckResourceUnlockAsync. But they then pthread_cond_wait the lock
>>  >>  > operation to finished.
>>  >>  >
>>  >>  >   Since we have to wait, why not switch to use saLckResourceLock and
>>  >>  > saLckResourceUnlock directly ? Are there any reasons behind this ?
>>  >>  >
>>  >>
>>  >>
>>  >> It's mainly because the code was copied and editted from the other
>>  >>  cluster systems, I think :-)
>>  > Then I propose this patch to switch over. ;)
>>
>>
>>
>> Thanks, but that patch seems to have got corrupted or something, it
>>  doesn't apply to head of CVS. can you send it again please ?
>>
>>
>>  Hunk #3 FAILED at 295.
>>  Hunk #4 succeeded at 315 (offset -8 lines).
>>  Hunk #6 succeeded at 478 (offset -8 lines).
>>  patch: **** malformed patch at line 161: @@ -590,15 +536,13 @@
>>
> Take 2.
> Against CVS head now. Please help to review ;)


That looks good to me and it tests out OK.

It's now in CVS, thank you very much.

-- 

Chrissie
