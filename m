References: <4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<0535f3d744145eceea9121b1e68b622d@assyoma.it>
	<d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
	<4fb6f017d9734892eff6b0ef544d99fc@assyoma.it>
	<20ddda25-dacf-f4e2-8df4-f9bed1c62fe7@redhat.com>
	<c5bee073-7871-fbb9-370d-8a1b322bbd86@assyoma.it>
	<921a6b9c-103e-3c71-97d2-44ceb5a6bf87@redhat.com>
	<f87b9a3de7c1871142cd47251e18c5fe@assyoma.it>
	<a8c9afaa-6b63-e60c-e37e-a845fdc8ff40@assyoma.it>
	<d5cfbd0b-5e2d-375b-f474-54ba7483ece9@assyoma.it>
	<20170512134157.GA2523@nim>
	<b0e4f2d1cfca0ea32da27b1cb34bf1be@assyoma.it>
	<b3372535-379f-8771-7395-6b0e4ba72f0d@redhat.com>
	<5358d81c-bc94-8ce1-24e1-a5795502fffc@assyoma.it>
	<24d541f6-2c99-2c39-f398-6290275f0430@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <f4cff7e3-03b1-86d1-5fae-ed0f495e17c3@assyoma.it>
Date: Tue, 16 May 2017 09:53:33 +0200
MIME-Version: 1.0
In-Reply-To: <24d541f6-2c99-2c39-f398-6290275f0430@redhat.com>
Content-Language: it-IT
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
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

On 15/05/2017 17:33, Zdenek Kabelac wrote:> Ever tested this:
> 
> mount -o errors=remount-ro,data=journal ?

Yes, I tested it - same behavior: a full thinpool does *not* immediately 
put the filesystem in a read-only state, even when using sync/fsync and 
"errorwhenfull=y".

So, it seems EXT4 remounts in read-only mode only when *metadata* 
updates fail.

> I prefer 'remount-ro'  as the FS is still at least accessible/usable in 
> some way.

Fair enought.

>>> Things are getting better

Can you make an example?

> So again - all has its price....

True ;)

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
