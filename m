Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3H2PIAN023853
	for <linux-lvm@redhat.com>; Tue, 17 Apr 2007 12:25:18 +1000
Message-ID: <4624300E.2010407@gmail.com>
Date: Tue, 17 Apr 2007 12:25:18 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd cman and co by a noob@clustering
References: <20070416163137.bcev2u08owwc8gk0@webmail.aic.fr>
In-Reply-To: <20070416163137.bcev2u08owwc8gk0@webmail.aic.fr>
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

jmfaidy@aic.fr wrote:
> Hello everybody,
> I'm trying to configure a cluster architecture, but i encounter some 
> issues.

you would be better off sending this to linux-cluster@redhat.com instead 
of linux-lvm.

You might want to check out the link below too. It should address one of 
the problems. ie, is sounds like your hostname resolves to the loopback 
address.

http://www.redhat.com/docs/manuals/csgfs/browse/rh-cs-en/s1-hardware-linux.html#S2-HARDWARE-ETCHOSTS

And this one may be useful too.

http://www.redhat.com/docs/manuals/enterprise/RHEL-5-manual/Cluster_Administration/index.html

Dave
