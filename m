Return-Path: <mark@unirez.com>
Date: Fri, 27 Jul 2001 12:57:50 -0500
From: Mark Bainter <mark@unirez.com>
Subject: Re: [linux-lvm] snapshots & reiserfs
Message-ID: <20010727125750.M5363@unirez.com>
References: <Pine.LNX.4.33.0107271727460.16916-100000@greebo.foobarhouse.com> <20010727125542.B14486@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010727125542.B14486@sistina.com>; from lewis@sistina.com on Fri, Jul 27, 2001 at 12:55:42PM -0500
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

AJ Lewis [lewis@sistina.com] wrote:
> You need to make sure you apply the linux-2.4.x-VFS-lock.patch, and also
> apply this:
> 
[snip]
> 
> Apply the patches in this order:
>  - LVM Beta8 patch
>  - VFS-lock patch
>  - the patch included in this email
> 
> Regards,

Hrm.  Do you have to be running LVM Beta8, or can those two patches
be used with the current kernel version?  (.9.0 I think?)
