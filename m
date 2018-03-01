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
	<fbf49ac9-152e-fb41-2905-56d30ee2024c@assyoma.it>
	<1be887bb-d86f-5896-1c19-844864c41ba2@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <c3c0342c-2957-b44b-92cc-abe9b58e818d@assyoma.it>
Date: Thu, 1 Mar 2018 13:48:09 +0100
MIME-Version: 1.0
In-Reply-To: <1be887bb-d86f-5896-1c19-844864c41ba2@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


On 01/03/2018 12:23, Zdenek Kabelac wrote:
> In general - for extX� it's remount read-only upon error - which works 
> for journaled metadata - if you want same protection for 'data' you need 
> to switch to rather expensive data journaling mode.
> 
> For XFS there is now similar logic where write error on journal stops 
> filesystem usage - look far some older message (even here in this list) 
> it's been mentioned already few times I guess...

Yes, we discussed here the issue. If I recall correctly, XFS journal is 
a circular buffer which will be always written to already-allocated 
chunks. From my tests (June 2017) it was clear that failing async 
writes, even with errorwhenfull=y, did not always trigger a prompt XFS 
stop (but the filesystem eventally shut down after some more 
writes/minutes).

> Depends on use-case - if you take snapshots of your thin volume, this 
> likely has will not help you with recovery at all.
> 
> If your thin-volumes are rather standalone only occasionally modified 
> 'growing' fs� images (so no trimming ;)) - then with this metadata 
> backup there can be some small chance you would be able to obtain some 
> 'usable' mappings of chunks to block device layout...
> 
> Personally I'd not recommend to use this at all unless you know rather 
> low-level details how this whole thing works....

Ok, I realized that and stopped using it for anything but testing.

> Unfreezed filesystem is simply not usable...

I was speaking about unfreezed thin metadata snapshot - ie: 
reserve_metadata_snap *without* a corresponding release_metadata_snap. 
Will that cause problems?


> Clearly� Startis is not a topic for lvm2 at all ;) that's all I'm going 
> to say about this....

OK :p

I think VDO is a fruit of Permabit acquisition, right? As it implements 
it's own thin provisioning, will thinlvm migrate to VDO or it will 
continue to use the current dmtarget?


-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
