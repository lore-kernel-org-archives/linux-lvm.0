Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
Date: Thu, 14 Sep 2017 21:06:03 -0500
Message-Id: <789E8B9F-A4FF-46A8-806F-A97786F1BCA3@redhat.com>
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
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Xen <list@xenhideout.nl>


> On Sep 14, 2017, at 2:05 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
>> 
>>       2) I would freeze non-critical volumes ( I do not write to snapshots so that is no issue ) when critical volumes reached safety threshold in free space ( I would do this in-kernel if I could ) ( But Freezing In User-Space is almost the same ).
> 
> There are lots of troubles when you have freezed filesystems present in your machine fs tree... -  if you know all connections and restrictions - it can be 'possibly' useful - but I can't imagine this being useful in generic case...
> 
> And more for your thinking -
> 
> If you have pressure on provisioning caused by disk-load on one of your 'critical' volumes this FS 'freezeing' scripting will 'buy' you only couple seconds (depends how fast drives you have and how big thresholds you will use) and you are in the 'exact' same situation - expect now you have  system in bigger troubles - and you already might have freezed other systems apps by having them accessing your 'low-prio' volumes....
> 
> And how you will be solving 'unfreezing' in cases thin-pool usage drops down is also pretty interesting topic on its own...
> 
> I need to wish good luck when you will be testing and developing all this machinery.

Our general philosophy is, don’t do anything that will corrupt user data.  After that, the LVM team wants to put in place the best possible solutions for a generic user set.  When it comes to thin-provisioning, the best possible thing we can do that we are certain will not corrupt/loose data and is least likely to cause unintended consequences, is to try to grow the thin-pool.  If we are unable to grow and the thin-pool is filling up, it is really hard to “do the right thing”.

There are many solutions that could work - unique to every workload and different user.  It is really hard for us to advocate for one of these unique solutions that may work for a particular user, because it may work very badly for the next well-intentioned googler.

We’ve tried to strike a balance of doing the things that are knowably correct and getting 99% of the problems solved, and making the user aware of the remaining problems (like 100% full thin-provisioning) while providing them the tools (like the ‘thin_command’ setting) so they can solve the remaining case in the way that is best for them.

We probably won’t be able to provide any highly refined scripts that users can just plug in for the behavior they want, since they are often so highly specific to each customer.  However, I think it will be useful to try to create better tools so that users can more easily get the behavior they want.  We want to travel as much distance toward the user as possible and make things as usable as we can for them.  From this discussion, we have uncovered a handful of useful ideas (e.g. this bug that Zdenek filed: https://bugzilla.redhat.com/show_bug.cgi?id=1491609) that will make more robust scripts possible.  We are also enhancing our reporting tools so users can better sort through LVM information and take action.  Again, this is in direct response to the feedback we’ve gotten here.

Thanks,
 brassow
