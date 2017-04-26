MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 26 Apr 2017 10:10:24 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
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
	<0535f3d744145eceea9121b1e68b622d@assyoma.it>
	<d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
Message-ID: <4fb6f017d9734892eff6b0ef544d99fc@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 26-04-2017 09:42 Zdenek Kabelac ha scritto:
> At this moment it's not possible.
> I do have some plans/idea how to workaround this in user-space but
> it's non-trivial - especially on recovery path.
> 
> It would be possible to 'reroute' thin to dm-delay and then write path
> to error and read path leave as is - but it's adding many new states
> to handle,
> to ATM it's in queue...

Good to know. Thank you.

> Using 'ext4' with remount-ro is fairly easy to setup and get exactly 
> this
> logic.

I'm not sure this is sufficient. In my testing, ext4 will *not* 
remount-ro on any error, rather only on erroneous metadata updates. For 
example, on a thinpool with "--errorwhenfull y", trying to overcommit 
data with a simple "dd if=/dev/zero of=/mnt/thinvol bs=1M count=1024 
oflag=sync" will cause I/O errors (as shown by dmesg), but the 
filesystem is *not* immediately remounted read-only. Rather, after some 
time, a failed journal update will remount it read-only.

XFS should behave similarly, with the exception that it will shutdown 
the entire filesystem (ie: not even reads are allowed) when metadata 
errors are detected (see note n.1).

The problem is that, as filesystem often writes its own metadata to 
already-allocated disk space, the out-of-space condition (and relative 
filesystem shutdown) will take some time to be recognized.

Note n.1
 From RED HAT STORAGE ADMINISTRATION GUIDE 
(https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Storage_Administration_Guide/ch06s09.html#idp17392328):

Metadata error behavior
The ext3/4 file system has configurable behavior when metadata errors 
are encountered, with the default being to simply continue. When XFS 
encounters a metadata error that is not recoverable it will shut down 
the file system and return a EFSCORRUPTED error. The system logs will 
contain details of the error enountered and will recommend running 
xfs_repair if necessary.


-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
