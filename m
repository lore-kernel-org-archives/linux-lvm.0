References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<bef0781efb3940275a1b4d2e88848924@xenhideout.nl>
	<04498dc3-5030-079d-743f-69f40176fddf@redhat.com>
	<db6781f71691d7fb80d4f99844c8c3d9@assyoma.it>
	<607a0d33-7bd1-6baa-2a83-6d1094e72cb5@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <ed1abcd8-d030-9441-23c8-b99a02a32766@assyoma.it>
Date: Mon, 5 Mar 2018 15:27:09 +0100
MIME-Version: 1.0
In-Reply-To: <607a0d33-7bd1-6baa-2a83-6d1094e72cb5@redhat.com>
Content-Language: it-IT
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Xen <list@xenhideout.nl>

On 05/03/2018 11:18, Zdenek Kabelac wrote:
> Yes - it has been updated/improved/fixed - and I've already given you a 
> link where you can configure the behavior of XFS when i.e. device 
> reports� ENOSPC to the filesystem.

Sure - I already studied it months ago during my testing. I simply was 
under the impression that dm & xfs teams have different point of view 
regarding the actual status. I'm happy to know that it isn't the case :)

> Well complexity - it might look 'easy' to do on the first sight, but in 
> reality it's impacting all hot/fast paths with number of checks and it 
> would have rather dramatic performance impact.
> 
> The other case is, while for lots of filesystems it might look like best 
> thing - it's not always true - so there are case where it's more desired
> to have still working device with 'several' failing piece in it...
> 
> And 3rd moment is - it's unclear from kernel POV - where this 'full' 
> pool moment actually happens - i.e. imagine running� 'write' operation 
> on one thin device and 'trim/discard' operation running on 2nd. device.
> 
> So it's been left on user-space to solve the case the best way -
> i.e. user-space can initiate� 'fstrim' itself when full pool case 
> happens or get the space by number of other ways...

Ok, I see.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
