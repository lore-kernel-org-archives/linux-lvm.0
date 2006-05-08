Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k487YiT9024946
	for <linux-lvm@redhat.com>; Mon, 8 May 2006 03:34:44 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.177])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k487Yhjf020026
	for <linux-lvm@redhat.com>; Mon, 8 May 2006 03:34:44 -0400
Message-ID: <445EF465.2050803@gmx.net>
Date: Mon, 08 May 2006 09:33:57 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Two Plorilant servers (Redhat) trying to access a
	HP MSA1000
References: <1146768607.10908.21.camel@ip6-localhost>	<20060506082551.GA10926@percy.comedia.it>
	<1146935481.9842.17.camel@ip6-localhost>
In-Reply-To: <1146935481.9842.17.camel@ip6-localhost>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Edgar Luna schrieb:
> On Sat, 2006-05-06 at 10:25 +0200, Luca Berra wrote:
>> On Thu, May 04, 2006 at 01:50:06PM -0500, Edgar Luna wrote:
>>> I have two servers with RedHat EL3 connected to an HP MSA1000. What I
>>> want with this servers write/read the disks from the MSA1000.
>>>
>>> I know that LVM is unaware of simultaneous access to one device, so I
>>> tried to divide the storage of MSA1000 in two units (created via the ACU
>>> application), that are seen by the RedHat servers as /dev/sda
>>> and /dev/sdb. Then I created a Physical Volume for each one a Logical
>>> Group and finally a Logical Volume for each of this.
>> could you clarify what your problem is?
>>
> Actually I have the *doubt* about the LVM capabilities. I know that LVM
> can't control when trying to access the data simultaneously from many
> servers. So I did this workaround of making two units in the MSA1000,
> and making that each server access one of this units. But I want to
> *know* if this will works, as far as I can see in this moment is working
> but I want to know if what I did is wrong.
>=20
>> no, you cannot, besides that, why did you buy an intellignet storage if
>> you only wanted a disk shelf?
>>
> Well, I didn't, but I guess they did that so they can change disks if
> something wrong, and add more space later. Anyway I only was asked to
> make the two proliant servers runs linux and write on the MSA1000 at the
> same time. Then I realize that with LVM both servers can't access to the
> same filesystem, so both can't use the whole space in the MSA1000. And
> my problem begun, how to make this two Proliant server to write/read to
> MSA1000.
Hi Edgar,

i'd advise you to google up info about 'cluster shared storage' to give
your problem the right name ;-). I know that the LVM guys are working on
a cluster solution for LVM2, but i don't know the status and at least it
also depends on the filesystem you use, IMHO the OCFS2 of the current
kernel could be a solution for your problem, but there are several other
 solutions for this problem.

All in all, it's much more complicated than just creating to virtual
devices and put LVM on to of it ;-).

Ciao
Klaus

--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
