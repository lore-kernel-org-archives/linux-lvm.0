Date: Wed, 7 Nov 2012 17:24:30 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20121107222430.GB19785@redhat.com>
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
	<5093A260.8000906@redhat.com>
	<71E4DE75-6510-4E4E-B31F-CAEF0CF36771@active.ee>
	<5093AC7B.6060902@redhat.com>
	<F3A71DB3-D06B-4F92-959B-504D3A2BB25C@active.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3A71DB3-D06B-4F92-959B-504D3A2BB25C@active.ee>
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
To: Andres Toomsalu <andres@active.ee>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Nov 07 2012 at  5:03pm -0500,
Andres Toomsalu <andres@active.ee> wrote:

> Apparently that does not work - FITRIM ioctl not backported to RHEL6 kernel perhaps?
> 
> fstrim -v /backup
> fstrim: /backup: FITRIM ioctl failed: Operation not supported
> 
> df -h
> /dev/mapper/VolGroupL0-thin_backup 591G  104G  458G  19% /backup
> 
> mount (added discard option today)
> /dev/mapper/VolGroupL0-thin_backup on /backup type ext4 (rw,discard)

ext4's FITRIM support was updated in RHEL6.3.  Which version of RHEL6
are you running?
