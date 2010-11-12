Date: Fri, 12 Nov 2010 10:06:04 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20101112100604.GF28062@agk-dp.fab.redhat.com>
References: <4CDD0B18.8060200@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4CDD0B18.8060200@windriver.com>
Subject: Re: [linux-lvm] Bug: LVM2 create long name device failed but we	can
	see it by run lvs
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
To: xufeng zhang <xufeng.zhang@windriver.com>
Cc: linux-lvm@redhat.com

On Fri, Nov 12, 2010 at 05:38:32PM +0800, xufeng zhang wrote:
> This is the bug description:
> When we create a logic volume with long names(such as 125), LVM2 will  
> return "Name too long" error
> and create volume failed. However, you will see it exist in volume group  
> if you run lvs command.
> The reason is that when LVM2 create a empty device in lv_create_empty()  
> function, it didn't check the
> length of device names, but the empty device activate failed afterward  
> because of too long name(vgname+lvname>128).

Thanks for reporting that.

Presumably 'vgrename' needs a similar restriction.

Alasdair
