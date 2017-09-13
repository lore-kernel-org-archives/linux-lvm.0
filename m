MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 10:21:00 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <9ba4086d-db8a-da37-9f65-a0eb055e089e@redhat.com>
References: <418002318.647314.1505245480415.ref@mail.yahoo.com>
	<418002318.647314.1505245480415@mail.yahoo.com>
	<4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
	<41419c78-953e-cb78-ade7-c9fc611a92fb@redhat.com>
	<d994dea1f0b3a800cc8d546bf8d9214f@assyoma.it>
	<dc2f993c-6a90-ff8d-6d06-e629ac4931a4@redhat.com>
	<c6bc164dd29fce956b2af7d4cd9077a6@assyoma.it>
	<9ba4086d-db8a-da37-9f65-a0eb055e089e@redhat.com>
Message-ID: <4c9bdd9acc05d1dcc8d0bd1dc34a2fb2@assyoma.it>
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 13-09-2017 01:31 Zdenek Kabelac ha scritto:
> It's not just about 'complexity' in frame work.
> You would lose all the speed as well.
> You would significantly raise-up  memory requirement.
> 
> There is very good reason complex tools like  'thin_ls' are kept in
> user-space  outside of kernel   - with  'dm'  we tend to have simpler
> kernel logic
> and complexity should stay in user-space.
> 
> And of course - as pointed out - the size of your 'reserve' is so
> vague  :) and could potentially present major portion of you whole
> thin-pool size without any extra benefit (as obviously any reserve
> could be too small unless you 'reach' fully provisioned state :)
> 
> i.e. example:
> 10G thinLV  with  1G chunks -  single byte write may require full 1G 
> chunk...
> so do you decide to keep 10 free chunks in reserves ??

What was missing (because I thought it was implicit) is that I expect 
snapshot to never change - ie: they are read-only.
Anyway, I was not writing about "resevers" - rather, to 
preassign/preallocate the required space to a specific volume.
A fallocate on a otherwise thinly provisioned volume, if you like.

> Supposedly:
> 
> lvmconfig --typeconfig full --withversion
> 
>         # Available since version 2.2.89.
>         thin_pool_autoextend_threshold=70
> 
> 
> However there were some bugs and fixes - and validation for not
> allowing to create new thins - so do not try anything below 169 and if
> you can
> go with 173....
> 

Ah! I was not thinking about thin_pool_autoextend_threshold! I tried 
with 166 (for now) and I don't see any major problems. However, I will 
surely upgrade at the first opportunity!

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
