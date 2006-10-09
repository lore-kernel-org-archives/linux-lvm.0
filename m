Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k99MhuIE024729
	for <linux-lvm@redhat.com>; Mon, 9 Oct 2006 18:43:56 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <84AAA69E-16C1-4265-BEAE-6899574EC6B1@comcast.net>
References: <84AAA69E-16C1-4265-BEAE-6899574EC6B1@comcast.net>
Content-Type: multipart/alternative; boundary=Apple-Mail-4--409333177
Message-Id: <2ec12976a813039838aa16257e42922a@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Re: Grow Live GFS volume in clustered environment?
Date: Mon, 9 Oct 2006 17:46:16 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-4--409333177
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed

This sounds like clvmd is not running on your machines...

  brassow

On Oct 4, 2006, at 1:58 PM, Eric Adair wrote:

> The specific error I'm getting in my system log is:
>
> Oct=A0 4 14:55:24 ftpimg2 lvm[2512]: Volume group for uuid not found:=20=

> qDuA09bdhxxI
> RqcN3VRZhCKM1c1aMFx6lZBFD0Rx3RtBTpG0ZdJQXDRj5lBmLUtt
>
>
> -Eric
>
> ----------------
>
>
> Is it possible to grow live GFS volumes in a clustered environment? Or=20=

> even grow them at all if they are clustered? I am assuming this is=20
> possible, but I am running into serious roadblocks.
>
> I am trying to grow a live GFS volume in a 2 node cluster. We have 3=20=

> LVM volume groups (1 physical volume each) all mounted to 3 different=20=

> mount points. Everything works great as far as both nodes reading,=20
> writing, etc to each. Both nodes mount and use each volume=20
> simultaneously without a hitch.
>
> Now that the volumes are mounted and all in use, I get "error locking=20=

> on node" errors when trying to create new volume groups with new=20
> physical volumes, or even just adding physical volumes to existing=20
> logical volume groups. This happens even if I unmount the volume on=20
> both nodes. I can't even deactivate and reactivate the existing volume=20=

> groups, no matter what I do, without getting the same error.=A0
>
>
> Am I missing something basic?
>
> Stats:
>
>    FC5 kernel-smp 2.6.17-1.2174
>       cluster-1.02.00
>         device-mapper.1.02.00
>         LVM2.2.02.07
>         open-iscsi-1.1-648
>
>         dlm locking, all necessary lvm.conf changes set for cluster=20
> locking, lvm's set for 2 node
>         clustering, etc.
>
>
> -Eric
> ________________________________
>
> ***This message has been dgitally signed by Thawte Certificate=20
> Authority*
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=

--Apple-Mail-4--409333177
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1

This sounds like clvmd is not running on your machines...


 brassow


On Oct 4, 2006, at 1:58 PM, Eric Adair wrote:


<excerpt>The specific error I'm getting in my system log is:


Oct=A0 4 14:55:24 ftpimg2 lvm[2512]: Volume group for uuid not found:
qDuA09bdhxxI

RqcN3VRZhCKM1c1aMFx6lZBFD0Rx3RtBTpG0ZdJQXDRj5lBmLUtt



-Eric


----------------



Is it possible to grow live GFS volumes in a clustered environment? Or
even grow them at all if they are clustered? I am assuming this is
possible, but I am running into serious roadblocks.


I am trying to grow a live GFS volume in a 2 node cluster. We have 3
LVM volume groups (1 physical volume each) all mounted to 3 different
mount points. Everything works great as far as both nodes reading,
writing, etc to each. Both nodes mount and use each volume
simultaneously without a hitch.


Now that the volumes are mounted and all in use, I get "error locking
on node" errors when trying to create new volume groups with new
physical volumes, or even just adding physical volumes to existing
logical volume groups. This happens even if I unmount the volume on
both nodes. I can't even deactivate and reactivate the existing volume
groups, no matter what I do, without getting the same error.=A0



Am I missing something basic?


Stats:


   FC5 kernel-smp 2.6.17-1.2174

      cluster-1.02.00

        device-mapper.1.02.00

        LVM2.2.02.07

        open-iscsi-1.1-648


<fontfamily><param>Arial</param>        dlm locking, all necessary
lvm.conf changes set for cluster locking, lvm's set for 2 node          =
</fontfamily>

<fontfamily><param>Arial</param>        clustering, etc.</fontfamily>



-Eric

________________________________


<italic>***This message has been dgitally signed by Thawte Certificate
Authority*</italic>




_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</excerpt>=

--Apple-Mail-4--409333177--
