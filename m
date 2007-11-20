Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKD7VrC030593
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 08:07:31 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKD6wQ2005861
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 08:06:58 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id A30D860365
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 14:06:52 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 1CB1E9488
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 14:06:52 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id 7JpCu3q11nkg for <linux-lvm@redhat.com>;
	Tue, 20 Nov 2007 14:06:49 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-79-44-194.netcologne.de
	[87.79.44.194]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 14:06:49 +0100 (CET)
Message-ID: <4742DBE7.5080706@wpkg.org>
Date: Tue, 20 Nov 2007 14:06:47 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
References: <1195557183.6329.54.camel@sanderbal> <4742C6FA.6020006@wpkg.org>
	<1195561302.6329.73.camel@sanderbal>
In-Reply-To: <1195561302.6329.73.camel@sanderbal>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

S. J. van Harmelen schrieb:
> Thanks for your reaction!
> 
> On Tue, 2007-11-20 at 12:37 +0100, Tomasz Chmielewski wrote:
>> S. J. van Harmelen schrieb:
>>> Hi list,
>>>
>>> In advance my excusses for this radar long post (although it's easy
>>> readable ;), but I want to make sure that I understand it correctly so I
>>> don't end up making a very costly mistake.
>>>
>>> I have a storage server (Debian Etch) with mutlipath-tools running and
>>> on top of that I use IET iscsi-target software to export the multipathed
>>> device to a XenSource server.
>>>
>>> XenSource creates a PV on the entire exported disk, and then creates a
>>> few LV's when I create some virtual machines.
>> Which IMO is a pity, as logically, LVM exists and is usable on that 
>> given Xen server only. This means you can't really use multiple Xen 
>> servers, live migration etc.
> 
> Are you sure about that? Accoring to Xen lvm over iSCSI is considered as
> shared storage that can be used for live migration
> (http://docs.xensource.com/XenServer/4.0.1/installation/ch03s03.html):
> 
> <snip>
> 3.3.3. XenServer Hosts with shared iSCSI storage

This implies turning a Xen server into a NAS server, as I understand?
Yes, this should work - I have a custom Xen setup, and I don't connect a 
NAS and a Xen server on one host.
But according to the description, yes, it should work.


(...)

>>> Questions that I think of then are if it's not a problem that XenSource
>>> then creates a new PV and some LV's in je LV I created adn exported on
>>> the storage server. Is that a problem, or should this work fine?
>> Hmm? I don't think I understand what you mean.
> 
> I mean I will have 2 sets of PV's and LV's. One set on the storage
> server (that has one PV and one LV that both span the whole disk), and
> one set op the Xen server (the ones that Xen makes by itself when I add
> a new vitrual machine).
> 
> Now the one LV from the storage server that Xen sees is being exported
> true iSCSI, so it wouldn't know that it is infact a LV that it's talking
> to. As far as the Xen server conserns this is just a raw disk. So it
> will then just create the needed PV and LV's on it to provision virtual
> mahines.
> 
> The question was if this PV/LV in another PV/LV (on another physical
> machine) can do any harm?

Should work, as long as you don't use it on two different machines 
(i.e., target/initiator) as LVM at the same time.


>>> And another question is how I can then restore a single LV Xen created,
>>> from the snapshot of the LV that spans the whole disk on the storage
>>> server? In that case I can not just revert to the old disk before taking
>>> the snapshot, because then all the LV's created by Xen will be set back
>>> to that point, and not just the LV that went bad.
>> # Will only work if snapshot size is equal or greater than
>> # the original volume
>>
>> dd if=/dev/LVM/volume-snapshot of=/dev/LVM/volume
>>
>> # or, if the allowed snapshot size is smaller, we don't want our
>> # precious snapshot dropped
>>
>> dd if=/dev/LVM/volume-snapshot of=/dev/LVM/new-volume
>> dd if=/dev/LVM/new-volume of=/dev/LVM/volume
> 
> Oke, but how about this when using LVM as I just described a few lines
> above here with the PV/LV in another PV/LV setup. How can I then restore
> a snapshot of a virtual machines' LV from the snapshot of the LV on the
> storage server?

As a prerequisite, you need to "see" that LVM.
But could you be more specific on what you want (write a bit more 
details in points, write a small diagram etc.)?


-- 
Tomasz Chmielewski
http://wpkg.org
