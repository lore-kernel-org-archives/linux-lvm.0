From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] How to mount volumes during boot
Message-ID: <5500000.1003729087@dizzy>
In-Reply-To: <8BFE9B4949BB4346A146F5231AEF1B87F3D5@CX975884-A.mdmiller.com>
References: <8BFE9B4949BB4346A146F5231AEF1B87F3D5@CX975884-A.mdmiller.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Mon Oct 22 10:39:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- "Mitchell D. Miller" <mitch@mdmiller.com>

> I am running Red Hat 7.1 (with 2.4.12 kernel) and LVM 1.0.1-rc4.  I read
> the documentation on Sistina's website about boot time scripts, but the
> info there seems to deal only with getting LVM loaded at boot time.
>
> I'm still uncertain how I should configure my system so the volumes I
> have created (three of them so far) get mounted during boot.  I tried
> modifying my fstab file, but the system didn't boot right after.  It
> stopped, complaining that one of the devices couldn't be mounted.  Is
> this even the right place to configure LVM volumes to be mounted?

Make sure that a vgchange -a y is in your rc.sysinit after
the root volume is remounted rw but before the othervolumes
are fsck-ed. After that mount -a will get them on line with
the rest of things.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
