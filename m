Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CD331852A
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 19:47:19 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D28F88E56
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 19:47:17 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id g89-v6so5844187lfl.5
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 12:47:17 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
In-Reply-To: <130649f9bd1cc2378d3bee1fd2121d39@9livesdata.com>
References: <aeb589e0-e70d-44bd-a74c-bc59202f7e50@9livesdata.com>
	<CAJCQCtS1B088K1k=SLTbs34+nfD_PZWF738VROZyyb9EYX1h1A@mail.gmail.com>
	<130649f9bd1cc2378d3bee1fd2121d39@9livesdata.com>
From: Chris Murphy <lists@colorremedies.com>
Date: Fri, 28 Sep 2018 13:47:14 -0600
Message-ID: <CAJCQCtTV0g5PgSZ1=WbnuC5-9xBr7aVMeWSUYp-VJ3Qe8t5J7g@mail.gmail.com>
Subject: Re: [linux-lvm] snapshot looses origin when other snapshot is
 merged to the same origin
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
To: kostrzewa@9livesdata.com
Cc: Chris Murphy <lists@colorremedies.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Sep 28, 2018 at 12:41 PM,  <kostrzewa@9livesdata.com> wrote:
> On 28.09.2018 18:59, Chris Murphy wrote:
>>
>> On Fri, Sep 28, 2018 at 6:57 AM, Zbigniew Kostrzewa
>> <kostrzewa@9livesdata.com> wrote:
>>>
>>> Hi,
>>>
>>> I have a question related to multiple snapshots of the same thin volume.
>>> My
>>> scenario is that I create a thin pool, a thin volume and two snapshots of
>>> that thin volume. Both snapshots have the thin volume set as the origin
>>> volume. However, after I merge one of the snapshots to the origin then
>>> the
>>> second snapshot looses information about the origin.
>>>
>>> The question is if that is an expected behavior or if I am doing
>>> something
>>> wrong? Is there a way to make the second snapshot keep having the origin
>>> with merged first snapshot as its origin?
>>
>>
>> What file system are you using? And what lvm commands are you using
>> for all of this?
>>
>> Someone else will have to answer the merging question, as it's not
>> something I've ever used or expect to use with thin volumes. Merging,
>> to me, sounds like a thick volume snapshots convention.
>>
>> With thin volumes, each snapshot, even though it initially points to
>> an origin, is it's own completely independent volume. Given a thin
>> volume A, and snapshots created with 'lvcreate -s vg/A -n B' and
>> 'lvcreate -s vg/A -n C' my experience is that A B C are initially
>> identical, and modifying A does not change B or C. Modifying B does
>> not change A or C. Modifying C does not change A or B.
>>
>> By default, thin volume snapshots are not active volumes. So they're
>> not mountable. And once two or more are active, there's the potential
>> for confusion because you have literally two file systems that are
>> identical as far as the kernel is concerned. They have identical
>> volume UUIDs. I know XFS will refuse to mount a 2nd volume with the
>> same UUID as an already mounted file system; and while this can be
>> inhibited at mount time, I do not know the consequences.
>
>
> Thanks for taking time to answer my question.
>
> I don't do anything fancier than what is described in documentation for
> creating thin volumes and snapshots of thinly provisioned volumes, i.e.:
>
> lvcreate -L30G -T vg/root-pool
> lvcreate -V20G -T vg/root-pool -n root
> lvcreate --snapshot -n snap1 vg/root
> lvcreate --snapshot -n snap2 vg/root
> lvconvert --merge snap2

OK based on my reading of the documentation, my expectation of
'lvconvert --merge snap2' is effectively a shortcut for deleting root
and renaming snap2 to root.  As a precondition, neither LV involved in
the merge can be open (they can't be mounted), if either are open, the
merge is delayed. But also I would not expect snap1 to be affected at
all by the merge.

I'm not sure if my "shortcut" understanding is correct though.

And honestly, I find the word "merge" in this context *really*
confusing. Because the common synonym for merge is combine, not revert
or rollback.


> My use case is like so: I have a thinly provisioned root volume (with rootfs
> on XFS). I create a snapshot after fresh installation. I install some
> software. The I want to upgrade the software but in order to be able to
> rollback the upgrade I create a second snapshot (before the upgrade). When I
> do a rollback of the upgrade (lvconvert --merge snap2 && reboot) I loose
> possibility to rollback to the first snapshot - taken right after fresh
> installation. Most probably I can simply replace my root volume with the
> first snapshot and probably I should get what I want, that is rootfs after
> fresh installation, but running lvconvert --merge is more convenient than
> replacing the origin with the snapshot by myself.

Understood.

I'll take a guess: the instant snap2 is "merged" or rather replaces
root, then that merged LV can no longer be an origin for snap1. It
stands entirely alone and that's why merge can't work with snap1 after
you've used merge on snap2.

I haven't done this myself, but you could dig into snapper which
supports both Btrfs and LVM thin for snapshotting and rollbacks, and
see what commands it's using and when for the LVM thin case for
rolling back.



-- 
Chris Murphy
