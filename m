Return-Path: <fauxpas@trellisinc.com>
Date: Fri, 17 Aug 2001 11:41:43 -0400
From: Faux Pas III <fauxpas@trellisinc.com>
Subject: Re: [linux-lvm] Problem using lvreduce
Message-ID: <20010817114143.A16214@trellisinc.com>
References: <051DFF3BBA73D3119A5800A0C95BD021C03C32@barracuda.alpha-processor.com> <20010817114344.D450@btconnect.com> <20010817114344.D450@btconnect.com> <20010817163831.A11977@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010817163831.A11977@sistina.com>; from mauelshagen@sistina.com on Fri, Aug 17, 2001 at 04:38:31PM +0200
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

On Fri, Aug 17, 2001 at 04:38:31PM +0200, Heinz J . Mauelshagen wrote:
 
> Yes, a pe index in the range of 0 to n.
> With the patch that will well result in -1 to n-1, wich is wrong.

Since it seems settled that this patch is the Wrong Way, is there a 
proper patch that addresses the problem that I can grab ?

-- 
Josh Litherland (fauxpas@trellisinc.com)
 It is by caffeine alone that I set my mind in motion.
  It is by the juice of Mtn Dew that thoughts acquire speed.
