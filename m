Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 17 Aug 2001 10:58:36 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problems with 1.0
Message-ID: <20010817105835.C709@tykepenguin.com>
References: <BJEHIDHMNHMANMFJEKAPCEAGCAAA.tren@eotnetworks.com> <20010817110043.A10370@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010817110043.A10370@sistina.com>; from mauelshagen@sistina.com on Fri, Aug 17, 2001 at 11:00:43AM +0200
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

On Thu, Aug 16, 2001 at 10:55:35PM -0600, Tren Blackburn wrote:
> Hi List;
> 
> I had installed the 1.0 driver into my 2.4.8 kernel, and rebooted.
> Everything came up fine, so I installed the user tools and forgot about
> them...until I had to reboot this evening...Now the LVM tools are
> dynamically linked (Looking for libgcc_s.so.1)?  Or so it seems.  I am no
> a C programmer and don't fully understand how linking works, but it seems
> to me that the beta 8 tools were statically linked as they didn't need any
> external libraries, but the 1.0 user tools are dynamically linked.

libgcc_s.so.1 is new for GCC 3.0. gcc 2 statically linked libgcc. So it looks
like maybe you built beta8 with gcc 2 and 1.0 with gcc 3.

In any event, as Heinz says, libgcc.so.1 should be in /lib if gcc was correctly
installed - though if you are booting from an initrd it may not have found its
way onto that.

patrick
