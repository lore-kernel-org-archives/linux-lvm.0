Message-ID: <4B9FEF2D.4070608@redhat.com>
Date: Tue, 16 Mar 2010 21:50:53 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4B9FDAB6.3000302@alteeve.com>
In-Reply-To: <4B9FDAB6.3000302@alteeve.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Two questions about cluster support (2 problems,
 actually)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Digimer <linux@alteeve.com>

On 03/16/2010 08:23 PM, Digimer wrote:
>    Last year, when I last setup an LVM for cluster mode (running on a 
> DRBD partition in Primary/Primary mode), I needed to recompile the RPM 
> for CentOS 5.4 in order to get the liblvm2clusterlock.so to install. 

Don't do this. Use "locking_type = 3", or better, use
lvmconf --enable-cluster /--disable-cluster to set proper cluster locking type.

(locking_type = 2 was external locking which need that *.so,
3 is internal cluster locking - basically the same, just compiled in base package.
CentOS 5 should always use 3 for cluster locking.)

(but configuring DRBD is separate thing to clustered lvm)

> # pvdisplay
>    connect() failed on local socket: Connection refused
>    WARNING: Falling back to local file-based locking.
>    Volume Groups with the clustered attribute will be inaccessible.
>    "/dev/drbd0" is a new physical volume of "399.99 GB"

apparently clvmd is not running, you cannot see clustered PVs.

Anyway, the DRBD need to setup filters to work properly with lvm2,
(filter out underlying drbd device)
(or update to new lvm2 version, RHEL5/CentOS5 build will be available
in next minor update).
For more info see https://bugzilla.redhat.com/show_bug.cgi?id=530881
(not sure it is related, but for archive and other users...)

Milan
--
mbroz@redhat.com
