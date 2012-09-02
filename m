Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q822Afec022768
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:10:41 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q822AeOJ018295
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:10:40 -0400
Received: by iahk25 with SMTP id k25so3231446iah.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 19:10:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+ZVM8vAABAuLF7DOJQ0gu1wdbdzGhBOeC1qZ=veM1pSZDFuRA@mail.gmail.com>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
	<14v9h9x123.ln2@goaway.wombat.san-francisco.ca.us>
	<CA+ZVM8vAABAuLF7DOJQ0gu1wdbdzGhBOeC1qZ=veM1pSZDFuRA@mail.gmail.com>
Date: Sun, 2 Sep 2012 09:10:39 +0700
Message-ID: <CA+ZVM8tGb8FQegEb3PE+rnCsV+T-RZXvPoGGMoNBD8znmdUWaQ@mail.gmail.com>
From: "Rene C." <openvz@dokbua.com>
Subject: Re: [linux-lvm] Removing vg and lv after physical drive has been
	removed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I forgot to mention 'open count' is 0 for both LV's.

On Sun, Sep 2, 2012 at 9:02 AM, Rene C. <openvz@dokbua.com> wrote:
> Thanks.
>
> dmsetup status does indeed show the orphan LV's vg04-vz and vg04-swap as active.
>
> There seems to be two ways to clear them, dmsetup clear and dmsetup
> remove - which one is the best to use? Anything I should be
> particularly careful about to not mess up things?
>
> Neither partition are active in Linux, both were unmounted before
> removing the drive.
>
>
>
> On Sun, Sep 2, 2012 at 1:01 AM, Keith Keller
> <kkeller@wombat.san-francisco.ca.us> wrote:
>> On 2012-09-01, Rene C. <openvz@dokbua.com> wrote:
>>> We had a disk fail in a server and replaced it before removing the
>>> drive from LVM.
>>>
>>> The server has 4 physical drives (PV's), each with it's own volume
>>> group (VG). Each VG has 2 or more logical volumes (LV's.) Now LVM is
>>> complaining about the missing drive. So we have a VG (vg04) with two
>>> LV's that have become orphans than we need to clear out of the system.
>>>
>>> The problem is every time we run any LVM command we get some 'read
>>> failed' errors. I've tried different commands to try to clear it out
>>> but so far without luck:
>>
>> [snip]
>>
>>> The missing VG and LV's are not important, we just want to remove them.
>>
>> I believe that you can use dmsetup to remove the vestiges of old unused
>> LVs and VGs.  Of course you *must* be careful that you don't
>> fumblefingers the command.  ;-)  I don't recall the exact syntax, so
>> check out man dmsetup, and if you have questions, hope that someone with
>> more experience can reply.  (I did this safely many months ago, but I do
>> not recall the exact syntax I used.)
>>
>> --keith
>>
>>
>> --
>> kkeller@wombat.san-francisco.ca.us
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
