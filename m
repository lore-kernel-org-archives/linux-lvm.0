Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 5 Feb 2001 17:17:24 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm-0.9.1beta3 & kernel-2.4.1: vgrename: 'Segmentation fault'
Message-ID: <20010205171724.H525@tykepenguin.com>
References: <A4A5E4C468B5D11190220001FA6835DD04DD8801@EPIXCH003>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD8801@EPIXCH003>; from JSO@EUROPAY.COM on Mon, Feb 05, 2001 at 09:25:41AM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 05, 2001 at 09:25:41AM +0100, SOETE Jo?l wrote:
> Hi all,
> 
> Having "LVM-0.9 Trouble in pvcreate"
> (http://lists.sistina.com/pipermail/linux-lvm/2000-December/005654.html) and
> learning that kernel-2.4.1and lvm-0.9.1beta3 was released I install it on my
> linux box (Intel PIII, 128Mb ram, 15Gb disk).
> 
> I test successfully LVM-HOWTO with a small slice of 16Mb (so I adapt size of
> extend to 16K) excepted point 9 (vgrename) and 10.
> 
> Point 10 was not tested because resize for ext2 was not yet installed.
> 
> Point 9 vgrename failed : 'Segmentation fault' (sorry I could not log more.
> redirection 2>&1 does not work?).
> 
> I reboot my system to be sure and accidentally I forget to "vgchange -an
> test_vg" then "vgrename test_vg vg_test" works?
> 
> Well, summary:
> 	# vgchange -an test_vg
> 	# vgrename test_vg vg_test 
> 	Segmentation fault
> 
> 	# vgchange -ay test_vg
> 	# vgrename test_vg vg_test 
> -> success
> 
> Sorry, I have not enough knowledge to hack this problem.

I've fixed this in CVS.

Thanks for the bug report. 

patrick
