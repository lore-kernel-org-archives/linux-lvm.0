Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k488Ocig001094
	for <linux-lvm@redhat.com>; Mon, 8 May 2006 04:24:38 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k488OWQ4014835
	for <linux-lvm@redhat.com>; Mon, 8 May 2006 04:24:32 -0400
Date: Mon, 8 May 2006 10:24:31 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Two Plorilant servers (Redhat) trying to access a HP
	MSA1000
Message-ID: <20060508082430.GK12797@percy.comedia.it>
References: <1146768607.10908.21.camel@ip6-localhost>
	<20060506082551.GA10926@percy.comedia.it>
	<1146935481.9842.17.camel@ip6-localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1146935481.9842.17.camel@ip6-localhost>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, May 06, 2006 at 12:11:21PM -0500, Edgar Luna wrote:
>On Sat, 2006-05-06 at 10:25 +0200, Luca Berra wrote:
>> On Thu, May 04, 2006 at 01:50:06PM -0500, Edgar Luna wrote:
>> >I have two servers with RedHat EL3 connected to an HP MSA1000. What I
>> >want with this servers write/read the disks from the MSA1000.
>> >
>> >I know that LVM is unaware of simultaneous access to one device, so I
>> >tried to divide the storage of MSA1000 in two units (created via the ACU
>> >application), that are seen by the RedHat servers as /dev/sda
>> >and /dev/sdb. Then I created a Physical Volume for each one a Logical
>> >Group and finally a Logical Volume for each of this.
>> 
>> could you clarify what your problem is?
>> 
>Actually I have the *doubt* about the LVM capabilities. I know that LVM
>can't control when trying to access the data simultaneously from many
>servers. So I did this workaround of making two units in the MSA1000,
>and making that each server access one of this units. But I want to
>*know* if this will works, as far as I can see in this moment is working
>but I want to know if what I did is wrong.
yes, this works, with your storage you can create units that behave just
like independent disks, so as long as you don't have two different
systems accessing the same unit that's ok.

>> no, you cannot, besides that, why did you buy an intellignet storage if
>> you only wanted a disk shelf?
>> 
>Well, I didn't, but I guess they did that so they can change disks if
>something wrong, and add more space later. Anyway I only was asked to
>make the two proliant servers runs linux and write on the MSA1000 at the
>same time. Then I realize that with LVM both servers can't access to the
>same filesystem, so both can't use the whole space in the MSA1000. And
>my problem begun, how to make this two Proliant server to write/read to
>MSA1000.
if you need both system to access both units at the same time, you have
two options
either use a shared filesystem like GFS, or simply use NFS to export the
area of the other server.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
