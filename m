MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 11:07:53 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
Message-ID: <483184bceea4fad4baafef32408015b6@assyoma.it>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

Il 14-04-2017 10:24 Zdenek Kabelac ha scritto:
> 
> But it's currently impossible to expect you will fill the thin-pool to
> full capacity and everything will continue to run smoothly - this is
> not going to happen.

Even with EXT4 and errors=remount-ro?

> 
> However there are many different solutions for different problems -
> and with current script execution - user may build his own solution -
> i.e.  call
> 'dmsetup remove -f' for running thin volumes - so all instances get
> 'error' device   when pool is above some threshold setting (just like
> old 'snapshot' invalidation worked) - this way user will just kill
> thin volume user task, but will still keep thin-pool usable for easy
> maintenance.
> 

Interesting. However, the main problem with libvirt is that its 
pool/volume management fall apart when used on thin-pools. Basically, 
libvirt does not understand that a thinpool is a container for thin 
volumes (ie: 
https://www.redhat.com/archives/libvirt-users/2014-August/msg00010.html)

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
