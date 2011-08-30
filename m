Message-ID: <4E5CCDB7.3020004@redhat.com>
Date: Tue, 30 Aug 2011 13:47:03 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4E5CCA32.4000000@tlinx.org>
In-Reply-To: <4E5CCA32.4000000@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Proper way to delete an active snapshot?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Linda A. Walsh" <lvm@tlinx.org>

Dne 30.8.2011 13:32, Linda A. Walsh napsal(a):
> 
> 
> 
> If you have a snapshot of a volume running... how are you supposed to delete
> it?
> 
> i.e. after you unmount it... if I just do a lvremove, I get a warning about it
> being
> an active volume -- so I tried doing a dmsetup remove on it first -- and that
> stops the warning -- but I just noticed, I had a bunch of inactive 'cow'
> volume names under 'dmsetup ls', that referred to the old snapshot names.


lvchange -an  vg/snapshot_lv

Does it work for you ?

If so - please post  -vvvv  trace.

Zdenek
