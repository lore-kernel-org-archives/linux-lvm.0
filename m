Message-ID: <0d3e01c206d0$7fc1b280$070414ac@Home.PIN.LU>
From: "Christian Limpach" <chris@Pin.LU>
References: <20020529004818.35501.qmail@web10105.mail.yahoo.com>
Subject: Re: [linux-lvm] can't use all VG free space for an LV stripe
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
Date: Wed May 29 00:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> my volume group has 48396 PEs free using three disks.  whenever i try to
setup
> a striped LV using 48396 PEs it fails with "please check, if physical
volumes
> are allocatable".

yes, I guess you can't stripe over a single disk. ;-)  i.e of those 48396
PEs only 43977 are on 3 disks, the rest is on a single disk.  With 43977 PEs
you get around 171G.

    christian
