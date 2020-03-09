Date: Mon, 9 Mar 2020 12:32:16 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200309173216.GB17837@redhat.com>
References: <DDA58569-96D2-4DD7-821B-4B948BC2C21C@vleo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DDA58569-96D2-4DD7-821B-4B948BC2C21C@vleo.net>
Subject: Re: [linux-lvm] lvm+ sanlock snapshot issue
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
To: Andrea Leofreddi <a.leofreddi@vleo.net>
Cc: linux-lvm@redhat.com

On Sat, Mar 07, 2020 at 02:26:32PM +0100, Andrea Leofreddi wrote:
> root@lvm2:~/lvm2# lvmlockctl -i
> VG vg01 lock_type=sanlock Dhth4G-Fool-tugB-hcjK-ZAL4-cXnM-Q3A4x0
> LS sanlock lvm_vg01
> LK VG un ver 31
> LK GL un ver 0
> LK LV ex FoNx4D-jbOO-HRl7-OJNT-AtQi-d4Cw-lHLG5S <== locked
> LK LV un YzSN30-OE1O-TMqI-ali5-gm1x-Ws8J-Re1bFR

Thanks for pointing that out, the fix is here:
https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=dd0fdd846d85d7028e65bb801c27791a8e2cee2d

Dave
