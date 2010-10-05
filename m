MIME-Version: 1.0
In-Reply-To: <4CAB480A.8050906@cfl.rr.com>
References: <AANLkTikNhZrMa91CCBC9MSLfyaWdO+1O=TGt_1bowwvf@mail.gmail.com>
	<4CAB14C9.7040707@redhat.com> <4CAB480A.8050906@cfl.rr.com>
Date: Tue, 5 Oct 2010 21:29:53 +0530
Message-ID: <AANLkTim9VZQ2Ki4EDWnGAM3GbGz7CacmBf8y=2MnLhy3@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: Re: [linux-lvm] moving an LVM as an ISO can be moved
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: sugupta@redhat.com

On Tue, Oct 5, 2010 at 9:15 PM, Phillip Susi <psusi@cfl.rr.com> wrote:
>
> This is unrelated to LVM but if you want to image a disk volume you do
> so the same way as with a cd/iso image: use dd.
You mean to say
dd if=/some/iso of=/temp/location bs=1024
similarly
dd if=/dev/lvm/in/question of=/nfs/location/to/store bs=1024
this type of thing.
And then boot from that.
