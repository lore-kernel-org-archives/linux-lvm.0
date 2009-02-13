Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1D9mE3v015031
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 04:48:14 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n1D9mBld029325
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 04:48:11 -0500
Message-ID: <499541F1.3080501@redhat.com>
Date: Fri, 13 Feb 2009 09:48:33 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: About fstab and fsck
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>	<68c491a60902120038g6cede40ckaa5ae58600f5ff21@mail.gmail.com>	<jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>	<499483E1.3020509@redhat.com>
	<jwvvdrf5pbn.fsf-monnier+gmane.linux.lvm.general@gnu.org>
In-Reply-To: <jwvvdrf5pbn.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
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

Stefan Monnier wrote:
>>>>> filesystem... so considering its size, I'd turn it off.
>>>>> Hopefully the "fsck takes _forever_" problem will die when
>>>>> btrfs becomes the standard filesystem.
>>>> Just a reminder: Linux has xfs since 2002. A full-blown fsck
>>>> on xfs is a rare thing.
>>> Similarly, I don't know of any case where fsck on an ext3
>>> partition turned out to be useful.  As a matter of fact, my
>>> home router's ext3
>> I wouldn't go that far. It all depends what messed the file
>> system up in the first place.
> 
> That's the thing: nothing did.  So why run fsck at all?

I read your statement to mean running fsck on a broken file system
didn't do anything useful. If it's not broken, don't fix it. :)

>> Ext3 bugs, minor scribbling and suchlike generally get tidied up 
>> reasonably well by e2fsck.  It's quite true that with major
>> corruption to the file system there's often not an awful lot left
>> afterwards but that's true of many other file systems as well.
> 
> Oh, you're thinking of using fsck for recovery purposes. That's a
> different situation.  I was just talking about the idea of "not 
> needing to do fsck any more", which is pretty much already the case
> for XFS and ext3, AFAIK.

Ah, you mean the regular mount count / interval checks? Yes, theses
should be unnecessary with a journaled file system (this is why
anaconda has disabled those checks for file systems that it creates
for years).

The paranoid might still like to run these checks occasionally to
detect any latent corruption but I'd be much more inclined to do that
on my systems if we had an fsck that ran in a reasonable amount of
time for large volumes.

> Actually I call it "router" because it was sold as such and it
> replaced a machine which I originally used as such as well.  Really
> it's just a small home server which stores&plays my music, stores
> my movies and other such things, ...  It doesn't actually do any
> routing at all.

Ah, cool; I have a similar box (although it does do some routing) that
also has a fairly sizeable file system. Currently it's configured to
never fsck on boot for the reasons discussed here.

Regards,
Bryn.
