Return-Path: <mauelshagen@sistina.com>
Date: Fri, 17 Aug 2001 11:00:43 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with 1.0
Message-ID: <20010817110043.A10370@sistina.com>
References: <BJEHIDHMNHMANMFJEKAPCEAGCAAA.tren@eotnetworks.com>
Mime-Version: 1.0
In-Reply-To: <BJEHIDHMNHMANMFJEKAPCEAGCAAA.tren@eotnetworks.com>; from tren@eotnetworks.com on Thu, Aug 16, 2001 at 10:55:35PM -0600
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
> 
> Now this probably doesn't seem like a problem, but when your libraries are
> mounted on a LVM volume and you have no tools to activate your volume
> with...well...you can probably guess  =)  Luckilly I had an identically
> configured machine that I hadn't upgraded to 1.0 yet (same gcc 3.0
> compiler, etc) so I just copied the tools across to the other machine
> (beta 8 tools) and all is fine again.
> 
> If I am completely off base as to what is happening here, please correct
> me, and please also let me know how to solve this problem.

Tren,
that shouldn't be a problem because the default installation directory for
shared libraries is /lib which belongs to the root directory. LVM tools just
access any shread libraries from there unless you use the --libdir configure
option to chosse a different one.

If you are not able to mount the root filesystem (no matter on which block 
device including a logical volume it sits) you are in trouble anyway ;-)

> 
> As always I appreciate all help this list gives.
> 
> Regards,
> 
> Tren.

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
