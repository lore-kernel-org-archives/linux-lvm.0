Received: from [10.34.30.250] (dhcp-30-250.brq.redhat.com [10.34.30.250])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4NA27CO031050
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 06:02:08 -0400
Message-ID: <4FBCB59F.6060009@redhat.com>
Date: Wed, 23 May 2012 12:02:07 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<9014EE43-9993-4CA7-B3B0-B1F85B668206@redhat.com>
	<56453.172.16.0.29.1337716744.squirrel@beer.org.uk>
In-Reply-To: <56453.172.16.0.29.1337716744.squirrel@beer.org.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fun and games with mirroring
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 22.5.2012 21:59, Vic napsal(a):
>
>> LVM requires that for an LV to be activated while there are missing PVs,
>> the '--partial' flag must be used.  If the script running vgchange does
>> not include '--partial', your mirror won't be activated.
>
> I tried that. It didn't work.
>


In case you cannot active broken mirror that should work with --partial,
and you are using reasonable fresh version of lvm2 (bugs for 3 year old 
release will not gain a lot of attention) - please consider reporting
bug at bugzilla.redhat.com  (lvm2 component).

Zdenek
