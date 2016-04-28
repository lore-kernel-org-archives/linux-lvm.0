Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3SAX8KC018851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 06:33:09 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FC077F6A8
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 10:33:06 +0000 (UTC)
Received: from shell1.dds.nl (unknown [80.84.226.197])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp1.dds.nl (Postfix) with ESMTPS id 3F2BA7F48F
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2016 12:33:03 +0200 (CEST)
Date: Thu, 28 Apr 2016 12:33:03 +0200 (CEST)
From: Xen <list@xenhideout.nl>
In-Reply-To: <1887620796.20160428084635@marki-online.net>
Message-ID: <alpine.DEB.2.11.1604281146310.25173@shell1.dds.nl>
References: <518072682.2617983.1461760017772.JavaMail.yahoo.ref@mail.yahoo.com>
	<518072682.2617983.1461760017772.JavaMail.yahoo@mail.yahoo.com>
	<00055903b32b7728a6f681ead15b39ca@dds.nl>
	<1887620796.20160428084635@marki-online.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] thin handling of available space
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 28 Apr 2016, Marek Podmaka wrote:

> Hello Xen,
>
> Wednesday, April 27, 2016, 23:28:31, you wrote:
>
>> The real question you should be asking is if it increases the monitoring
>> aspect (enhances it) if thin pool data is seen through the lens of the
>> filesystems as well.
>
>> Beside the point here perhaps. But. Let's drop the "real sysadmin"
>> ideology. We are humans. We like things to work for us. "Too easy" is
>> not a valid criticism for not having something.
>
> As far as I know (someone correct me) there is no mechanism at all in
> kernel for communication from lower fs layers to higher layers -
> besides exporting static properties like physical block size. The
> other way (from higher layer like fs to lower layers works fine - for
> example discard support).

I suspected so.

> So even if what you are asking might be valid, it isn't as simple as adding
> some parameter somewhere and it would magically work. It is about
> inventing and standardizing new communication system, which would of
> course work only with new versions of all the tools involved.

Right.

> Anyway, I have no idea what would filesystem itself do with information
> that no more space is available. Also this would work only for lvm
> thin pools, not for thin provision directly from storage, so it would
> be a non-consistent mess. Or you would need another protocol for
> exporting thin-pool related dynamic data from storage (via NAS, SAN,
> iSCSI and all other protocols) to the target system. And in some
> organizations it is not desirable at all to make this kind of
> information visible to all target systems / departments.

Yes I don't know how "thin provision directly from storage" works.

I take it you mean that these protocols you mention are or would be the 
channel through which the communication would need to happen that I now 
just proposed for LVM.

I take it you mean that these systems offer regular looking devices over 
any kind of link, while "secretly" behind the scenes using thin 
provisioning for that, and that as such we are or would be dealing with 
pretty "hard coded" standards that would require a lot of momentum to 
change any of that. In that sense that the client of these storage systems 
themselves do not know about the thin provisioning and it is up to the 
admin of those systems.,.. yadda yadda yadda.

I feel really stupid now :p.

And to make it worse, is means that in these "hardware" systems the user 
and admin are separated, but the same is true if you virtualize and you 
offer the same model to your clients. I apologize for my noviceness here 
the way I come across.

But I agree that to any client it is not helpful to know about hard limits 
that should be oblivious to them provided that the provisioning is done 
right.

It would be quite disconcerting to see your total available space suddenly 
shrink without being aware of any autoextend mechanism (for instance) and 
as such there seems to be a real divide between the "user" and the 
"supplier" of any thin volume.

Maybe I have misinterpreted the real use case for thin pools then. But my 
feeling is that I am just a bit confused at this point.

> What you are asking can be done for example directly in "df" (or you
> can make a wrapper script), which would not only check the filesystems
> themselves, but also the thin part and display the result in whatever
> format you want.

That is true of course. I have to think about it.

> Also displaying real thin free space for each fs won't be "correct".
> If I see 1 TB free in each filesystem and starting writing, by the
> time I finish, those 1 TB might be taken by the other fs. So
> information about current free space in thinp is useless for me, as in
> 1 minute it could be totally different number.

But the calamity is that if that was really true, and the thing didn't 
autoextend, then you'd end up with a frozen system.

So basically it seems at this point a conflict of interests:

- you don't want your clients to know your systems are failing
- they might not even be failing if they autoextend
- you don't want to scare them with in that sense, inaccurate data

- on a desktop system, the user and sysadmin would be the same
- there is not really any provison for graphical tools.

(maybe I should develop one. I so badly want to start coding again).

- a tool that notifies the user about the thin pool would equally well do 
the job of informing the user/admin as a filesystem point of data, would 
do.

- that implies that the two roles would stay separate.
- desktops seem to be using btrfs now in some distros

I'm concerned with the use case of a desktop user that could employ this 
technique. I now understand a bit more perhaps why grub doesn't support 
LVM thin.

The management tools for a desktop user also do not exist (except the 
command line tools we have).

Well wrong again there is a GUI it is just not very helpful.

It is not helpful at all for monitoring.

It can
* create logical volumes (regular, stripe, mirror)
* move volumes to another PV
* extend volume groups to another PV

And that's about all it can do I guess. Not sure it even needs to do much 
more, but it is no monitoring tool of any sophistication.

Let me think some more on this and I apologize for the "out loud" 
thinking.

Regards.
