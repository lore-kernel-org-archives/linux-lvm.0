Received: from [10.43.17.68] (unknown [10.43.17.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DA5A2026E04
	for <linux-lvm@redhat.com>; Thu,  1 Mar 2018 11:10:15 +0000 (UTC)
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
	<eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
	<0a322a6f355a0744427f2a7a45162c81@assyoma.it>
	<c5f98473-1dad-b48e-ef3f-b311e5de2ee9@redhat.com>
	<CAG2kNCw=L+9wwu=sKc0HK-i1nPDYWzt+VyPg3WePfOeVcHOoMg@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <88fe5ca8-61a7-c433-8be4-2f3f6fcf383d@redhat.com>
Date: Thu, 1 Mar 2018 12:10:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAG2kNCw=L+9wwu=sKc0HK-i1nPDYWzt+VyPg3WePfOeVcHOoMg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@redhat.com

Dne 1.3.2018 v 10:43 Gianluca Cecchi napsal(a):
> On Thu, Mar 1, 2018 at 9:31 AM, Zdenek Kabelac <zkabelac@redhat.com 
> <mailto:zkabelac@redhat.com>> wrote:
> 
> 
> 
>     Also note - we are going to integrate VDO support - which will be a 2nd.
>     way for thin-provisioning with different set of features - missing
>     snapshots, but having compression & deduplication....
> 
>     Regards
> 
>     Zdenek
> 
> 
> Interesting.
> I would have expected to find it already upstream, eg inside Fedora 27 to 
> begin to try, but it seems not here.
> I found this for upcoming RH EL 7.5:
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/vdo
> 
> but nothing neither in updates-testing for f27
> Is this one below the only and correct source to test on Fedora:
> https://github.com/dm-vdo/vdo
> ?
>

There is a COPR repository ATM available for certain f27 kernels.

For regular Fedora component  VDO target needs to go into upstream kernel 
first - but this needs some code changes for the module - so stay tuned....

Note - current model is 'standalone' usage of VDO devices - while we do plan 
to integrate support for VDO as another segtype.

Regards

Zdenek
