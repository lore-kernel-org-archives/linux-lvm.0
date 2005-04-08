Date: Fri, 8 Apr 2005 15:25:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Debian (Sarge) 2.6.8 lvm2 on software raid
Message-ID: <20050408142541.GZ9049@agk.surrey.redhat.com>
References: <11707185.1112814904249.JavaMail.root@wamui03.slb.atl.earthlink.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11707185.1112814904249.JavaMail.root@wamui03.slb.atl.earthlink.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linuxboy123@mindspring.com" <linuxboy123@mindspring.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 06, 2005 at 03:15:03PM -0400, linuxboy123@mindspring.com wrote:
> I am running Debian (sarge) on a self-compiled 2.6.8.
> I have installed
> 	 lvm2 (lvm2_2.01.04-3_i386.deb) and 
> 	mdadm (mdadm_1.9.0-1_i386.deb).
 
Suggestions:

1) Check lvm.conf has md_component_detection = 1

2) Run lvcreate with -vvvv and look for clues (ie what reason does it give for
ignoring the device?)

3) Upgrade to lvm2 2.01.09 and see if is still a problem

Alasdair
