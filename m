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
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <5358d81c-bc94-8ce1-24e1-a5795502fffc@assyoma.it>
Date: Mon, 15 May 2017 16:48:17 +0200
MIME-Version: 1.0
In-Reply-To: <b3372535-379f-8771-7395-6b0e4ba72f0d@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

On 15/05/2017 14:50, Zdenek Kabelac wrote> Hi
> 
> I still think you are mixing apples & oranges together and you expecting 
> answer '42' :)

'42' would be the optimal answer :p

> There is simply NO simple answer. Every case has its pros & cons.
> 
> There is simply cases where XFS beats Ext4 and there are opposite 
> situations as well.

Maybe I'm too naive, but I have an hard time grasping all the 
implication of this sentence.

I fully understand that, currently, a full thinp is basically a "damaged 
disk", where some writes can complete (good/provisioned zones) and some 
fail (bad/unprovisioned zones). I also read the device-mapper docs and I 
understand that, currently, a "fail all writes but let reads succeed" 
target does not exists.

What I does not understand is how XFS and EXT4 differs when a thinp is 
full. From a previous your reply, after I asked how to put thinp in read 
only mode when full:

"Using 'ext4' with remount-ro is fairly easy to setup and get exactly 
this logic."

My naive interpretation is that when EXT4 detects *any* I/O error, it 
will set the filesystem in read-only mode. Except that my tests show 
that only failed *metadata* update put the filesystem in this state. The 
bad thingh is that, when not using "remount-ro", even failed metadata 
updates will *not* trigger any read-only response.

In short, I am right saying that EXT4 should *always* be used with 
"remount-ro" when stacked on top of a thinp?

On the other hand, XFS has not such options but it, by default, ensures 
that failed *metadata* updates will stop the filesystem. Even reads are 
not allowed (to regain read access, you need to repair the filesystem or 
mount it with "ro,norecovery").

So, it should be even safer than EXT4, right? Or do you feel that is the 
other way around? If so, why?

> Things are getting better -  but  planning  usage of thin-pool to 
> 'recover' overfilled pool is simple BAD planning. You should plan your 
> thin-pool usage to NOT run out-of-space.

Sure, and I am *not* planning for it. But as bad things always happen, 
I'm preparing for them ;)

> And last comment I always say -  full thin-pool it not  similar to full 
> filesystem where you drop some 'large' file and you are happily working 
> again - it's not working this way - and if someone hoped into this - he 
> needs to use something else ATM.

Absolutely.

Sorry if I seem pedantic, I am genuinely try to understand.
Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
