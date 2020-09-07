References: <4081c11e-d2b0-ebfa-d1a0-92a4efc79e81@redhat.com>
	<EEEA1F5E-B6AC-47CD-89BD-C4AF592749F2@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <643c43ad-0814-18a7-bb60-439adb4c6514@redhat.com>
Date: Mon, 7 Sep 2020 19:50:35 +0200
MIME-Version: 1.0
In-Reply-To: <EEEA1F5E-B6AC-47CD-89BD-C4AF592749F2@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 07. 09. 20 v 19:37 Tomas Dalebjörk napsal(a):
> thanks
> 
> ok
>   vgsplit/merge instead
> and after that lvconvert-s
> 
> yes, I am aware of the issues with corruption
> but if the cow device has all data, than no corruption will happen, right?
> 
> if COW has a copy of all blocks
> than a lvconvert —merge, or mount of the snapshot volume will be without issues

If the 'COW' has all the data - why do you need then snapshot ?
Why not travel whole LV instead of snapshot ?

Also - nowdays this old (so called 'thick') snapshot is really slow compared 
with thin-provisioning - might be good if you check what kind of features
you can gain/loose if you would have switched to thin-pool
(clearly whole thin-pool (both data & metadata) would need to travel between 
your VGs.)

Regards

Zdenek
