MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 10:28:20 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <b0d6b9a1-19fa-5e88-e031-d30d7386dfe8@redhat.com>
References: <1575245610.821680.1505258554456.ref@mail.yahoo.com>
	<1575245610.821680.1505258554456@mail.yahoo.com>
	<052d4c46af896716c0f47132f4ddfb8d@assyoma.it>
	<b0d6b9a1-19fa-5e88-e031-d30d7386dfe8@redhat.com>
Message-ID: <738b359eccce111fb8c81733276b9845@assyoma.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: matthew, LVM general discussion and development <linux-lvm@redhat.com>

Il 13-09-2017 10:15 Zdenek Kabelac ha scritto:
> Ohh this is pretty major constrain ;)

Sure :p
Sorry for not explicitly stating that before.

> 
> But as pointed out multiple times - with scripting around various
> fullness moments of thin-pool - several different actions can be
> programmed around,
> starting from fstrim, ending with plain erase of unneeded snapshot.
> (Maybe erasing unneeded files....)
> 
> To get most secure application - such app should actually avoid using
> page-cache (using direct-io)  in such case you are always guaranteed
> to get exact error at the exact time (i.e. even without journaled
> mounting option for ext4....)
> 
> 

True, but pagecache exists for a reason. Anyway, this is not anything 
you can "fix" in device mapper/lvm, I 100% agree with that.

> Partially this might get solved in 'some' cases with fully provisioned
> thinLVs within thin-pool...
> 
> What comes to my mind as possible supporting solution is -
> adding possible enhancement on LVM2 side could be  'forcible' removal
> of running volumes  (aka lvm2 equivalent  of 'dmsetup remove --force')
> 
> ATM lvm2 prevents you to remove 'running/mounted' volumes.
> 
> I can well imagine  LVM will let you forcible  replace such LV with
> error target  - so instead of  thinLV  - you will have  single 'error'
> target snapshot - which could be possibly even  auto-cleaned once the
> volume use-count drops bellow 0  (lvmpolld/dmeventd monitoring
> whatever...)
> 
> (Of course - we are not solving what happens to application
> using/running out of such error target - hopefully something not
> completely bad....)
> 
> This way - you get very 'powerful' weapon to be used in those 
> 'scriplets'
> so you can drop uneeded volumes ANYTIME you need to and reclaim its 
> resources...
> 

This would be *really* great. I played with dm-setup remove/error target 
and, while working, it often freezed LVM.
An integrated forced volume removal/swith to error target would be 
great.

Thank.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
