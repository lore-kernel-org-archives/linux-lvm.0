Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4MFTcJi013409
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 11:29:38 -0400
Received: from hobgoblin.beer.org.uk (beer.org.uk [91.84.48.107])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4MFTaqI009375
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 11:29:37 -0400
Received: from hobgoblin.beer.org.uk (hobgoblin [127.0.0.1] (may be forged))
	by hobgoblin.beer.org.uk (8.13.1/8.13.1) with ESMTP id q4MFTaDh005150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 16:29:36 +0100
Message-ID: <54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
In-Reply-To: <CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
Date: Tue, 22 May 2012 16:29:36 +0100 (BST)
From: "Vic" <lvm@beer.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fun and games with mirroring
Reply-To: lvm@beer.org.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


> How is it different/better than 'mdadm --fail' ing a member out of an
> MD raid1 set as a temporary snapshot?

You can do it to a box that hasn't been set up with mdadm...

Vic.
