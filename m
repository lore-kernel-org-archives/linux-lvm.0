Return-Path: <root@srv.sistina.com>
Date: Mon, 21 May 2001 14:53:04 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and multiple distributions
Message-ID: <20010521145304.A10599@sistina.com>
References: <20010521112841.A28340@monster.exocore.com>
Mime-Version: 1.0
In-Reply-To: <20010521112841.A28340@monster.exocore.com>; from shanu@exocore.com on Mon, May 21, 2001 at 11:28:41AM +0530
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

On Mon, May 21, 2001 at 11:28:41AM +0530, Shanker Balan wrote:
> Hello:
> 
> I have been using LVM for some time on RHL 7.0 (with 7.1 updates) and
> things have been working excellent. LVM is k3wl.
> 
> Last week, i installed Debian on a another partition on the same machine
> and for some odd reason "vgchange -ay" sez "no volume groups found".
> 
> godzilla:~# vgchange -ay
> vgchange -- no volume groups found
> 
> Everything works correctly on RHL. What do i need to do under Debian to
> get the LVM partition up?

Did you run vgscan in order to read the metadata?
"vgchange -ay" afterwards.

> 
> I am using:
> 
> Debian Unstable
> Kernel 2.4.4 with LVM compiled in
> lvm 0.9.1beta7-1
> 
> RedHat Linux 7.1
> Kernel 2.4.4 with LVM compiled in
> 
> Fdisk output:
> godzilla:~# fdisk -l /dev/hda|grep -i lvm
> /dev/hda8          1803      2185   3076416   8e  Linux LVM
> 
> Thanx for your time.
> 
> -- Shanu
> 
>  -   -   -   -   -   -   -   -   -   -  - ( Shanu )  -  -
>  Shanker Balan							shanu@exocore.com
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
