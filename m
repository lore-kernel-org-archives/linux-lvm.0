Return-Path: <dave@galilean.d2g.com>
Date: Sat, 24 Mar 2001 19:08:08 +0100
From: Dave Wapstra <dave@xs4all.nl>
Subject: Re: [linux-lvm] LVM corruption with ext2resize on Ultrasparc
Message-ID: <20010324190808.A28688@mercury.mercury.multiweb.nl>
References: <20010323225559.A20479@mercury.mercury.multiweb.nl> <200103232311.f2NNBoG24415@webber.adilger.int>
Mime-Version: 1.0
In-Reply-To: <200103232311.f2NNBoG24415@webber.adilger.int>; from adilger@turbolinux.com on Fri, Mar 23, 2001 at 04:11:50PM -0700
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

On 23 March, 2001 at 16:11:50 -0700, Andreas Dilger <adilger@turbolinux.com> wrote:
> I _really_ need to see what you did in between here that could cause the
> problem.  Did you do an lvextend or something?  Any messages in the
> syslog?  Basically, it is impossible that ext2resize caused any problems.
> 

I'll try and reproduce the problem pinpoint the exact order of commands that triggers the problem.

-Dave

-- 
Dave Wapstra
dave@xs4all.nl
