From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] LVM & LFS support
Message-ID: <20030513190831.GA4777@localhost>
References: <B742DEF5E2578F43AB48979887E6CF060E16BD@MAIL001.AD.MLP.COM> <20030510155825.GA24798@localhost> <3EC0951E.90304@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EC0951E.90304@silicide.dk>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue May 13 14:08:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tuesday, 13 May 2003, at 08:47:58 +0200,
Jon Bendtsen wrote:

> Other than not being larger than the blockdevice, and doesnt the
> blockdevice has a limit of 2T ?
> 
Your are right. There has been native support for huge (huge is large than
large :) block devices in 2.5.x for some time, and I think there is also
a backport to 2.4.x (I suppose main Linux distributors have some sort of
support for huge block devices, at least on their latest business-grade
offerings).

Regards.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.5.69)
