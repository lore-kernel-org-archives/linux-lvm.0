Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA1Gpor05304
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 11:51:50 -0500
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA1GpmCZ025013
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 11:51:48 -0500
Received: from www.echohome.org (localhost.localdomain [127.0.0.1])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id iA1GpWdJ005917
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 11:51:33 -0500
Message-ID: <44376.64.233.217.29.1099327893.squirrel@64.233.217.29>
In-Reply-To: <41865DE3.6040409@mikebabcock.ca>
References: <41801ADE.6030308@monjoin.net>
	<20041028011738.GD13737@kluge.net>	<41808B37.40406@monjoin.net>	<20041028063530.GA13279@percy.comedia.it>
	<n6t752-uf2.ln1@triangulo.it.uc3m.es>
	<41865DE3.6040409@mikebabcock.ca>
Date: Mon, 1 Nov 2004 11:51:33 -0500 (EST)
Subject: Re: [linux-lvm] Re: Software raid on top of lvm logical volume
From: "Erik Ohrnberger" <Erik@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

This solution would seem to be as the holy grail in that it would give you
the best of all worlds: resizable RAID storage.  Or am I wrong about this
assumption?

On Mon, November 1, 2004 11:01, Michael T. Babcock said:
> Peter T. Breuer wrote:
>
>>>i do not believe you would have any advantage in stacking md above lvm
>>>anyway.
>>>
>>>
>>
>>That is right. In fact it sounds downright risky to me.
>>
>>
>
> I've actually considered a few times how one might be able to merge the
> md functionality into LVM2 (device-mapper) for having software-RAID part
> of the logical volume system (since a software-RAID partition is a
> logical volume of another type anyway).
>
> It would require some significant effort, but it seems doable.
> --
> Michael T. Babcock
> http://mikebabcock.ca
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
