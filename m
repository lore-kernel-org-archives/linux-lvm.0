Return-Path: <lembark@wrkhors.com>
Message-ID: <3B1FEFB6.93B4FBF7@wrkhors.com>
Date: Thu, 07 Jun 2001 16:18:46 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com> <20010607104301.A29848@stocks.pillory.com>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> cd / ; mv tmp tmp.old ; ln -s /var/tmp .
> reboot
> rm -rf /tmp.old
> 
>     Now you don't have to worry about root filling up at all...

until you have to boot in single user w/o /var mounted and
the whole sysystem fries for lack of /tmp :-)

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
