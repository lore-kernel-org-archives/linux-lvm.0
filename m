Message-Id: <004e01c1d71d$7c587580$9865fea9@homecomputer>
From: "dan.am" <lvm@lonx.net>
References: <200203280951.g2S9p8h23250@lorus.lonx.net>
    <15805.1017323123@www6.gmx.net>
Subject: Re: [linux-lvm] VG lost, VG restorable without lvmconf? Need help!
MIME-Version: 1.0
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
Date: Fri Mar 29 06:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> > Are your disks Maxtor ?
>
> no and yes :)
> hda is IBM (30 GB)
> hdb is a Maxtor 61,4 GB / 5400
This probably has something to do with it. I have some Maxtor stuff too.
>
> I am afraid that I have no current backups of these files if backups at
> all :-(
This is a problem. Hmmmm...Try recreating your vol group config by running
"vgcreate" and "lvcreate" from command line. Do not use yast , as this will
call "vgscan" again
Or maybe:
1. mv /sbin/vgscan /sbin/vgscan.BOGUS
2. YasT to recreate VG.
In any case work carefully, since you are in trouble

Also try "vgcfgrestore" , but   assume it is broken too, as it was in my
case

HTH !

Dan
