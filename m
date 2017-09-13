MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 13 Sep 2017 10:15:03 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
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
Message-ID: <1254de44dee90c91a37681cdbef15e44@assyoma.it>
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
Cc: Xen <list@xenhideout.nl>, Brassow, Zdenek Kabelac <zkabelac@redhat.com>

Hi Jonathan,

Il 13-09-2017 01:25 Brassow Jonathan ha scritto:
> Hi,
> 
> I’m the manager of the LVM/DM team here at Red Hat.  Let me thank
> those of you who have taken the time to share how we might improve LVM
> thin-provisioning.  We really do appreciate it and you ideas are
> welcome.
> 
> I see merit in the ideas you’ve presented and if I’ve got it right,
> there are two main ones:
> 1) don’t allow creation of new thinLVs or snapshots in a pool that is
> beyond a certain threshold
> 2) allow users to reserve some space for critical volumes when a
> threshold is reached
> 
> I believe that #1 is already handled, are you looking for anything 
> else?

Yeah, this is coverd by the appropriate use of 
snapshot_autoextend_percent. I did not realized that, thanks to Zdenek 
for pointing me to the right direction.

> #2 doesn’t seem crazy hard to implement - even in script form.  In
> RHEL7.4 (upstream = "Version 2.02.169 - 28th March 2017”), we
> introduced the lvm.conf:dmeventd/thin_command setting.  You can run
> anything you want through a script.  Right now, it is set to do
> lvextend in an attempt to add more space to a filling thin-pool.
> However, you don’t need to be so limited.  I imagine the following:
> - Add a “critical” tag to all thinLVs that are very important:
> 	# lvchange --addtag critical vg/thinLV
> - Create script that is called by thin_command, it should:
> - check if a threshold is reached (i.e. your reserved space) and if so,
> - report all lvs associated with the thin-pool that are NOT critical:
> 	# lvs -o name --noheadings --select 'lv_tags!=critical && 
> pool_lv=thin-pool’ vg
> - run <command> on those non-critical volumes, where <command> could 
> be:
> 	# fsfreeze <mnt_point>
> 
> The above should have the result you want - essentially locking out
> all non-critical file systems.  The admin can easily turn them back on
> via fsfreeze one-by-one as they resolve the critical lack of space.
> If you find this too heavy-handed, perhaps try something else for
> <command> instead first.

Very good suggestion. Actually, fsfreeze should works without too much 
drama.

> If the above is sufficient, then great.  If you’d like to see
> something like this added to the LVM repo, then you can simply reply
> here with ‘yes’ and maybe provide a sentence of what the scenario is
> that it would solve.  (I know there are already some listed in this
> thread, but I’m wondering about those folks that think the script is
> insufficient and believe this should be more standard.)

Yes, surely.

The combination of #1 and #2 should give the desired outcome (I quickly 
tested it and I found no evident problems).

Jonathan, Zdeneck, thanks you very much.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
