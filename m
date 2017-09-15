MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 15 Sep 2017 08:02:03 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <789E8B9F-A4FF-46A8-806F-A97786F1BCA3@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
	<789E8B9F-A4FF-46A8-806F-A97786F1BCA3@redhat.com>
Message-ID: <33a5c5be6eb5e4269e7167b3278173d7@assyoma.it>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Xen <list@xenhideout.nl>

Il 15-09-2017 04:06 Brassow Jonathan ha scritto:
> We probably won’t be able to provide any highly refined scripts that
> users can just plug in for the behavior they want, since they are
> often so highly specific to each customer.  However, I think it will
> be useful to try to create better tools so that users can more easily
> get the behavior they want.  We want to travel as much distance toward
> the user as possible and make things as usable as we can for them.
> From this discussion, we have uncovered a handful of useful ideas
> (e.g. this bug that Zdenek filed:
> https://bugzilla.redhat.com/show_bug.cgi?id=1491609) that will make
> more robust scripts possible.  We are also enhancing our reporting
> tools so users can better sort through LVM information and take
> action.  Again, this is in direct response to the feedback we’ve
> gotten here.

Excellent, thank you all very much.

 From the two proposed solutions (lvremove vs lverror), I think I would 
prefer the second one. Obviously with some warnings as "are you sure do 
error this active volume"?

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
