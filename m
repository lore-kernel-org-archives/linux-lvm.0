References: <CAKxE60zw4MvD58ds-71yQdyxFkrujCm1XHNfbF=yYRqMRHF63w@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <69aeb37e-ee16-6bdb-0ae3-456b83c99289@redhat.com>
Date: Tue, 20 Oct 2020 20:02:04 +0200
MIME-Version: 1.0
In-Reply-To: <CAKxE60zw4MvD58ds-71yQdyxFkrujCm1XHNfbF=yYRqMRHF63w@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does thinpool take 2*poolmetadatasize space?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Scott Moser <smoser@brickies.net>

Dne 20. 10. 20 v 18:33 Scott Moser napsal(a):
> When I create an lvmthinpool with size S and poolmetadatasize P,
> it reduces the available freespace by S+2P. I expected that to
> be S+P. Where did the extra poolmetadatasize get used?
> 
> See below for example.
> before lvcreate we had 255868 free, after we had 254588.
> The difference is 1280.  (1024 + 2*128).
> 


lvm2 preallocated hidden _pmspare volume which has the size of
biggest metadata LV in a VG.

Such LV is used for automated 'lvconvert --repair'.

If you don't want this LV to be created you can add

--poolmetadataspare y|n

but in this case you are fully in your own to figure out,
where to take the space for repaired metadata.

You can also at any time lvremove _pmspare LV if necessary.

Regards

Zdenek
